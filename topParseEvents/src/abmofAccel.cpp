#include <iostream>
#include "ap_int.h"
#include "abmofAccel.h"

static col_pix_t glPLSlices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdx, glPLTminus1SliceIdx, glPLTminus2SliceIdx;


void sadSum(ap_int<BITS_PER_PIXEL+1> sum[BLOCK_SIZE], int16_t *sadRet)
{
	ap_int<16> tmp = 0;
	calOFLoop2:for(ap_uint<4> i = 0; i < BLOCK_SIZE; i++)
	{
		if(sum[i] < 0) sum[i] = -sum[i];
//		sum[i] = sum[i] < 0 ? ap_int<BITS_PER_PIXEL+1>(-sum[i]) : sum[i];
		tmp = tmp + sum[i];
	}

	*sadRet = tmp.to_short();
}

void sad(pix_t refBlock[BLOCK_SIZE], pix_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
	int16_t retVal = 0;
	ap_int<pix_t::width+1> sum[BLOCK_SIZE];
//	*sadRet = 0;

	DFRegion:
	{
		calOFLoop1:for(int16_t m = 0; m < BLOCK_SIZE; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
			sum[m] = tmpSum;
		}

		sadSum(sum, sadRet);
//		std::cout<<"sadRet is " << *sadRet << std::endl;
	}

}

void colSADSum(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1])
{
	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j];
			input2[j] = t2Col[i+j];
		}
		sad(input1, input2, &retVal[i]);
	}

}

void blockSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[2*SEARCH_DISTANCE + 1])
{
//	blockSADSumLoop:for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//	{
		pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
		int16_t out[2*SEARCH_DISTANCE + 1];

		// Convert the ap_fifo input interface to wires.
		readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			in1[j] = t1Block[j];
			in2[j] = t2Block[j];
		}

		std::cout << "in1 is: " << std::endl;
		for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			std::cout << in1[j] << " ";
		}
		std::cout << std::endl;

		std::cout << "in2 is: " << std::endl;
		for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			std::cout << in2[j] << " ";
		}
		std::cout << std::endl;

		colSADSum(in1, in2, out);

		// Convert the wires to ap_fifo output interface.
		outputRetLoop:for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
		{
			sumBlock[j] = out[j];
		}
//	}
}

// Function Description: return the minimum value of an array.
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1])
{
	ap_int<16> tmp = inArr[0];
	minLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE + 1; i++)
	{
		// Here is a bug. Use the if-else statement,
		// cannot use the question mark statement.
		// Otherwise a lot of muxs will be generated,
		// DON'T KNOW WHY. SHOULD BE A BUG.
		if(inArr[i] < tmp) tmp = inArr[i];
//		tmp = (inArr[i] < tmp) ? inArr[i] : tmp;
	}
	return tmp;
}




pix_t readPixFromCol(col_pix_t colData, ap_uint<8> idx)
{
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

pix_t readPixFromTwoCols(two_cols_pix_t colData, ap_uint<8> idx)
{
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
//	ap_uint<256> colIdxHi, colIdxLo;
//	colIdxHi = (ap_uint<8>(idx * BITS_PER_PIXEL)(8,2), ap_uint<2>(0));
//	colIdxLo = (ap_uint<8>(idx * BITS_PER_PIXEL)(8,2), ap_uint<2>(BITS_PER_PIXEL - 1));
//	retData = colData(colIdxHi, colIdxLo);
	readTwoColsWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

void writePixToCol(col_pix_t *colData, ap_uint<8> idx, pix_t pixData)
{
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		(*colData)[colIdx] = pixData[yIndex];
	}
}

void resetPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	return readPixFromCol(glPLSlices[sliceIdx][x][y/COMBINED_PIXELS], y%COMBINED_PIXELS);
}

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	col_pix_t tmpData;
	pix_t tmpTmpData;

	ap_uint<8> yNewIdx = y%COMBINED_PIXELS;

	tmpData = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS];

	tmpTmpData = readPixFromCol(tmpData, yNewIdx);

	tmpTmpData +=  1;

	writePixToCol(&tmpData, yNewIdx, tmpTmpData);

	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = tmpData;
}



void miniSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
	// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
	static ap_int<16> miniRetVal = 0x7fff;
	static ap_int<16> miniRetValTmpIter;
	static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
	static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];
	static int16_t shiftCnt = 0;

	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	for (int8_t i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			in1[j] = t1Block[i][j];
			in2[j] = t2Block[i][j];
		}
	}

	colSADSum(in1, in2, out);

	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = miniSumTmp[i] + out[i] - localSumReg[0][i];
//		miniRetVal = (miniRetValTmpIter < miniSumTmp[i]) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniSumTmp[i];
//		else miniRetVal[i] = miniRetVal[i];
	}

	std::cout << "miniSumTmp from HW is: " << std::endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		std::cout << miniSumTmp[m] << " ";
	}
	std::cout << std::endl;

	std::cout << "Old miniRetVal from HW is: " << miniRetVal << std::endl;

	miniRetValTmpIter = min(miniSumTmp);
	// Use a new register to store the old value and use the return value as the new value.
	miniRetVal = (miniRetValTmpIter < miniRetVal) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniRetVal;

	std::cout << "New miniRetVal from HW is: " << miniRetVal << std::endl;

	shiftMainLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	shiftLastLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[2*SEARCH_DISTANCE][j] = out[j];
	}

	shiftCnt++;

//	outputRetLoop:for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
//	{
		*miniSumRet = miniRetVal;
//	}
}


void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	for(int8_t j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		two_cols_pix_t refColData;
		// concatenate two columns together
		refColData = (glPLSlices[sliceIdxRef][x + j][y/COMBINED_PIXELS], glPLSlices[sliceIdxRef][x + j][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// concatenate two columns together
		two_cols_pix_t tagColData;
		// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
		tagColData = (glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x + j][y/COMBINED_PIXELS], glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x + j][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// find the bottom pixel of the column that centered on y.
		ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

		readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			refCol[j][i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
			tagCol[j][i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
			yColOffsetIdx++;
		}
	}
}

void readBlockColsAndMiniSADSum(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, ap_int<16> *miniSumRet)
{
	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	readBlockCols(x, y , idx + 1, idx + 2, in1, in2);
	miniSADSum(in1, in2, miniSumRet);
}

void topHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, ap_int<16> *miniSumRet)
{
	writePix(x, y, idx);
	resetPix(x, y, idx + 3);

	innerLoop_1: for (int8_t k = 0; k < 2; k++)
	{
		readBlockColsAndMiniSADSum(x + k, y, idx + 1, miniSumRet);
	}
}

void parseEvents(const uint64_t * data, int32_t eventsArraySize, int32_t *eventSlice)
{
	glPLActiveSliceIdx++;
	// Every event always consists of 2 int32_t which is 8bytes.
	loop_1:for(int32_t i = 0; i < eventsArraySize; i++)
	{
		uint64_t tmp = data[i];
		ap_uint<8> x = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		ap_uint<8> y = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		ap_int<16> miniSumRet;
		writePix(x, y, glPLActiveSliceIdx);
		resetPix(x, y, glPLActiveSliceIdx + 3);
		topHW(x, y, glPLActiveSliceIdx + 1, &miniSumRet);

		*eventSlice = x + (y << 8) + (miniSumRet << 16);
		eventSlice++;
	}
}

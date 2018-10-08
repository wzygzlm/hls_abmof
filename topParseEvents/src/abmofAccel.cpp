#include <iostream>
#include "ap_int.h"
#include "abmofAccel.h"

static col_pix_t glPLSlices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdx = 0, glPLTminus1SliceIdx, glPLTminus2SliceIdx;

#define INPUT_COLS 4

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
//	std::cout << "HW in1 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t1Col[m] << " ";
//	}
//	std::cout << std::endl;
//
//	std::cout << "HW in2 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t2Col[m] << " ";
//	}
//	std::cout << std::endl;

	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j + SEARCH_DISTANCE];   // Get the col data centered on current event.
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
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1], int8_t *index)
{
	ap_int<16> tmp = inArr[0];
	int8_t tmpIdx = 0;
	minLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE + 1; i++)
	{
		// Here is a bug. Use the if-else statement,
		// cannot use the question mark statement.
		// Otherwise a lot of muxs will be generated,
		// DON'T KNOW WHY. SHOULD BE A BUG.
		if(inArr[i] < tmp) tmpIdx = i;
		if(inArr[i] < tmp) tmp = inArr[i];
//		tmp = (inArr[i] < tmp) ? inArr[i] : tmp;
	}
	*index = tmpIdx;
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

// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
static ap_int<16> miniRetVal = 0x7fff;
static ap_uint<6> minOFRet = ap_uint<6>(0xff);
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
static ap_int<16> localSumReg[BLOCK_SIZE][2*SEARCH_DISTANCE + 1];

static uint16_t eventIterSize = 100;

void miniSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t shiftCnt,
		ap_int<16> *miniSumRet,
		ap_uint<6> *OFRet
		)
{
	ap_int<16> miniRetValTmpIter;

	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		in1[j] = t1Block[j];
		in2[j] = t2Block[j];
	}

//	miniRetVal = (shiftCnt == 1) ? ap_int<16>(0x7fff) : miniRetVal;
//
//	initMiniSumLoop : for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//	{
//		miniSumTmp[i] = (shiftCnt == 1) ? ap_int<16>(0) : miniSumTmp[i];
//	}

	colSADSum(in1, in2, out);

	ap_uint<1> cond1 = (shiftCnt > BLOCK_SIZE - 1) ? 1 : 0;
//	std::cout << "shiftCnt is: " << shiftCnt << std::endl;
//	std::cout << "cond1 is: " << cond1 << std::endl;
//
//	std::cout << "localSumReg[0] from HW is: " << std::endl;
//	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << localSumReg[0][m] << " ";
//	}
//	std::cout << std::endl;

	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		ap_int<16> tmpMiniSumTmp = miniSumTmp[i] + out[i];
		ap_int<16> tmpMinius = tmpMiniSumTmp - localSumReg[0][i];
		miniSumTmp[i] = (shiftCnt > BLOCK_SIZE) ? tmpMinius : tmpMiniSumTmp;  // Notice: this condition is not cond1.
//		miniRetVal = (miniRetValTmpIter < miniSumTmp[i]) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniSumTmp[i];
//		else miniRetVal[i] = miniRetVal[i];
	}

//	std::cout << "miniSumTmp from HW is: " << std::endl;
//	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << miniSumTmp[m] << " ";
//	}
//	std::cout << std::endl;
//
//	std::cout << "Old miniRetVal from HW is: " << miniRetVal << std::endl;

	int8_t retIdx;
	miniRetValTmpIter = min(miniSumTmp, &retIdx);
	ap_uint<1> cond2 = (miniRetValTmpIter < miniRetVal) ? 1 : 0;

	// Use a new register to store the old value and use the return value as the new value.
//	miniRetVal = (miniRetValTmpIter < miniRetVal) && (shiftCnt > 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniRetVal;
	miniRetVal = (cond2) && (cond1) ? miniRetValTmpIter : miniRetVal;

//	std::cout << "New miniRetVal from HW is: " << miniRetVal << std::endl;

	// TODO: change the localSumReg to a hls stream with depth BLOCK_SIZE.
	shiftMainLoop: for(int8_t i = 0; i < BLOCK_SIZE - 1; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	shiftLastLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[BLOCK_SIZE - 1][j] = out[j];
	}

	*miniSumRet = miniRetVal;

	ap_uint<3> OFRet_x = shiftCnt - BLOCK_SIZE;
	ap_uint<3> OFRet_y = ap_uint<3>(retIdx);

	minOFRet = (cond2) && (cond1) ? ap_uint<6>(OFRet_y.concat(OFRet_x)) : minOFRet;  // TODO: add a flag to indicate the result valid or not. Use 0 to represent the invalid result.
	*OFRet = minOFRet;

//	std::cout << "miniSumRetHW is: " << *miniSumRet << "\t OFRetHW is: " << std::hex << *OFRet << std::endl;
//	std::cout << std::dec;    // Restore dec mode
}


void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{

		two_cols_pix_t refColData;
		// concatenate two columns together
		refColData = (glPLSlices[sliceIdxRef][x][y/COMBINED_PIXELS], glPLSlices[sliceIdxRef][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// concatenate two columns together
		two_cols_pix_t tagColData;
		// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
		tagColData = (glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// find the bottom pixel of the column that centered on y.
		ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

		readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			refCol[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
			tagCol[i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
			yColOffsetIdx++;
		}

}

void readBlockColsAndMiniSADSum(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, int16_t shiftCnt, ap_int<16> *miniSumRet)
{
	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	ap_uint<6> OFRet;

	readBlockCols(x, y , idx + 1, idx + 2, in1, in2);
	miniSADSum(in1, in2, shiftCnt, miniSumRet, &OFRet);
}

static uint16_t areaEventRegs[AREA_NUMBER][AREA_NUMBER];
static uint16_t areaEventThr = 2000;

void rotateSlice(hls::stream<uint8_t>  &xInStream, hls::stream<uint8_t> &yInStream,
				 hls::stream<uint8_t> &xOutStream, hls::stream<uint8_t> &yOutStream, hls::stream<sliceIdx_t> &idxStream)
{
	ap_uint<(AREA_NUMBER * AREA_NUMBER)> compArray[AREA_NUMBER][AREA_NUMBER];
	ap_uint<1> compRet = 0;

	rotateSliceOutLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		ap_uint<8> x, y;
		x = xInStream.read();
		y = yInStream.read();

		uint16_t c = areaEventRegs[x/AREA_SIZE][y/AREA_SIZE];
		c = c + 1;
		areaEventRegs[x/AREA_SIZE][y/AREA_SIZE] = c;


		// The area threshold reached, rotate the slice index and clear the areaEventRegs.
		if (c > areaEventThr)
		{
			glPLActiveSliceIdx--;

			rotateSliceResetLoop:for(int areaX = 0; areaX < AREA_NUMBER; areaX++)
			{
				for(int areaY = 0; areaY < AREA_NUMBER; areaY++)
				{
					areaEventRegs[areaX][areaY] = 0;
				}
			}
		}

		xOutStream.write(x);
		yOutStream.write(y);
		idxStream.write(glPLActiveSliceIdx);
	}
}

void getXandY(const uint64_t * data, hls::stream<uint8_t>  &xStream, hls::stream<uint8_t> &yStream, hls::stream<apUint17_t> &packetEventDataStream)
//void getXandY(const uint64_t * data, int32_t eventsArraySize, ap_uint<8> *xStream, ap_uint<8> *yStream)
{

	// Every event always consists of 2 int32_t which is 8bytes.
	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		uint64_t tmp = data[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

//		writePix(xWr, yWr, glPLActiveSliceIdx);
//		resetPix(xWr, yWr, glPLActiveSliceIdx + 3);

//		shiftCnt = 0;
//		miniRetVal = 0x7fff;
//		for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//		{
//				miniSumTmp[i] = 0;
//		}
//		for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//		{
//			for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
//			{
//				localSumReg[i][j] = 0;
//			}
//		}

		xStream << xWr;
		yStream << yWr;
		packetEventDataStream << apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
//		*xStream++ = xWr;
//		*yStream++ = yWr;
	}
}

void rwSlices(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
			  hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut)
{
	ap_uint<8> xRd;
	ap_uint<8> yRd;
	sliceIdx_t idx;

	rwSlicesLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		rwSlicesInnerLoop:for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; xOffSet++)
		{
//			xRd = (xOffSet == 0)? (ap_uint<8>)(xStream.read()): xRd;
//			yRd = (xOffSet == 0)? (ap_uint<8>)(yStream.read()): yRd;
			if (xOffSet == 0)
			{
				xRd = xStream.read();
				yRd = yStream.read();
				idx = idxStream.read();

				writePix(xRd, yRd, idx);

				resetPix(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i/(PIXS_PER_COL), (i % (PIXS_PER_COL) + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i, 64, (sliceIdx_t)(idx + 3));
//				resetPix(i, 96, (sliceIdx_t)(idx + 3));

//				resetPix(i, 128, (sliceIdx_t)(idx + 3));
//				resetPix(i, 160, (sliceIdx_t)(idx + 3));
//				resetPix(i, 192, (sliceIdx_t)(idx + 3));
//				resetPix(i, 224, (sliceIdx_t)(idx + 3));
			}
			else
			{
				pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

	//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

				readBlockCols(xRd + xOffSet - 1, yRd , idx + 1, idx + 2, out1, out2);

				apIntBlockCol_t refBlockCol;
				apIntBlockCol_t tagBlockCol;

				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
					tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
				}

				refStreamOut << refBlockCol;
				tagStreamOut << tagBlockCol;
			}
		}
	}

	resetLoop: for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
	}

}

void miniSADSumWrapper(hls::stream<apIntBlockCol_t> &refStreamIn, hls::stream<apIntBlockCol_t> &tagStreamIn, hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream)
//void miniSADSumWrapper(ap_uint<8> *xStream, ap_uint<8> *yStream, sliceIdx_t idx, int32_t eventsArraySize, ap_int<16> *miniSumRet)
{
	wrapperLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		ap_int<16> miniRet;
		ap_uint<6> OFRet = 0;    // TODO: maybe change the initial value.
		innerLoop_1: for (int8_t k = 0; k < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; k++)
		{
			if (k == 0)    // Initialization code
			{
				miniRetVal = ap_int<16>(0x7fff);
				minOFRet = ap_uint<6>(0xff);

				initMiniSumLoop : for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
				{
					miniSumTmp[j] = ap_int<16>(0);
				}
			}
			else
			{
				pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

				apIntBlockCol_t refBlockCol = refStreamIn.read();
				apIntBlockCol_t tagBlockCol = tagStreamIn.read();

				// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
				// to calculate the range function. However, unroll it completely will make all this operations
				// are only wires connection and will not consume any resources.
				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					in1[l] = refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
					in2[l] = tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				}

				miniSADSum(in1, in2, k, &miniRet, &OFRet);   // Here k starts from 1 not 0.
			}
		}
		miniSumStream.write(apUint15_t(miniRet));
		OFRetStream.write(apUint6_t(OFRet));
	}
}

void outputResult(hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream,  hls::stream<apUint17_t> &packetEventDataStream, int32_t *eventSlice)
{
	outputLoop: for(int32_t i = 0; i < eventIterSize; i++)
	{
		apUint17_t tmp1 = packetEventDataStream.read();
		ap_int<9> tmp2 = miniSumStream.read().range(8, 0);
		apUint6_t tmpOF = OFRetStream.read();
		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
		*eventSlice++ = output.to_int();
	}
}

void testMiniSADSumWrapper(apIntBlockCol_t *input1, apIntBlockCol_t *input2, int16_t eventCnt, apUint15_t *miniSum, apUint6_t *OF)
{
	hls::stream<apUint6_t> OFRetStream("OFStream");
	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
	hls::stream<apUint15_t> miniSumStream("miniSumStream");

	eventIterSize = eventCnt;

	apIntBlockCol_t inData1, inData2;

	readToStream:for(int32_t i = 0; i < eventIterSize * (BLOCK_SIZE + 2 * SEARCH_DISTANCE); i++)
	{
		inData1 = *input1++;
		inData2 = *input2++;

		refStream.write(inData1);
		tagStreamIn.write(inData2);
	}

	miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);

	writeFromStream:for(int32_t i = 0; i < eventIterSize; i++)
	{
		miniSumStream.read(*miniSum++);
		OFRetStream.read(*OF++);
	}
}

void testSingleRwslicesHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePix(x, y, idx);
	readBlockCols(x, y, idx + 1, idx + 2, refCol, tagCol);
	resetPix(x, y, idx + 3);
}

void testRwslices(uint64_t * data, sliceIdx_t idx, int16_t eventCnt,
			  apIntBlockCol_t *refData, apIntBlockCol_t *tagData)
{
	hls::stream<uint8_t>  xStream("xStream"), yStream("yStream");
	hls::stream<sliceIdx_t> idxStream("idxStream");
	hls::stream<apUint17_t> pktEventDataStream("EventStream");
	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");

	eventIterSize = eventCnt;

	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		uint64_t tmp = data[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		xStream << xWr;
		yStream << yWr;
		idxStream << idx;
	}

	rwSlices(xStream, yStream, idxStream, refStream, tagStreamIn);

	writeFromStream: for(int32_t i = 0; i < eventIterSize * (BLOCK_SIZE + 2 * SEARCH_DISTANCE); i++)
	{
		refStream >> *refData++;
		tagStreamIn >> *tagData++;
	}

}

void testTemp(uint64_t * data, sliceIdx_t idx, int16_t eventCnt,
		int32_t *eventSlice)
{
	hls::stream<uint8_t>  xStream("xStream"), yStream("yStream");
	hls::stream<sliceIdx_t> idxStream("idxStream");
	hls::stream<apUint17_t> pktEventDataStream("EventStream");
	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
	hls::stream<apUint15_t> miniSumStream("miniSumStream");
	hls::stream<apUint6_t> OFRetStream("OFStream");

	eventIterSize = eventCnt;

	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		uint64_t tmp = data[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		xStream << xWr;
		yStream << yWr;
		idxStream << idx;
		pktEventDataStream << apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
	}

	rwSlices(xStream, yStream, idxStream, refStream, tagStreamIn);
	miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
	outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice);
}

void parseEvents(uint64_t * dataStream, int32_t eventsArraySize, int32_t *eventSlice)
{
	DFRegion:
	{
		hls::stream<uint8_t>  xInStream("xInStream"), yInStream("yInStream");
		hls::stream<uint8_t>  xOutStream("xOutStream"), yOutStream("yOutStream");
		hls::stream<sliceIdx_t> idxStream("idxStream");
		hls::stream<apUint17_t> pktEventDataStream("EventStream");
		hls::stream<apUint6_t> OFRetStream("OFStream");
		hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
		hls::stream<apUint15_t> miniSumStream("miniSumStream");

//		glPLActiveSliceIdx--;

		eventIterSize = eventsArraySize;

		getXandY(dataStream, xInStream, yInStream, pktEventDataStream);
		rotateSlice(xInStream, yInStream, xOutStream, yOutStream, idxStream);
		rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
		miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
		outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice);

	}
}

#include "calcDataFlow.h"
#include <iostream>
//#include "hls_video.h"


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

void sad(pixel_t refBlock[BLOCK_SIZE], pixel_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
	int16_t retVal = 0;
	ap_int<pixel_t::width+1> sum[BLOCK_SIZE];
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

void colSADSum(pixel_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pixel_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1])
{
	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pixel_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j];
			input2[j] = t2Col[i+j];
		}
		sad(input1, input2, &retVal[i]);
	}

}

void blockSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[2*SEARCH_DISTANCE + 1])
{
//	blockSADSumLoop:for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//	{
		pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
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


void miniSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
	// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
	static ap_int<16> miniRetVal = 0x7fff;
	static ap_int<16> miniRetValTmpIter;
	static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
	static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];
	static int16_t shiftCnt = 0;

	pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		in1[j] = t1Block[j];
		in2[j] = t2Block[j];
	}

	colSADSum(in1, in2, out);

	static ap_int<16> tmpLocalSum[2*SEARCH_DISTANCE + 1];

	// Notice here, it's ">" not ">=" and depth should be 2*SEARCH_DISTANC + 1 + 1
	if (shiftCnt > 2 * SEARCH_DISTANCE)
	{
		readFIFOLoop: for(int8_t k = 0; k <= 2*SEARCH_DISTANCE; k++)
		{
//			tmpLocalSum[k] = localSumReg[2*SEARCH_DISTANCE][k];
			tmpLocalSum[k] = (*localSumReg)[k];
		}
	}

	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = miniSumTmp[i] + out[i] - tmpLocalSum[i];
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

//	shiftMainLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE; i++)
//	{
//		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
//		{
//			localSumReg[i][j] = localSumReg[i + 1][j];
//		}
//	}

	writeFIFOLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
//		localSumReg[0][j] = out[j];
		(*localSumReg)[j] = out[j];
	}

	shiftCnt++;

//	outputRetLoop:for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
//	{
		*miniSumRet = miniRetVal;
//	}
}


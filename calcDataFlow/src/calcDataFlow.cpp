#include "calcDataFlow.h"
#include <iostream>
//#include "hls_video.h"
#include <hls_stream.h>
using namespace hls;

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

// Function Description: return the minimum value of an array, based on hls:stream
typedef ap_int<16> apInt16;
typedef ap_int<112> apInt112;
void minStream(stream<apInt112> &strm_in, stream<apInt16> &strm_out)
{
	apInt112 strmData = strm_in.read();
	ap_int<16> inArr[2*SEARCH_DISTANCE + 1];

	expandLoop: for(int8_t i = 0; i < 7; i++)
	{
		inArr[i] = strmData(16 * i + 15, 16  * i);
	}

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
	strm_out.write(tmp);
}


static ap_int<16> miniRetVal = 0x7fff;
static ap_int<16> miniRetValTmpIter;
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];
static int16_t shiftCnt = 0;

void miniSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
	// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.


	pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		in1[j] = t1Block[j];
		in2[j] = t2Block[j];
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

void updateMiniSumTmp(int16_t out[2*SEARCH_DISTANCE + 1])
{
	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = miniSumTmp[i] + out[i] - localSumReg[0][i];
//		miniRetVal = (miniRetValTmpIter < miniSumTmp[i]) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniSumTmp[i];
//		else miniRetVal[i] = miniRetVal[i];
	}
}

void testPipelinedMiniSADSum(pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
	pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],  t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	Loop_1: for(int8_t i = 0; i < 17; i++)
	{
		for(int8_t j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			t1Block[j] = in1[i][j];
			t2Block[j] = in2[i][j];
		}

		int16_t out[2*SEARCH_DISTANCE + 1];
		colSADSum(t1Block, t2Block, out);

//		updateMiniSumTmp(out);

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
}

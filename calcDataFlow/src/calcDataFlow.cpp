#include "calcDataFlow.h"
#include <iostream>
//#include "hls_video.h"


void sadSum(ap_int<BITS_PER_PIXEL+1> sum[BLOCK_SIZE], int16_t *sadRet)
{
	ap_int<16> tmp = 0;
	calOFLoop2:for(ap_uint<4> i = 0; i < BLOCK_SIZE; i++)
	{
		if(sum[i] < 0) sum[i] = -sum[i];
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
		std::cout<<"sadRet is " << *sadRet << std::endl;
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

void blockSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][2*SEARCH_DISTANCE + 1])
{
//	int16_t retVal[BLOCK_SIZE + 2 * SEARCH_DISTANCE][2*SEARCH_DISTANCE + 1]);

//	blockSADSumLoop:for(int16_t m = 0; m < 4; m++)
//	{
		colSADSum(t1Block[0], t2Block[0], sumBlock[0]);
		colSADSum(t1Block[1], t2Block[1], sumBlock[1]);
		colSADSum(t1Block[2], t2Block[2], sumBlock[2]);
		colSADSum(t1Block[3], t2Block[3], sumBlock[3]);
//	}
}


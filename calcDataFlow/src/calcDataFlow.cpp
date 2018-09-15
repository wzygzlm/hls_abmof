#include "calcDataFlow.h"
#include <iostream>
#include "hls_video.h"

typedef ap_int<BITS_PER_PIXEL> pixel_t;

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

void calcOF(pixel_t refBlock[BLOCK_SIZE], pixel_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
	int16_t retVal = 0;
	ap_int<pixel_t::width+1> sum[BLOCK_SIZE];
//	*sadRet = 0;

	DFRegion:
	{
		calOFLoop1:for(int16_t m = 0; m < BLOCK_SIZE; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
			std::cout<<"tmpSum is" << tmpSum.to_char() << std::endl;
			sum[m] = tmpSum;
		}

		sadSum(sum, sadRet);
	}

}


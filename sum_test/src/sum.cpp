#include "ap_int.h"
#include<stdint.h>

#define BLOCK_SIZE 21
#define BITS_PER_PIXEL 4

void sum(ap_int<BITS_PER_PIXEL> refBlock[BLOCK_SIZE][BLOCK_SIZE], ap_int<BITS_PER_PIXEL> targetBlocks[BLOCK_SIZE][BLOCK_SIZE], int32_t * sum)
{
	*sum = 0;

	calOFLoop1:for(int8_t m = 0; m < BLOCK_SIZE; m++)
	{
		calOFInnerLoop1:for(int8_t n = 0; n < BLOCK_SIZE; n++)
		{
			ap_int<5> tmpSum = refBlock[m][n] - targetBlocks[m][n];
			if ( tmpSum < 0)
			{
				*sum = *sum - tmpSum;
			}
			else
			{
				*sum = *sum + tmpSum;
			}
		}
	}
}


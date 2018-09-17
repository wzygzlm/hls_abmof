#ifndef CALCDATAFLOW
#define CALCDATAFLOW

#include<stdint.h>
#include "ap_int.h"

#define BLOCK_SIZE 11
#define BITS_PER_PIXEL 4
#define SEARCH_DISTANCE 3

typedef ap_int<BITS_PER_PIXEL> pixel_t;

void colSADSum(pixel_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pixel_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1]);

void blockSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][2*SEARCH_DISTANCE + 1]);
#endif

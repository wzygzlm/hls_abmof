#ifndef CALCDATAFLOW
#define CALCDATAFLOW

#include<stdint.h>
#include "ap_int.h"

#define BLOCK_SIZE 11
#define BITS_PER_PIXEL 4
#define SEARCH_DISTANCE 3

void calcOF(ap_int<BITS_PER_PIXEL> refBlock[BLOCK_SIZE], ap_int<BITS_PER_PIXEL> targetBlocks[BLOCK_SIZE], int16_t * sum);

#endif

#ifndef CALCDATAFLOW
#define CALCDATAFLOW

#include<stdint.h>
#include "ap_int.h"

#define BLOCK_SIZE 15
#define BITS_PER_PIXEL 4

void calcOF(ap_int<BITS_PER_PIXEL> refBlock[BLOCK_SIZE], ap_int<BITS_PER_PIXEL> targetBlocks[BLOCK_SIZE], int16_t * sum);

#endif

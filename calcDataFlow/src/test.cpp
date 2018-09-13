#include "calcDataFlow.h"

int main()
{
	ap_int<BITS_PER_PIXEL> refCol[BLOCK_SIZE];
	ap_int<BITS_PER_PIXEL> targetCol[BLOCK_SIZE];
	int16_t * sum;

	calcOF(refCol, targetCol, sum);
	return 0;
}

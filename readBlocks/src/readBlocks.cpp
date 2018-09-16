#include <iostream>
#include "ap_int.h"

#define SLICES_NUMBER 3
#define DVS_WIDTH  240
#define DVS_HEIGHT 180

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 16

#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3

typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;

void calcOF(int16_t x, int16_t y, col_pix_t glPLSlice0[DVS_WIDTH][DVS_HEIGHT/COMBINED_PIXELS], col_pix_t glPLSlice1[DVS_WIDTH][DVS_HEIGHT/COMBINED_PIXELS])
{

}

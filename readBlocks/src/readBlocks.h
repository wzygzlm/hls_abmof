#ifndef READBLOCKS
#define READBLOCKS

#include<stdint.h>

#define POLARITY_SHIFT 1
#define POLARITY_MASK 0x00000001
#define POLARITY_Y_ADDR_SHIFT 2
#define POLARITY_Y_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs
#define POLARITY_X_ADDR_SHIFT 17
#define POLARITY_X_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs

#define SLICES_NUMBER 3
#define SLICE_WIDTH  256
#define SLICE_HEIGHT 256

#define DVS_WIDTH  240
#define DVS_HEIGHT 180

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 16

#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3

typedef ap_int<BITS_PER_PIXEL> pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;
typedef ap_uint<2> sliceIdx_t;

void readCols(ap_uint<9> x, ap_uint<9> y, ap_int<5> colOffset);

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);
pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);

pix_t testWriteAndReadHW(ap_uint<8> xArray, ap_uint<8> yArray, sliceIdx_t idx);

#endif

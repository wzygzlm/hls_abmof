#ifndef ABMOFACCEL
#define ABMOFACCEl

#include<stdint.h>
#include "hls_stream.h"

#define POLARITY_SHIFT 1
#define POLARITY_MASK 0x00000001
#define POLARITY_Y_ADDR_SHIFT 2
#define POLARITY_Y_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs
#define POLARITY_X_ADDR_SHIFT 17
#define POLARITY_X_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs

#define SLICES_NUMBER 4
#define SLICE_WIDTH  256
#define SLICE_HEIGHT 256

#define DVS_WIDTH  240
#define DVS_HEIGHT 180

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 32

#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3
#define AREA_NUMBER 8
#define AREA_SIZE (SLICE_WIDTH/AREA_NUMBER)

#define BLOCK_COL_PIXELS BITS_PER_PIXEL * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)

typedef ap_int<BITS_PER_PIXEL> pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL * 2> two_cols_pix_t;
typedef ap_uint<2> sliceIdx_t;

typedef ap_int<BLOCK_COL_PIXELS> apIntBlockCol_t;
typedef ap_uint<17> apUint17_t;
typedef ap_uint<15> apUint15_t;
typedef ap_uint<6> apUint6_t;

#define BLOCK_COL_PIXELS BITS_PER_PIXEL * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)
#define PIXS_PER_COL (SLICE_HEIGHT/COMBINED_PIXELS)

void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE]);

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);
pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);

void topHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, ap_int<16> *miniSumRet);

ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1], int8_t *index);
void miniSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t shiftCnt,
		ap_int<16> *miniSumRet,
		ap_uint<6> *OFRet
		);

void miniSADSumWrapper(hls::stream<apIntBlockCol_t> &refStreamIn, hls::stream<apIntBlockCol_t> &tagStreamIn,
						hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream);

void testMiniSADSumWrapper(apIntBlockCol_t *input1, apIntBlockCol_t *input2, int16_t eventCnt, apUint15_t *miniSum, apUint6_t *OF);

void testSingleRwslicesHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE]);

void testRwslices(uint64_t * data, sliceIdx_t idx, int16_t eventCnt, apIntBlockCol_t *refData, apIntBlockCol_t *tagData);

void testTemp(uint64_t * data, sliceIdx_t idx, int16_t eventCnt,
		int32_t *eventSlice);

void parseEvents(uint64_t * dataStream, int32_t eventsArraySize, int32_t *eventSlice);

#endif

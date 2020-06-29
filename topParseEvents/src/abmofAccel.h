#ifndef ABMOFACCEL
#define ABMOFACCEl

#include<stdint.h>
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include <math.h>

// #define DEBUG
#define CUST_DATA_MASK 0x3ff
#define POLARITY_SHIFT 11
#define POLARITY_MASK (1 << POLARITY_SHIFT)  // 1 bit at bit 11
#define POLARITY_Y_ADDR_SHIFT 22
#define POLARITY_Y_ADDR_MASK (511 << POLARITY_Y_ADDR_SHIFT) // 9 bits from bits 22 to 30
#define POLARITY_X_ADDR_SHIFT 12
#define POLARITY_X_ADDR_MASK (1023 << POLARITY_X_ADDR_SHIFT) // 10 bits from bits 12 to 21

#define AEDAT_POLARITY_SHIFT 11
#define AEDAT_POLARITY_MASK (1 << AEDAT_POLARITY_SHIFT)  // 1 bit at bit 11
#define AEDAT_POLARITY_Y_ADDR_SHIFT 22
#define AEDAT_POLARITY_Y_ADDR_MASK (511 << AEDAT_POLARITY_Y_ADDR_SHIFT) // 9 bits from bits 22 to 30
#define AEDAT_POLARITY_X_ADDR_SHIFT 12
#define AEDAT_POLARITY_X_ADDR_MASK (1023 << AEDAT_POLARITY_X_ADDR_SHIFT) // 10 bits from bits 12 to 21

#define SLICES_NUMBER 4
#define SLICE_WIDTH  512
#define SLICE_HEIGHT 512

#define DVS_WIDTH  346
#define DVS_HEIGHT 260

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 32

// ABMOF parameters, hardcoded:
#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3
#define AREA_NUMBER 32
#define AREA_SIZE (SLICE_WIDTH/AREA_NUMBER)
#define INIT_AREA_THERSHOLD 700
#define MAX_SLICE_DURATION_US 300000

// Valid pixel occupancy paramter
const float glValidPixOccupancy = 0.01;
const int glMinValidPixNum = ceil(glValidPixOccupancy * (BLOCK_SIZE * BLOCK_SIZE));

#define BLOCK_COL_PIXELS BITS_PER_PIXEL * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)
#define COL_BITS BITS_PER_PIXEL * (BLOCK_SIZE)

typedef ap_axiu<64,1,1,1> inputDataElement;
typedef ap_axiu<32,1,1,1> outputDataElement_t;

typedef ap_uint<BITS_PER_PIXEL> pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL * 2> two_cols_pix_t;
typedef ap_uint<2> sliceIdx_t;

typedef ap_int<BLOCK_COL_PIXELS> apIntBlockCol_t;
typedef ap_int<COL_BITS> apIntColBits_t;
typedef ap_uint<17> apUint17_t;
typedef ap_uint<15> apUint15_t;
typedef ap_uint<6> apUint6_t;
typedef ap_uint<1> apUint1_t;
typedef ap_uint<16 * (2 * SEARCH_DISTANCE + 1)> apUint112_t;
typedef ap_uint<6 * (2 * SEARCH_DISTANCE + 1)> apUint42_t;
typedef ap_uint<10> apUint10_t;

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

void feedback(apUint15_t miniSumRet, apUint6_t OFRet, apUint1_t rotateFlg, uint16_t *thrRet);

void parseEvents(uint64_t * dataStream, int32_t eventsArraySize, int32_t *eventSlice);

void rwSlices(hls::stream<apUint10_t> &xStream, hls::stream<apUint10_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
			  hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut,
			  hls::stream<apIntBlockCol_t> &refStreamOutScale1, hls::stream<apIntBlockCol_t> &tagStreamOutScale1,
			  hls::stream<apIntBlockCol_t> &refStreamOutScale2, hls::stream<apIntBlockCol_t> &tagStreamOutScale2);

void EVABMOFStream(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn, hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<16> > &xStreamOut, hls::stream< ap_uint<16> > &yStreamOut, hls::stream< ap_uint<64> > &tsStreamOut, hls::stream< ap_uint<1> > &polStreamOut,
		hls::stream< ap_uint<10> > &pixelDataStream,
		ap_uint<32> config, ap_uint<32> *status);

void EVABMOFStreamNoConfigNoStaus(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn, hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<16> > &xStreamOut, hls::stream< ap_uint<16> > &yStreamOut, hls::stream< ap_uint<64> > &tsStreamOut, hls::stream< ap_uint<1> > &polStreamOut,
		hls::stream< ap_uint<10> > &pixelDataStream);
#endif

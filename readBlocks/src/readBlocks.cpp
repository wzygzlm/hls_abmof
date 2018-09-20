#include <iostream>
#include "ap_int.h"
#include "readBlocks.h"

static col_pix_t glPLSlices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdx, glPLTminus1SliceIdx, glPLTminus2SliceIdx;

pix_t readPixFromCol(col_pix_t colData, ap_uint<8> idx)
{
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

pix_t readPixFromTwoCols(two_cols_pix_t colData, ap_uint<8> idx)
{
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readTwoColsWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

void writePixToCol(col_pix_t *colData, ap_uint<8> idx, pix_t pixData)
{
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		(*colData)[BITS_PER_PIXEL*idx + yIndex] = pixData[yIndex];
	}
}

void resetPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	return readPixFromCol(glPLSlices[sliceIdx][x][y/COMBINED_PIXELS], y%COMBINED_PIXELS);
}

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	col_pix_t tmpData;
	pix_t tmpTmpData;

	ap_uint<8> yNewIdx = y%COMBINED_PIXELS;

	tmpData = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS];

	tmpTmpData = readPixFromCol(tmpData, yNewIdx);

	tmpTmpData +=  1;

	writePixToCol(&tmpData, yNewIdx, tmpTmpData);

	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = tmpData;
}

void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx, ap_int<5> colOffset,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
//	readBlockLoop: for(int8_t i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//	{
//		refCol[i] = readPix(x, y + i, 0);
//	}
	col_pix_t refColData1 = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS];
	col_pix_t refColData2 = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS + 1];
	two_cols_pix_t refColData;
	refColData.range(COMBINED_PIXELS * BITS_PER_PIXEL * 2 - 1, COMBINED_PIXELS * BITS_PER_PIXEL) = refColData1;
	refColData.range(COMBINED_PIXELS * BITS_PER_PIXEL - 1, 0) = refColData2;
//
//	col_pix_t refTagData1 = glPLSlices[sliceIdx + 1][x][y/COMBINED_PIXELS];
//	col_pix_t refTagData2 = glPLSlices[sliceIdx + 1][x][y/COMBINED_PIXELS + 1];
//	two_cols_pix_t refTagData;
//	refTagData.range(COMBINED_PIXELS * BITS_PER_PIXEL * 2 - 1, COMBINED_PIXELS * BITS_PER_PIXEL) = refTagData1;
//	refTagData.range(COMBINED_PIXELS * BITS_PER_PIXEL - 1, 0) = refTagData2;

	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refCol[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
//		tagCol[i] = readPixFromTwoCols(refTagData,  yColOffsetIdx);
//		yColOffsetIdx++;
	}
}

void topHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePix(x, y, idx);
	readBlockCols(x, y, idx + 1, 0, refCol);
	readBlockCols(x, y, idx + 2, 0, tagCol);
	resetPix(x, y, idx + 3);
}

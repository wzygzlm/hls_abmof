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


void writePixToCol(col_pix_t *colData, ap_uint<8> idx, pix_t pixData)
{
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		(*colData)[BITS_PER_PIXEL*idx + yIndex] = pixData[yIndex];
	}
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

pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	return readPixFromCol(glPLSlices[sliceIdx][x][y/COMBINED_PIXELS], y%COMBINED_PIXELS);
}

pix_t testWriteAndReadHW(ap_uint<8> xArray, ap_uint<8> yArray, sliceIdx_t idx)
{
	ap_uint<8> x = xArray;
	ap_uint<8> y = yArray;
	writePix(x, y, idx);
	return readPix(x, y, idx);
}

void readCols(ap_uint<9> x, ap_uint<9> y, ap_int<5> colOffset)
{

}

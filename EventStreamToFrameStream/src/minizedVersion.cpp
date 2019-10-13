#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"

#define SLICE_WIDTH 256

// Change these two together, make SLIC_HEIGHT equal to 256
#define RESHAPE_FACTOR 32
#define SLICE_HEIGHT RESHAPE_FACTOR*8

// Change them together
#define TS_TYPE_BIT_WIDTH 8
#define LOG_TS_TYPE_BIT_WIDTH 3   // Log(TS_TYPE_BIT_WIDTH), used in pix read and pix write

#define col_pix_t ap_uint<RESHAPE_FACTOR * TS_TYPE_BIT_WIDTH>

 // due to limited memory on minized. It only support 256 * 256 resolution, every pixel 8bits data.
static col_pix_t glDVSSlice[SLICE_HEIGHT/RESHAPE_FACTOR][SLICE_WIDTH];

struct register_t
{
	uint32_t dvsWidth;
	uint32_t dvsHeight;
	uint32_t sliceDuration;
	uint32_t displayMode;

	ap_uint<32> status;
	uint32_t frameCnt;
};

ap_uint<TS_TYPE_BIT_WIDTH> readOneDataFromCol(col_pix_t colData, ap_uint<8> idx)
{
#pragma HLS INLINE off
	ap_uint<TS_TYPE_BIT_WIDTH> retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>(idx * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[ap_uint<TS_TYPE_BIT_WIDTH>_BIT_WIDTH*idx + yIndex];
	}
	return retData;
}

void writeOneDataToCol(col_pix_t *colData, ap_uint<8> idx, ap_uint<TS_TYPE_BIT_WIDTH> toWriteData)
{
#pragma HLS INLINE off
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>(idx * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

		(*colData)[colIdx] = toWriteData[yIndex];
	}
}

void EventStreamToFrameStreamMinized(hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
		hls::stream< ap_uint<16> > &polStream, hls::stream< ap_uint<32> > &tsStream,
		hls::stream< ap_uint<32> > &frameStream)
{
//	if(reg.dvsWidth > SLICE_HEIGHT)
//	{
//		reg.status[0] = 1;
//		return;
//	}
//	if(reg.dvsHeight > SLICE_WIDTH)
//	{
//		reg.status[1] = 1;
//		return;
//	}

	static uint64_t lastTs = 0;
	static ap_uint<32> frameCnt = 0;
	static ap_uint<1> rotationBit[SLICE_HEIGHT][SLICE_WIDTH];

	ap_uint<16> x = xStream.read();
	ap_uint<16> y = yStream.read();
	ap_uint<1> pol = polStream.read();
	ap_uint<32> ts = tsStream.read();

	if ((ts >= lastTs + 5000))
	{
		frameCnt++;
		lastTs = ts;
		for(int i = 0; i < 800; i++)
		{
			for(int j = 0; j < 600; j++)
			{
#pragma HLS PIPELINE
				ap_uint<TS_TYPE_BIT_WIDTH> pixVal;
				if(i < SLICE_WIDTH && j < SLICE_WIDTH)
				{
					pixVal = readOneDataFromCol(glDVSSlice[j/RESHAPE_FACTOR][i], j%RESHAPE_FACTOR);
					rotationBit[i][j] = 1;
				}
				else
				{
					pixVal = 0;
				}
				frameStream << pixVal;
			}
		}
	}
//	reg.frameCnt = frameCnt;

	ap_uint<TS_TYPE_BIT_WIDTH> tmpPixVal = readOneDataFromCol(glDVSSlice[y/RESHAPE_FACTOR][x], y%RESHAPE_FACTOR);
	if(rotationBit[y][x] == 1)     // The pixel (x, y) has not reset yet
	{
		rotationBit[y][x] = 0;
		tmpPixVal = 1;
	}
	else							 // The pixel (x, y) has already reset
	{
		tmpPixVal += 1;
	}
	col_pix_t tmpData;
	writeOneDataToCol(&tmpData, y%RESHAPE_FACTOR, tmpPixVal);
	glDVSSlice[y/RESHAPE_FACTOR][x] = tmpData;
}

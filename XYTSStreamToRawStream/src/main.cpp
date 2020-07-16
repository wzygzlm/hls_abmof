#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
#include "systemc.h"


void RawStreamToFIFO(hls::stream< ap_uint<16> > &streamIn,
		ap_uint<1> fifoIFInFull_n, ap_uint<16> *fifoIFOutData, ap_uint<16> *skippedData)
{
#pragma HLS INTERFACE ap_vld port=fifoIFOutData
#pragma HLS INTERFACE axis register both port=streamIn
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS PIPELINE

	ap_uint<16> data = streamIn.read();
	ap_uint<16> swapData;
	swapData.range(15, 8) = data.range(7, 0);
	swapData.range(7, 0) = data.range(15, 8);

	if(fifoIFInFull_n)
	{
		*fifoIFOutData = swapData;
	}
	else
	{
		*skippedData = swapData;
	}
}

ap_uint<64> glLastTS;
ap_uint<16> glLastY;
ap_uint<49> glLastTsWrap;

void XYTSStreamToRawStream(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<10> > &custDataStreamIn,
		hls::stream< ap_uint<16> > &streamOut,
		ap_uint<64> * tsReg, ap_uint<64> * glLastTSReg, ap_uint<16> * yReg, ap_uint<16> * glLastYReg,
		ap_uint<1> *tsDiffFlgReg, ap_uint<1> *yDiffFlgReg,
		ap_uint<1> *nonMonTSDiffFlgReg, ap_uint<12> *tsWrappedVal)
{
#pragma HLS PIPELINE II=3
#pragma HLS INTERFACE axis register both port=xStreamIn
#pragma HLS INTERFACE axis register both port=yStreamIn
#pragma HLS INTERFACE axis register both port=tsStreamIn
#pragma HLS INTERFACE axis register both port=polStreamIn
#pragma HLS INTERFACE axis register both port=custDataStreamIn
#pragma HLS INTERFACE axis register both port=streamOut

	ap_uint<1> tsDiffFlg = 0;
	ap_uint<1> yDiffFlg = 0;
	ap_uint<1> nonMonTSDiffFlg = 0;
	ap_uint<12> tmpWradDiffVal = 0;

	ap_uint<64> ts;
	ts = tsStreamIn.read();
//    // For testing
//	ap_uint<17> tmpTs = ts.range(16,0);
//	if(tmpTs >= 10 && tmpTs <= 50)
//	{
//		ts = glLastTS - 5;
//	}
	// For compatible with the geometry of the chip, invert x and y
	ap_uint<16> x;
	x = yStreamIn.read();
	ap_uint<16> y;
	y = xStreamIn.read();
	ap_uint<1>  pol = polStreamIn.read();

	ap_uint<49> tsWrap = ts.range(63, 15);
	ap_uint<16> tsRaw = ts.range(14, 0);
	tsRaw[15] = 1;
	ap_uint<16> yRaw = y.range(11,0);
	yRaw.range(15, 12) = 1;
	ap_uint<16> xRaw = x.range(11,0);
	xRaw.range(15, 12) = 2 + pol;

	ap_uint<10> custData;
	custData = custDataStreamIn.read();
	ap_uint<16> custDataRaw = custData;
	custDataRaw.range(15, 12) = 6;   // Misc 10bit data
	custDataRaw.range(11,10) = 1;

	if(ts != glLastTS)
	{
		if(ts <= glLastTS)
		{
			nonMonTSDiffFlg = 1;
		}
		tsDiffFlg = 1;

		if(tsWrap > glLastTsWrap)
		{
			tmpWradDiffVal = tsWrap - glLastTsWrap;
			tsRaw = ap_uint<16>(0x7000 + tmpWradDiffVal);
		}
//		if(tsRaw > 0xf100)
//		{
//			tsRaw = tsRaw - 0x7000;
//		}
		streamOut << tsRaw;
		streamOut << yRaw;
		streamOut << xRaw;
		streamOut << custDataRaw;
	}
	else
	{
		if(y != glLastY)
		{
			yDiffFlg = 1;

			streamOut << yRaw;
			streamOut << xRaw;
			streamOut << custDataRaw;
		}
		else
		{
			streamOut << xRaw;
			streamOut << custDataRaw;
		}
	}

	*tsReg = ts;
	*glLastTSReg = glLastTS;
	glLastTS = ts;       // update last ts
	glLastTsWrap = tsWrap; // update last tsWrap
	*yReg = y;
	*glLastYReg = glLastY;
	glLastY = y;  // update last y
	*tsDiffFlgReg = tsDiffFlg;
	*yDiffFlgReg = yDiffFlg;
	*nonMonTSDiffFlgReg = nonMonTSDiffFlg;
	*tsWrappedVal = tmpWradDiffVal;
}

void XYTSStreamToRawFIFO(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		ap_uint<16> *fifoIFOutData)
{
#pragma HLS PIPELINE
#pragma HLS INTERFACE ap_fifo port=fifoIFOutData
#pragma HLS INTERFACE axis register both port=xStreamIn
#pragma HLS INTERFACE axis register both port=yStreamIn
#pragma HLS INTERFACE axis register both port=tsStreamIn
#pragma HLS INTERFACE axis register both port=polStreamIn

	ap_uint<64> ts;
	glLastTS = ts;
	ts = tsStreamIn.read();
	ap_uint<16> y;
	glLastY = y;
	y = yStreamIn.read();
	ap_uint<16> x = xStreamIn.read();
	ap_uint<1>  pol = polStreamIn.read();

	ap_uint<16> tsRaw = ts.range(14, 0);
	tsRaw[15] = 1;
	*fifoIFOutData++ = tsRaw;
	ap_uint<16> yRaw = y.range(11,0);
	yRaw.range(15, 12) = 1;
	*fifoIFOutData++ = yRaw;
	ap_uint<16> xRaw = x.range(11,0);
	xRaw.range(15, 12) = 2 + pol;
	*fifoIFOutData++ = xRaw;
}

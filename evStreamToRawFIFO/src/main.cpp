#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
#include "systemc.h"


ap_uint<64> glLastTS;
ap_uint<16> glLastY;

void XYTSStreamToRawStream(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<10> > &custDataStreamIn,
		hls::stream< ap_uint<16> > &streamOut,
//		ap_uint<1> fifoFull_in_n,   // input, but not used in this module
//		hls::stream< ap_uint<1> > &fifoFull_out_stream_n,
		ap_uint<64> * tsReg, ap_uint<64> * glLastTSReg, ap_uint<16> * yReg, ap_uint<16> * glLastYReg,
		ap_uint<1> *tsDiffFlgReg, ap_uint<1> *yDiffFlgReg, ap_uint<1> *nonMonTSDiffFlgReg)
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

//	fifoFull_out_stream_n << fifoFull_in_n;

	ap_uint<64> ts;
	ts = tsStreamIn.read();
//    // For testing
//	ap_uint<17> tmpTs = ts.range(16,0);
//	if(tmpTs >= 10 && tmpTs <= 50)
//	{
//		ts = glLastTS - 5;
//	}
	ap_uint<16> y;
	y = yStreamIn.read();
	ap_uint<16> x = xStreamIn.read();
	ap_uint<1>  pol = polStreamIn.read();

	ap_uint<16> tsRaw = ts.range(14, 0);
	tsRaw[15] = 1;
	ap_uint<16> yRaw = y.range(11,0);
	yRaw.range(15, 12) = 1;
	ap_uint<16> xRaw = x.range(11,0);
	xRaw.range(15, 12) = 2 + pol;

	ap_uint<10> custData;
	custData = custDataStreamIn.read();
	ap_uint<16> custDataRaw = custData;
	custDataRaw.range(15, 12) = 6;
	custDataRaw.range(11,10) = 0;

	if(ts != glLastTS)
	{
		if(ts <= glLastTS)
		{
			nonMonTSDiffFlg = 1;
		}
		tsDiffFlg = 1;

		if(tsRaw == 0x8000)
		{
			tsRaw = ap_uint<16>(0x7001);
		}
//		if(tsRaw > 0xf100)
//		{
//			tsRaw = tsRaw - 0x7000;
//		}
		streamOut << tsRaw;
		streamOut << yRaw;
		streamOut << xRaw;
//		streamOut << custDataRaw;
	}
	else
	{
		if(y != glLastY)
		{
			yDiffFlg = 1;

			streamOut << yRaw;
			streamOut << xRaw;
//			streamOut << custDataRaw;
		}
		else
		{
			streamOut << xRaw;
//			streamOut << custDataRaw;
		}
	}

	*tsReg = ts;
	*glLastTSReg = glLastTS;
	glLastTS = ts;       // update last ts
	*yReg = y;
	*glLastYReg = glLastY;
	glLastY = y;  // update last y
	*tsDiffFlgReg = tsDiffFlg;
	*yDiffFlgReg = yDiffFlg;
	*nonMonTSDiffFlgReg = nonMonTSDiffFlg;
}

void RawStreamToFIFO(hls::stream< ap_uint<16> > &streamIn,
		ap_uint<16> *dataOut,
		ap_uint<1> *nonMonTSDiffFlgReg)
{
#pragma HLS INTERFACE axis register both port=streamIn
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS PIPELINE

	static ap_uint<64> ts, glLastTS;
	static ap_uint<48> tsWrap;
	ap_uint<1> nonMonTSDiffFlg = 0;

	ap_uint<16> data = streamIn.read();
	if(data[15] == 1)
	{
		ts = (tsWrap << 15) + (ap_uint<64>)data.range(14, 0);    // Store the ts
	}
	else if(data.range(14, 12) == 7)
	{
		tsWrap += (ap_uint<48>)data.range(11, 0);
		ts = (tsWrap << 15);
	}

	if(ts < glLastTS)
	{
		nonMonTSDiffFlg = 1;
	}
	else
	{
		nonMonTSDiffFlg = 0;
	}
	ap_uint<16> swapData;
	swapData.range(15, 8) = data.range(7, 0);
	swapData.range(7, 0) = data.range(15, 8);

	*dataOut = swapData;
	*nonMonTSDiffFlgReg = nonMonTSDiffFlg;
}

void outputComb(ap_uint<1> fifoIFInFull_n, ap_uint<16> dataIn,
		ap_uint<16> *fifoIFOutData, ap_uint<16> *skippedData)
{
#pragma HLS LATENCY min=0 max=0
	if(fifoIFInFull_n)
	{
		*fifoIFOutData = dataIn;
	}
	else
	{
		*skippedData = dataIn;
	}
}

void evStreamToRawFIFO(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<10> > &custDataStreamIn,
		ap_uint<64> * tsReg, ap_uint<64> * glLastTSReg, ap_uint<16> * yReg, ap_uint<16> * glLastYReg,
		ap_uint<1> *tsDiffFlgReg, ap_uint<1> *yDiffFlgReg, ap_uint<1> *nonMonTSDiffFlgRegL1,
		ap_uint<16> *dataOut,
		ap_uint<1> *nonMonTSDiffFlgRegL2)
{
#pragma HLS DATAFLOW
#pragma HLS INTERFACE axis register both port=xStreamIn
#pragma HLS INTERFACE axis register both port=yStreamIn
#pragma HLS INTERFACE axis register both port=tsStreamIn
#pragma HLS INTERFACE axis register both port=polStreamIn
#pragma HLS INTERFACE axis register both port=custDataStreamIn

	hls::stream< ap_uint<16> > internalStream("internalStream");
#pragma HLS STREAM variable=internalStream depth=1024 dim=1
#pragma HLS RESOURCE variable=internalStream core=FIFO_SRL

	XYTSStreamToRawStream(xStreamIn, yStreamIn, tsStreamIn, polStreamIn, custDataStreamIn,
			internalStream,
			tsReg, glLastTSReg, yReg, glLastYReg, tsDiffFlgReg, yDiffFlgReg, nonMonTSDiffFlgRegL1);
	RawStreamToFIFO(internalStream, dataOut , nonMonTSDiffFlgRegL2);
}

void evStreamToRawFIFOWithComb(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<10> > &custDataStreamIn,
		ap_uint<1> fifoIFInFull_n,
		ap_uint<64> * tsReg, ap_uint<64> * glLastTSReg, ap_uint<16> * yReg, ap_uint<16> * glLastYReg,
		ap_uint<1> *tsDiffFlgReg, ap_uint<1> *yDiffFlgReg, ap_uint<1> *nonMonTSDiffFlgRegL1,
		ap_uint<16> *fifoIFOutData, ap_uint<16> *skippedData,
		ap_uint<1> *nonMonTSDiffFlgRegL2)
{
	ap_uint<16> internalData;
	evStreamToRawFIFO(xStreamIn, yStreamIn, tsStreamIn, polStreamIn, custDataStreamIn,
			tsReg, glLastTSReg, yReg, glLastYReg, tsDiffFlgReg, yDiffFlgReg, nonMonTSDiffFlgRegL1,
			&internalData, nonMonTSDiffFlgRegL2);
	outputComb(fifoIFInFull_n, internalData, fifoIFOutData, skippedData);
}

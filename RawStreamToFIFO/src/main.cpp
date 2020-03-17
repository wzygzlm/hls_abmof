#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
#include "systemc.h"


void RawStreamToFIFO(hls::stream< ap_uint<16> > &streamIn,
		ap_uint<1> fifoIFInFull_n, ap_uint<16> *fifoIFOutData, ap_uint<16> *skippedData,
		ap_uint<1> *nonMonTSDiffFlgReg, ap_uint<64> *skipNumReg, ap_uint<64> *lastTsReg)
{
#pragma HLS INTERFACE ap_vld port=fifoIFOutData
#pragma HLS INTERFACE axis register both port=streamIn
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS PIPELINE

	static ap_uint<64> ts, glLastTS;
	static ap_uint<48> tsWrap;
	ap_uint<1> nonMonTSDiffFlg = 0;

	static ap_uint<64> skipNumber;

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
	glLastTS = ts;

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
		skipNumber++;
	}

	*lastTsReg = glLastTS;
	*nonMonTSDiffFlgReg = nonMonTSDiffFlg;
	*skipNumReg = skipNumber;
}

void XYTSStreamToRawStream(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<16> > &streamOut)
{
#pragma HLS PIPELINE II=3
#pragma HLS INTERFACE axis register both port=xStreamIn
#pragma HLS INTERFACE axis register both port=yStreamIn
#pragma HLS INTERFACE axis register both port=tsStreamIn
#pragma HLS INTERFACE axis register both port=polStreamIn
#pragma HLS INTERFACE axis register both port=streamOut

	ap_uint<64> ts = tsStreamIn.read();
	ap_uint<16> y = yStreamIn.read();
	ap_uint<16> x = xStreamIn.read();
	ap_uint<1>  pol = polStreamIn.read();

	ap_uint<16> tsRaw = ts.range(14, 0);
	tsRaw[15] = 1;
	streamOut << tsRaw;
	ap_uint<16> yRaw = y.range(11,0);
	yRaw.range(15, 12) = 1;
	streamOut << yRaw;
	ap_uint<16> xRaw = x.range(11,0);
	xRaw.range(15, 12) = 2 + pol;
	streamOut << xRaw;
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

    hls::stream< ap_uint<96> > pktEventDataStream("pktEventDataStream");
#pragma HLS STREAM variable=pktEventDataStream depth=3 dim=1
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL

	ap_uint<64> ts = tsStreamIn.read();
	ap_uint<16> y = yStreamIn.read();
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

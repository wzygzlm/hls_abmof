#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
#include "systemc.h"


void convertToStream(ap_uint<1> dataReady, ap_uint<1> dataValid, ap_uint<8> dataToCheck,
		hls::stream< ap_uint<8> > &evUSBStreamOut, ap_uint<1> *eventFIFODVReg)
{
#pragma HLS INTERFACE ap_none port=eventFIFODVReg
#pragma HLS INTERFACE axis register both port=evUSBStreamOut
#pragma HLS PIPELINE

	ap_uint<8> tmpData = 0;
	ap_uint<1> eventFIFODataValid = dataReady & dataValid;
	*eventFIFODVReg = eventFIFODataValid;

	if(eventFIFODataValid == 1)
	{
		evUSBStreamOut << dataToCheck;
	}
}

void checkEvUSBStream(hls::stream< ap_uint<8> > &evUSBStreamIn,
		ap_uint<16> *dataReg, ap_uint<1> *nonMonTSDiffFlgReg,
		ap_uint<64> * tsReg, ap_uint<64> * glLastTSReg)
{
#pragma HLS INTERFACE axis register both port=evUSBStreamIn
#pragma HLS PIPELINE II=2

	static ap_uint<64> ts, glLastTS;
	static ap_uint<48> tsWrap;
	ap_uint<1> nonMonTSDiffFlg = 0;

	static ap_uint<16> data;
	static ap_uint<8> dataLow, dataHigh;
	data.range(7,0) = evUSBStreamIn.read();
	data.range(15,8) = evUSBStreamIn.read();

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

	*tsReg = ts;
	*glLastTSReg = glLastTS;
	glLastTS = ts;
	*dataReg = data;
	*nonMonTSDiffFlgReg = nonMonTSDiffFlg;
}

//void checkEp2RawData(ap_uint<1> dataReady, ap_uint<1> dataValid, ap_uint<8> dataToCheck,
//		ap_uint<16> *dataReg, ap_uint<1> *nonMonTSDiffFlgReg, ap_uint<1> *eventFIFODVReg)
//{
//#pragma HLS INTERFACE ap_ctrl_hs port=return
//#pragma HLS DATAFLOW
//	hls::stream< ap_uint<8> > evUSBStream("evUSBStream");
//#pragma HLS RESOURCE variable=evUSBStream core=FIFO_SRL
//#pragma HLS STREAM variable=evUSBStream depth=64 dim=1
//	convertToStream(dataReady, dataValid, dataToCheck, evUSBStream, eventFIFODVReg);
//	checkEvUSBStream(evUSBStream, dataReg, nonMonTSDiffFlgReg);
//}

#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
#include "systemc.h"


void FifoToStream(volatile ap_uint<8> dataFIFOIn, ap_uint<1> FIFODataValid,
		hls::stream< ap_uint<8> >  &streamOut)
{
#pragma HLS LATENCY min=0 max=1
#pragma HLS INTERFACE ap_none port=dataFIFOIn
#pragma HLS INTERFACE ap_none port=FIFODataValid
#pragma HLS PIPELINE
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS INTERFACE axis register both port=streamOut

	stream_t tmpStream;
	ap_uint<8> data;

	if(FIFODataValid == 1)
	{
		tmpStream.data = dataFIFOIn;
		tmpStream.last = 1;
		data = dataFIFOIn;
		streamOut << data;
	}

}


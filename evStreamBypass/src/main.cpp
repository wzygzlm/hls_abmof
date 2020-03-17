#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"

void EvStreamBypass(hls::stream< ap_uint<16> > &xStreamIn, hls::stream< ap_uint<16> > &yStreamIn,
		hls::stream< ap_uint<64> > &tsStreamIn, hls::stream< ap_uint<1> > &polStreamIn,
		hls::stream< ap_uint<10> > &custDataStreamIn,
		hls::stream< ap_uint<16> > &xStreamOut, hls::stream< ap_uint<16> > &yStreamOut,
		hls::stream< ap_uint<64> > &tsStreamOut, hls::stream< ap_uint<1> > &polStreamOut,
		hls::stream< ap_uint<10> > &custDataStreamOut)
{
#pragma HLS PIPELINE
#pragma HLS INTERFACE axis register both port=xStreamIn
#pragma HLS INTERFACE axis register both port=yStreamIn
#pragma HLS INTERFACE axis register both port=tsStreamIn
#pragma HLS INTERFACE axis register both port=polStreamIn
#pragma HLS INTERFACE axis register both port=custDataStreamIn
#pragma HLS INTERFACE axis register both port=xStreamOut
#pragma HLS INTERFACE axis register both port=yStreamOut
#pragma HLS INTERFACE axis register both port=tsStreamOut
#pragma HLS INTERFACE axis register both port=polStreamOut
#pragma HLS INTERFACE axis register both port=custDataStreamOut

	ap_uint<64> ts;
	ts = tsStreamIn.read();
	ap_uint<16> y;
	y = yStreamIn.read();
	ap_uint<16> x = xStreamIn.read();
	ap_uint<1>  pol = polStreamIn.read();

	ap_uint<10> custData;
	custData = custDataStreamIn.read();

	xStreamOut << x;
	yStreamOut << y;
	tsStreamOut << ts;
	polStreamOut << pol;
	custDataStreamOut << custData;
}

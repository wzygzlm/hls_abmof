#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"


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

void EventStreamToFrameStream(register_t &reg, hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
		hls::stream< ap_uint<16> > &polStream, hls::stream< ap_uint<32> > &tsStream,
		hls::stream< ap_uint<32> > &frameStream)
{
	if(reg.dvsWidth > SLICE_HEIGHT)
	{
		reg.status[0] = 1;
		return;
	}
	if(reg.dvsHeight > SLICE_WIDTH)
	{
		reg.status[1] = 1;
		return;
	}

	static ap_uint<32> frameCnt = 0;
	static ap_uint<1> rotationBit[SLICE_HEIGHT][SLICE_WIDTH];

	ap_uint<16> x = xStream.read();
	ap_uint<16> y = yStream.read();
	ap_uint<1> pol = polStream.read();
	ap_uint<32> ts = tsStream.read();

	if ((ts >= frameCnt * reg.sliceDuration))
	{
		frameCnt++;
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
	reg.frameCnt = frameCnt;

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

void testVGAFrame(hls::stream< rgbFrameStream_t > &frameStream)
{
#pragma HLS INTERFACE axis register both port=frameStream
#pragma HLS INTERFACE ap_ctrl_hs port=return
	rgbFrameStream_t rgbStreamData;

//	for(int i = 0; i < 5; i++)
//	{
//#pragma HLS PIPELINE
//		rgbStreamData.user = 0;
//		rgbStreamData.last = 0;
//		rgbStreamData.keep = 7;
//		rgbStreamData.strb = 0;
//		rgbStreamData.data = 0x5a5a5a;
//		frameStream << rgbStreamData;
//	}

	for(int i = 0; i < 600; i++)
	{
		for(int j = 0; j < 800; j++)
		{
#pragma HLS LATENCY min=8
#pragma HLS PIPELINE
//#pragma HLS loop_flatten off

//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
			ap_uint<24> pixVal;
			if(j < 20 && i < 40)
			{
				pixVal = 0xff;
			}
//			else if(i <= 200)
//			{
//				pixVal = (0xff << 8);
//			}
//			else if(i <= 300)
//			{
//				pixVal = (0xff << 16);
//			}
//			else if(i <= 400)
//			{
//				pixVal = j;
//			}
//			else if(i <= 500)
//			{
//				pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
//			}
			else
			{
				pixVal = (0xff << 16) + (0xff << 8);
			}

			rgbStreamData.data = pixVal;
			rgbStreamData.dest = 0;
			rgbStreamData.id = 0;

			if(j >= 799)
			{
				rgbStreamData.last = 1;
				rgbStreamData.keep = 7;
			}
			else
			{
				rgbStreamData.last = 0;
				rgbStreamData.keep = 7;
			}
			rgbStreamData.strb = 7;
			if(i == 0 && j == 0)
			{
				rgbStreamData.user = 3;
			}
			else
			{
				rgbStreamData.user = 0;
			}
			frameStream << rgbStreamData;
		}
	}

//	for(int i = 0; i < 5; i++)
//	{
//#pragma HLS PIPELINE
//		rgbStreamData.user = 0;
//		rgbStreamData.last = 1;
//		rgbStreamData.keep = 0;
//		frameStream << rgbStreamData;
//	}
}

void AERReadFIFOdata(ap_uint<16> *eventFIFOIn, hls::stream< ap_uint<16> > &eventStreamOut)
{
#pragma HLS INTERFACE axis register both port=eventStreamOut
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS INTERFACE ap_fifo port=eventFIFOIn
	 ap_uint<16> data = *eventFIFOIn++;
	 eventStreamOut << data;
}

enum tState {stIdle, stFIFORead, stGetData, stGetTs, stGetY, stGetX, stOutput, stNextDataDecision};

void EVRawStreamToXYTSStream(ap_uint<16> eventFIFOIn, ap_uint<1> eventFIFOEmpty, ap_uint<1> *eventFIFORd,
		ap_uint<4> *stateReg, ap_uint<4> *getDataStateReg, ap_uint<16> *xRegReg,  ap_uint<16> *yRegReg, ap_uint<64> *tsRegReg, ap_uint<16> *dataReg,
		hls::stream< ap_uint<16> > &xStreamOut, hls::stream< ap_uint<16> > &yStreamOut, hls::stream< ap_uint<64> > &tsStreamOut, hls::stream< ap_uint<1> > &polStreamOut)
{
//#pragma HLS LATENCY min=1 max=1
#pragma HLS PIPELINE
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS INTERFACE axis register both port=xStreamOut
#pragma HLS INTERFACE axis register both port=yStreamOut
#pragma HLS INTERFACE axis register both port=tsStreamOut

	/* Registers for this module */
	static tState state = stIdle, getDataState = stGetTs;
	static ap_uint<64> ts;
	static ap_uint<16> x, y;
	static ap_uint<1> pol;

	static ap_uint<16> data;

	*stateReg = state;
	*getDataStateReg = getDataState;

	ap_uint<1> rdReg = 0;

	switch(state)
	{
	case stIdle:
		data = 0;
		Region:
		{
/* creates a code region and groups signals that need to change in the
 * same clock cycle by specifying zero latency
 */
#pragma HLS LATENCY min=0 max=0
			if(eventFIFOEmpty == 1)
			{
				*eventFIFORd = 1;   // Enable it for one cycle to make sure only one data is output
				state = stGetData;
			}
			else
			{
				*eventFIFORd = 0;
			}
		}
		break;
	case stFIFORead:
		*eventFIFORd = 1;   // Enable it for one cycle to make sure only one data is output
		state = stGetData;
		break;
	case stGetData:
		*eventFIFORd = 0;
		data = eventFIFOIn;
//		state = getDataState;
		if(data[15] == 1)
		{
			ts = (ap_uint<64>)data.range(14, 0);    // Store the ts
		}
		else if(data.range(14, 12) == 1)
		{
			y = (ap_uint<16>)data.range(11, 0);            // Store the y address
		}
		else if(data.range(14, 12) == 2 || data.range(14, 12) == 3)
		{
			x = (ap_uint<16>)data.range(12, 0);    // Store the x address. Polarity is also packaged into xStream.

			/* Now we can output all the data simultaneously */
			tsStreamOut << ts;
			yStreamOut << y;
			xStreamOut << x;
		}

		state = stIdle;     // Go back to wait a new valid data.

		break;
//	case stGetTs:                                         // Idle state, wait until valid ts come in.
//		state = stIdle;     // Go back to wait a new valid data.
//
//		if(data[15] == 1)
//		{
//			ts = (ap_uint<64>)data.range(14, 0);    // Store the ts
//			getDataState = stGetY;
//		}
//		break;
//	case stGetY:
//		state = stIdle;     // Go back to wait a new valid data.
//
//		if(data.range(14, 12) == 1)
//		{
//			y = (ap_uint<16>)data.range(11, 0);            // Store the y address
//			getDataState = stGetX;
//		}
//		break;
//	case stGetX:
//		state = stIdle;     // Go back to wait a new valid data.
//
//		if(data.range(14, 12) == 2 || data.range(14, 12) == 3)
//		{
//			x = (ap_uint<16>)data.range(12, 0);    // Store the x address. Polarity is also packaged into xStream.
//			state = stOutput;
//		}
//
//		break;
//	case stOutput:
//
//		/* Now we can output all the data simultaneously */
//		tsStreamOut << ts;
//		yStreamOut << y;
//		xStreamOut << x;
//
//		getDataState = stNextDataDecision;
//		state = stIdle;     // Go back to wait a new valid data.
//		break;
//
//	/* When this state is entered, it means that at least one ts, y, x have been obtained.
//	 * The next data state will depend on the new data.
//	 */
//	case stNextDataDecision:
//		state = stIdle;     // Go back to wait a new valid data.
//
//		if(data[15] == 1)
//		{
//			ts = (ap_uint<64>)data.range(14, 0);    // Store the ts
//			getDataState = stGetY;
//		}
//		else if(data.range(14, 12) == 1)
//		{
//			y = (ap_uint<16>)data.range(11, 0);            // Store the y address
//			getDataState = stGetX;
//		}
//		else if(data.range(14, 12) == 2 || data.range(14, 12) == 3)
//		{
//			x = (ap_uint<16>)data.range(12, 0);    // Store the x address. Polarity is also packaged into xStream.
//			state = stOutput;
//		}
//		else
//		{
//			getDataState = stNextDataDecision;
//		}
//		break;
	default:                                     // This state should never be hit
		/* Initialize it and back to stIdle, the next data should fetch is the ts data */
		getDataState = stGetTs;
		state = stIdle;
		break;
	}


	*tsRegReg = ts;
	*xRegReg = x;
	*yRegReg = y;
	*dataReg = data;

//	*eventFIFORd = rdReg;
}

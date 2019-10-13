#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"

static col_pix_t glDVSSlice[2][SLICE_HEIGHT/RESHAPE_FACTOR][SLICE_WIDTH];   // support 512 * 512 resolution, every pixel 16bits data.
//static col_pix_t glDVSSlice1[SLICE_HEIGHT/RESHAPE_FACTOR][SLICE_WIDTH];

ap_uint<TS_TYPE_BIT_WIDTH> readOneDataFromCol(col_pix_t colData, ap_uint<8> idx)
{
#pragma HLS INLINE
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
#pragma HLS INLINE
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

//void EventStreamToFrameStream(register_t &reg, hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
//		hls::stream< ap_uint<16> > &polStream, hls::stream< ap_uint<32> > &tsStream,
//		hls::stream< ap_uint<32> > &frameStream)
//{
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
//
//	static ap_uint<32> frameCnt = 0;
//	static ap_uint<1> rotationBit[SLICE_HEIGHT][SLICE_WIDTH];
//
//	ap_uint<16> x = xStream.read();
//	ap_uint<16> y = yStream.read();
//	ap_uint<1> pol = polStream.read();
//	ap_uint<32> ts = tsStream.read();
//
//	if ((ts >= frameCnt * reg.sliceDuration))
//	{
//		frameCnt++;
//		for(int i = 0; i < 800; i++)
//		{
//			for(int j = 0; j < 600; j++)
//			{
//#pragma HLS PIPELINE
//				ap_uint<TS_TYPE_BIT_WIDTH> pixVal;
//				if(i < SLICE_WIDTH && j < SLICE_WIDTH)
//				{
//					pixVal = readOneDataFromCol(glDVSSlice[j/RESHAPE_FACTOR][i], j%RESHAPE_FACTOR);
//					rotationBit[i][j] = 1;
//				}
//				else
//				{
//					pixVal = 0;
//				}
//				frameStream << pixVal;
//			}
//		}
//	}
//	reg.frameCnt = frameCnt;
//
//	ap_uint<TS_TYPE_BIT_WIDTH> tmpPixVal = readOneDataFromCol(glDVSSlice[y/RESHAPE_FACTOR][x], y%RESHAPE_FACTOR);
//	if(rotationBit[y][x] == 1)     // The pixel (x, y) has not reset yet
//	{
//		rotationBit[y][x] = 0;
//		tmpPixVal = 1;
//	}
//	else							 // The pixel (x, y) has already reset
//	{
//		tmpPixVal += 1;
//	}
//	col_pix_t tmpData;
//	writeOneDataToCol(&tmpData, y%RESHAPE_FACTOR, tmpPixVal);
//	glDVSSlice[y/RESHAPE_FACTOR][x] = tmpData;
//}

void testVGAFrame(int testMode, hls::stream< rgbFrameStream_t > &frameStream)
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

	if(testMode == 0)   //Green
	{
		for(int i = 0; i < 600; i++)
		{
			for(int j = 0; j < 800; j++)
			{
	//#pragma HLS LATENCY min=8
	#pragma HLS PIPELINE
	//#pragma HLS loop_flatten off

	//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				ap_uint<24> pixVal;
				pixVal = 0xff;

				if(j == 799)
				{
					pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
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

				rgbStreamData.data = pixVal;
				rgbStreamData.dest = 0;
				rgbStreamData.id = 0;

				frameStream << rgbStreamData;
			}
		}
	}
	else if(testMode == 1)    // Blue
	{
		for(int i = 0; i < 600; i++)
		{
			for(int j = 0; j < 800; j++)
			{
	//#pragma HLS LATENCY min=8
	#pragma HLS PIPELINE
	//#pragma HLS loop_flatten off

	//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				ap_uint<24> pixVal;
				pixVal = 0xff << 8;

				if(j == 799)
				{
					pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
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

				rgbStreamData.data = pixVal;
				rgbStreamData.dest = 0;
				rgbStreamData.id = 0;

				frameStream << rgbStreamData;
			}
		}
	}
	else if(testMode == 2)    //Red
	{
		for(int i = 0; i < 600; i++)
		{
			for(int j = 0; j < 800; j++)
			{
	//#pragma HLS LATENCY min=8
	#pragma HLS PIPELINE
	//#pragma HLS loop_flatten off

	//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				ap_uint<24> pixVal;
				pixVal = 0xff << 16;

				if(j == 799)
				{
					pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
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

				rgbStreamData.data = pixVal;
				rgbStreamData.dest = 0;
				rgbStreamData.id = 0;

				frameStream << rgbStreamData;
			}
		}
	}
	else if(testMode ==3)    //White
	{
		for(int i = 0; i < 600; i++)
		{
			for(int j = 0; j < 800; j++)
			{
	//#pragma HLS LATENCY min=8
	#pragma HLS PIPELINE
	//#pragma HLS loop_flatten off

	//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				ap_uint<24> pixVal;
				pixVal = ap_uint<24>(0xffffff);

				if(j == 799)
				{
					pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
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

				rgbStreamData.data = pixVal;
				rgbStreamData.dest = 0;
				rgbStreamData.id = 0;

				frameStream << rgbStreamData;
			}
		}
	}
	else if(testMode ==4)
	{
		for(int i = 0; i < 600; i++)
		{
			for(int j = 0; j < 800; j++)
			{
	//#pragma HLS LATENCY min=8
	#pragma HLS PIPELINE
	//#pragma HLS loop_flatten off

	//			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				ap_uint<24> pixVal;
				if(j <= 200)
				{
					pixVal = (j & 0xff);
				}
				else if(j <= 400)
				{
					pixVal = ((j & 0xff) << 8);
				}
				else if(j <= 600)
				{
					pixVal = ((j & 0xff) << 16);
				}
				else
				{
					pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
				}

				if(j == 799)
				{
					pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
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

				rgbStreamData.data = pixVal;
				rgbStreamData.dest = 0;
				rgbStreamData.id = 0;

				frameStream << rgbStreamData;
			}
		}
	}


}


void eventStreamToConstEncntFrameStream(hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
//		hls::stream< ap_uint<16> > &polStream, hls::stream< ap_uint<32> > &tsStream,
		ap_uint<64> *count, ap_uint<1> *vgaEn, ap_uint<16> *vCnt, ap_uint<16> *hCnt, ap_uint<16> *regX, ap_uint<16> *regY,
		hls::stream< rgbFrameStream_t > &frameStream
		)
{
#pragma HLS INTERFACE axis register both port=frameStream
#pragma HLS ARRAY_PARTITION variable=glDVSSlice complete dim=1
#pragma HLS DEPENDENCE variable=glDVSSlice inter false
#pragma HLS RESOURCE variable=glDVSSlice core=RAM_T2P_BRAM
#pragma HLS PIPELINE
#pragma HLS INTERFACE axis register both port=yStream
#pragma HLS INTERFACE axis register both port=xStream

	static ap_uint<64> cntReg = 0;
	static ap_uint<64> evCntReg = 0;

	static ap_uint<12> hCntReg = 0, vCntReg = 0;   // Counter for VGA.
	static bool vgaOutputEn = false;

	static ap_uint<1> currentStoreSliceIdx = 0;
	static ap_uint<1> currentLoadSliceIdx = 0;

	static ap_uint<16> fakeX, fakeY;
	static ap_uint<16> startX = 0, startY = 0;

	/* Local variables */
	ap_uint<16> x, y;
	bool skipFlag = false;
	if(!xStream.read_nb(x) || !yStream.read_nb(y))
	{
		skipFlag = true;
	}

//	if(fakeX >= startX + 20)
//	{
//		fakeX = startX;
//		if(fakeY >= startY + 20)
//		{
//			fakeY = startY;
//		}
//		else
//		{
//			fakeY++;
//		}
//	}
//	else
//	{
//		fakeX++;
//	}
//
//	x = fakeX;
//	y = fakeY;
//	skipFlag = false;

	ap_uint<TS_TYPE_BIT_WIDTH> tmpPixVal, vgaReadPixVal = 0;
	col_pix_t tmpData, resetData;
	/* Writing it in this split form rather than combination form could avoid generating a big select operator */
	currentLoadSliceIdx = ~currentStoreSliceIdx;
	if(currentStoreSliceIdx == 0)
	{
		tmpData = glDVSSlice[currentStoreSliceIdx][y/RESHAPE_FACTOR][x];
		tmpPixVal = readOneDataFromCol(tmpData, y%RESHAPE_FACTOR);
		tmpPixVal = (skipFlag) ? tmpPixVal : (ap_uint<TS_TYPE_BIT_WIDTH>(tmpPixVal + 1));
		writeOneDataToCol(&tmpData, y%RESHAPE_FACTOR, tmpPixVal);
		glDVSSlice[currentStoreSliceIdx][y/RESHAPE_FACTOR][x] = tmpData;

		resetData = glDVSSlice[currentLoadSliceIdx][vCntReg/RESHAPE_FACTOR][hCntReg];
		if(vCntReg >= 260 || hCntReg >= 346)
		{
			vgaReadPixVal = 0x66;
		}
		else
		{
			vgaReadPixVal = readOneDataFromCol(resetData, vCntReg%RESHAPE_FACTOR);
		}
		writeOneDataToCol(&resetData, vCntReg%RESHAPE_FACTOR, 0);
		glDVSSlice[currentLoadSliceIdx][vCntReg/RESHAPE_FACTOR][hCntReg] = resetData;
	}
	else
	{
		tmpData = glDVSSlice[currentStoreSliceIdx][y/RESHAPE_FACTOR][x];
		tmpPixVal = readOneDataFromCol(tmpData, y%RESHAPE_FACTOR);
		tmpPixVal = (skipFlag) ? tmpPixVal : (ap_uint<TS_TYPE_BIT_WIDTH>(tmpPixVal + 1));
		writeOneDataToCol(&tmpData, y%RESHAPE_FACTOR, tmpPixVal);
		glDVSSlice[currentStoreSliceIdx][y/RESHAPE_FACTOR][x] = tmpData;

		resetData = glDVSSlice[currentLoadSliceIdx][vCntReg/RESHAPE_FACTOR][hCntReg];
		if(vCntReg >= 260 || hCntReg >= 346)
		{
			vgaReadPixVal = 0x66;
		}
		else
		{
			vgaReadPixVal = readOneDataFromCol(resetData, vCntReg%RESHAPE_FACTOR);
		}
		writeOneDataToCol(&resetData, vCntReg%RESHAPE_FACTOR, 0);
		glDVSSlice[currentLoadSliceIdx][vCntReg/RESHAPE_FACTOR][hCntReg] = resetData;
	}

	rgbFrameStream_t rgbStreamData;

	if(vgaOutputEn)
	{
		ap_uint<24> pixVal;
		pixVal = 0xff << 16;
//		if(currentStoreSliceIdx == 0)
//		{
			pixVal = (ap_uint<24>(vgaReadPixVal) << 16);
//		}
//		else
//		{
//			pixVal = (ap_uint<24>(vgaReadPixVal) << 8);
//		}

		if(hCntReg == 799)
		{
			pixVal = 0;    // To make sure it is 0 when it is during the sync pulse, back porch and front porch time
			rgbStreamData.last = 1;
			rgbStreamData.keep = 7;
		}
		else
		{
			rgbStreamData.last = 0;
			rgbStreamData.keep = 7;
		}
		rgbStreamData.strb = 7;
		if(vCntReg == 0 && hCntReg == 0)
		{
			rgbStreamData.user = 3;
		}
		else
		{
			rgbStreamData.user = 0;
		}

		rgbStreamData.data = pixVal;
		rgbStreamData.dest = 0;
		rgbStreamData.id = 0;

		frameStream << rgbStreamData;

		hCntReg++;
		if(hCntReg == 800)
		{
			hCntReg = 0;
			vCntReg++;
			if(vCntReg == 600)    // This is the last pixel for VGA. Clear vgaOutputEn and revert vCntReg to 0;
			{
				vgaOutputEn = false;
				vCntReg = 0;
			}
		}
	}

	ap_uint<32> evCntRegReg = cntReg%0x100000;
	if(evCntRegReg == 0)   // Some condition is satisfied, rotate slice and enable VGA output.
	{
//		cntReg = 0;
		if(startX >= 300)
		{
			startX = 0;
		}
		else
		{
			startX++;
		}

		if(startY >= 200)
		{
			startY = 0;
		}
		else
		{
			startY++;
		}
		currentStoreSliceIdx = ~currentStoreSliceIdx;
		vgaOutputEn = true;
	}

	cntReg++;
	if(!skipFlag) evCntReg++;

	*count = evCntRegReg;
	*vgaEn = vgaOutputEn;
	*vCnt = vCntReg;
	*hCnt = hCntReg;
	*regX = x;
	*regY = y;
}

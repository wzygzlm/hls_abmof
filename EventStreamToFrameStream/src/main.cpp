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


/*
 * ctrl: 0-7: reserved;
 *       8-15: basic value of color pixels;
 *       16-17: display accumulate events (0) or ts data (1) or arbitrary data (2);
 */

void eventStreamToConstEncntFrameStream(hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
		hls::stream< ap_uint<1> > &polStream,
		hls::stream< ap_uint<32> > &tsStream, hls::stream< ap_uint<8> > &custDataStream,
		ap_uint<16> configRegs, ap_uint<32> ctrl,
		ap_uint<64> *count, ap_uint<1> *vgaEn, ap_uint<16> *vCnt, ap_uint<16> *hCnt, ap_uint<16> *regX, ap_uint<16> *regY, ap_uint<1> *polReg, ap_uint<1> *skipFlgOutput,
		hls::stream< rgbFrameStream_t > &frameStream
		)
{
#pragma HLS INTERFACE axis register both port=custDataStream
#pragma HLS INTERFACE axis register both port=tsStream
#pragma HLS INTERFACE axis register both port=polStream
//#pragma HLS INTERFACE ap_ctrl_chain port=return
#pragma HLS INTERFACE s_axilite register port=ctrl bundle=config
#pragma HLS INTERFACE s_axilite register port=configRegs bundle=config
//#pragma HLS INTERFACE s_axilite register port=return bundle=config
#pragma HLS INTERFACE axis register both port=frameStream
#pragma HLS ARRAY_PARTITION variable=glDVSSlice complete dim=1
#pragma HLS DEPENDENCE variable=glDVSSlice inter false
#pragma HLS DEPENDENCE variable=glDVSSlice intra true
#pragma HLS RESOURCE variable=glDVSSlice core=RAM_T2P_BRAM
#pragma HLS PIPELINE
#pragma HLS INTERFACE axis register both port=yStream
#pragma HLS INTERFACE axis register both port=xStream

	static ap_uint<32> cntReg = 0;
	static ap_uint<64> evCntReg = 0;

	static ap_uint<12> hCntReg = 0, vCntReg = 0;   // Counter for VGA.

	static bool vgaOutputEn = false;

	static ap_uint<1> currentStoreSliceIdx = 0;
	static ap_uint<1> currentLoadSliceIdx = 0;

	static ap_uint<16> fakeX, fakeY;
	static ap_uint<16> startX = 0, startY = 0;

	static ap_uint<16> sliceDurationMs = 10;

	if(ctrl & 0x1)
	{
		sliceDurationMs = configRegs;
		ctrl = ctrl & ~(0x1);
	}
	else
	{
		configRegs = sliceDurationMs;
	}

	/* Local variables */
	ap_uint<16> x, y;
	ap_uint<1> pol;
	ap_uint<32> ts = 0;
	ap_uint<8> custData = 0;
	bool skipFlag = false;

	if(!(xStream.read_nb(x)) || !(yStream.read_nb(y)))   // If any read of them failed, then skip.
	{
		skipFlag = true;
	}
	else
	{
		polStream >> pol;
		tsStream.read_nb(ts);
		custDataStream.read_nb(custData);
	}
	int8_t polVal = (pol == (ap_uint<1>)1) ? 1 : -1;    //  Convert unsigned polarity to 1 or -1.
	x = ap_uint<16>(x.range(11, 0));             // Polarity information is extracted, and now store the valid x address.

//	if(fakeY >= startY + 20)
//	{
//		fakeY = startY;
//		if(fakeX >= startX + 20)
//		{
//			fakeX = startX;
//		}
//		else
//		{
//			fakeX++;
//		}
//	}
//	else
//	{
//		fakeY++;
//	}
//
//	x = fakeX;
//	y = fakeY;
//	skipFlag = false;

	ap_int<TS_TYPE_BIT_WIDTH> tmpPixVal, vgaReadPixVal = 0;
	col_pix_t tmpData, resetData;
	ap_uint<12> hRdCntReg, vRdCntReg;  // For VGA sub-sample display
	ap_uint<12> hRdCntModReg, vRdCntModReg;
	/* Writing it in this split form rather than combination form could avoid generating a big select operator */
	currentLoadSliceIdx = ~currentStoreSliceIdx;
	hRdCntReg = hCntReg/2;
	vRdCntReg = vCntReg/2;
	hRdCntModReg = hCntReg - 2 * hRdCntReg;
	vRdCntModReg = vCntReg - 2 * vRdCntReg;
	if(currentStoreSliceIdx == 0)
	{
		tmpData = glDVSSlice[currentStoreSliceIdx][x/RESHAPE_FACTOR][y];
		tmpPixVal = readOneDataFromCol(tmpData, x%RESHAPE_FACTOR);
		tmpPixVal = (skipFlag) ? tmpPixVal : (ap_int<TS_TYPE_BIT_WIDTH>(tmpPixVal + polVal));
		if((ctrl & 0x10000) == 0x10000)
		{
			tmpPixVal = ts;
		}
		else if((ctrl & 0x20000) == 0x20000)
		{
			tmpPixVal = custData;
		}
		writeOneDataToCol(&tmpData, x%RESHAPE_FACTOR, tmpPixVal);
		glDVSSlice[currentStoreSliceIdx][x/RESHAPE_FACTOR][y] = tmpData;

		if(vRdCntReg >= 260 || hRdCntReg >= 346)
		{
			vgaReadPixVal = 0xaa;
		}
		else
		{
			resetData = glDVSSlice[currentLoadSliceIdx][vRdCntReg/RESHAPE_FACTOR][hRdCntReg];
			vgaReadPixVal = readOneDataFromCol(resetData, vRdCntReg%RESHAPE_FACTOR);
			if(vgaReadPixVal > 0) vgaReadPixVal = vgaReadPixVal + ((ctrl & 0xff00) >> 8);
			else if(vgaReadPixVal < 0) vgaReadPixVal = vgaReadPixVal - ((ctrl & 0xff00) >> 8);
//			if(vgaReadPixVal > 0) vgaReadPixVal = 0xff;
		}

		// This is the final sub-sampled pixel that will use this block address. Now we can reset it safely.
		if(hRdCntModReg == 1 && vRdCntModReg == 1)
		{
			writeOneDataToCol(&resetData, vRdCntReg%RESHAPE_FACTOR, 0);
			glDVSSlice[currentLoadSliceIdx][vRdCntReg/RESHAPE_FACTOR][hRdCntReg] = resetData;
		}
	}
	else
	{
		tmpData = glDVSSlice[currentStoreSliceIdx][x/RESHAPE_FACTOR][y];
		tmpPixVal = readOneDataFromCol(tmpData, x%RESHAPE_FACTOR);
		tmpPixVal = (skipFlag) ? tmpPixVal : (ap_int<TS_TYPE_BIT_WIDTH>(tmpPixVal + polVal));
		if((ctrl & 0x30000) == 0x10000)
		{
			tmpPixVal = ts;
		}
		else if((ctrl & 0x30000) == 0x20000)
		{
			tmpPixVal = custData;
		}
		writeOneDataToCol(&tmpData, x%RESHAPE_FACTOR, tmpPixVal);
		glDVSSlice[currentStoreSliceIdx][x/RESHAPE_FACTOR][y] = tmpData;

		if(vRdCntReg >= 260 || hRdCntReg >= 346)
		{
			vgaReadPixVal = 0xaa;
		}
		else
		{
			resetData = glDVSSlice[currentLoadSliceIdx][vRdCntReg/RESHAPE_FACTOR][hRdCntReg];
			vgaReadPixVal = readOneDataFromCol(resetData, vRdCntReg%RESHAPE_FACTOR);
			if(vgaReadPixVal > 0) vgaReadPixVal = vgaReadPixVal + ((ctrl & 0xff00) >> 8);
			else if(vgaReadPixVal < 0) vgaReadPixVal = vgaReadPixVal - ((ctrl & 0xff00) >> 8);
//			if(vgaReadPixVal > 0) vgaReadPixVal = 0xff;
		}

		// This is the final sub-sampled pixel that will use this block address. Now we can reset it safely.
		if(hRdCntModReg == 1 && vRdCntModReg == 1)
		{
			writeOneDataToCol(&resetData, vRdCntReg%RESHAPE_FACTOR, 0);
			glDVSSlice[currentLoadSliceIdx][vRdCntReg/RESHAPE_FACTOR][hRdCntReg] = resetData;
		}
	}

	rgbFrameStream_t rgbStreamData;

	if(vgaOutputEn)
	{
		ap_uint<24> pixVal;
		pixVal = 0xff << 16;

		if((ctrl & 0x30000) == 0)     // Standard events display mode
		{
			if(vgaReadPixVal < 0)     // Display in Green for negative events
			{
				vgaReadPixVal=-vgaReadPixVal;
				pixVal = vgaReadPixVal.range(3,0);
				pixVal = (ap_uint<24>(pixVal) << 4);
			}
			else                     // Display in Red for positive events
			{
				pixVal = vgaReadPixVal.range(3,0);
				pixVal = (ap_uint<24>(pixVal) << 20);
			}
		}
		else
		{
//			if(vgaReadPixVal < 0)
//			{
//				vgaReadPixVal=-vgaReadPixVal;
//			}
			pixVal = (ap_uint<24>)vgaReadPixVal;
		}

//		if((ctrl & 0x20) == 0x20)
//		{
//			pixVal = (ap_uint<24>(pixVal) << 0);
//		}
//		if((ctrl & 0x10) == 0x10)
//		{
//			pixVal = (ap_uint<24>(pixVal) << 4);
//		}
//		else if((ctrl & 0x08) == 0x08)
//		{
//			pixVal = (ap_uint<24>(pixVal) << 8);
//		}
//		else if((ctrl & 0x04) == 0x04)
//		{
//			pixVal = (ap_uint<24>(pixVal) << 12);
//		}
//		else if((ctrl & 0x02) == 0x02)
//		{
//			pixVal = (ap_uint<24>(pixVal) << 16);
//		}
//		else
//		{
//			pixVal = (ap_uint<24>(pixVal) << 20);
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
	if(cntReg == 100000 * sliceDurationMs )   // Some condition is satisfied, rotate slice and enable VGA output.
	{
		cntReg = 0;
		if(startX >= 200)
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
	*polReg = pol;
	*skipFlgOutput = skipFlag;
}

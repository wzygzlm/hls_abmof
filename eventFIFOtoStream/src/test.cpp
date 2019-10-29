#include <stdlib.h>
#include <cmath>
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include "main.h"
using namespace std;
#include "ap_fixed.h"
#include "time.h"

#define TEST_TIMES 200

static int glDVSSliceSW[512][512];

void testVGAFrameSW(hls::stream< rgbFrameStream_t > &frameStream)
{
	for(int i = 0; i < 600; i++)
	{
		for(int j = 0; j < 800; j++)
		{
			ap_uint<24> pixVal = (j & 0xff) + ((j & 0xff) << 8) + ((j & 0xff) << 16);
			rgbFrameStream_t rgbStreamData;
			rgbStreamData.data = pixVal;
			rgbStreamData.dest = 0;
			rgbStreamData.id = 0;
			rgbStreamData.keep = 7;
			if(j == 799)
			{
				rgbStreamData.last = 1;
			}
			else
			{
				rgbStreamData.last = 0;
			}
			rgbStreamData.strb = 7;
			if(i == 0)
			{
				rgbStreamData.user = 1;
			}
			else
			{
				rgbStreamData.user = 0;
			}
			frameStream << rgbStreamData;
		}
	}
}


void EvStreamToFrmStreamMinizedSW(hls::stream< ap_uint<16> > &xStream, hls::stream< ap_uint<16> > &yStream,
		hls::stream< ap_uint<16> > &polStream, hls::stream< ap_uint<32> > &tsStream,
		hls::stream< ap_uint<32> > &frameStream)
{
	ap_uint<16> x = xStream.read();
	ap_uint<16> y = yStream.read();
	ap_uint<1> pol = polStream.read();
	ap_uint<32> ts = tsStream.read();

	static uint64_t lastTs = 0;

	if(ts > lastTs + 5000)
	{
		lastTs = ts;
		for(int i = 0; i < 800; i++)
		{
			for(int j = 0; j < 600; j++)
			{
				ap_uint<32> pixVal;
				if( i < 256 && j < 256)
				{
					pixVal = glDVSSliceSW[i][j];
					glDVSSliceSW[i][j] = 0;  // Reset
				}
				else
				{
					pixVal = 0;
				}

				frameStream << pixVal;
			}
		}
	}

	glDVSSliceSW[x][y] += 1;
}

void EVRawStreamToXYTSStreamSW(ap_uint<16> *eventFIFOIn,
		hls::stream< ap_uint<16> > &xStreamOut, hls::stream< ap_uint<16> > &yStreamOut, hls::stream< ap_uint<16> > &tsStreamOut)
{
	ap_uint<16> data = *eventFIFOIn++;
	if(data[15] == 1)
	{
		tsStreamOut << (ap_uint<16>)data.range(0, 14);
		xStreamOut << (ap_uint<16>)data.range(12, 14);
		yStreamOut << (ap_uint<16>)data.range(12, 14);
	}
//	else
//	{
//		if(data.range(12, 14) == 1)
//		{
//			yStreamOut << (ap_uint<16>)data.range(0, 11);
//		}
//		else if(data.range(12, 14) == 2 || data.range(12, 14) == 3)
//		{
//			xStreamOut << (ap_uint<16>)data.range(0, 11);
//		}
//	}

}

int main ()
{
	int testTimes = TEST_TIMES;

    int total_err_cnt = 0;
	int retval=0;
	hls::stream< ap_uint<16> > xHW, xSW, yHW, ySW, tsHW, tsSW;

	/******************* Test testVGAFrameSW module from random value**************************/
	testTimes = 5000;
	for(int k = 0; k < testTimes; k++)
	{
		cout << "Test " << k << ":" << endl;

		int err_cnt = 0;

		ap_uint<16> tmpData = rand();
		EVRawStreamToXYTSStreamSW(&tmpData, xSW, ySW, tsSW);
		EVRawStreamToXYTSStream(&tmpData, xHW, yHW, tsHW);

//		for(int i = 0; i < 600; i++)
//		{
//			for(int j = 0; j < 800; j++)
//			{
				if(!xSW.empty() && !ySW.empty() && tsSW.empty())
				{
					ap_uint<16> tmpXSW, tmpXHW, tmpYSW, tmpYHW, tmptsSW, tmptsHW;
					xSW >> tmpXSW;
					ySW >> tmpYSW;
					tsSW >> tmptsSW;

					xHW >> tmpXHW;
					ySW >> tmpYHW;
					tsSW >> tmptsHW;
				}


//				if(pixValSW.data != pixVal.data)
//				{
//					err_cnt++;
//					cout << "Mismatch detected on TEST " << k << " and the mismatch index is: (" << i  << " , "<< j << ")" <<endl;
//				}
//			}
//		}

		if(err_cnt == 0)
		{
			cout << "Test " << k << " passed." << endl;
		}
		else
		{
			cout << "Test " << k << " failed!!!" << endl;
		}
		total_err_cnt += err_cnt;
		cout << endl;
	}

//	/******************* Test testVGAFrameSW module from random value**************************/
//	int32_t eventCnt = 5000;
//	uint8_t x[eventCnt], y[eventCnt];
//	uint64_t ts[eventCnt];
//	bool pol[eventCnt];
//	uint64_t data[eventCnt];
//	uint64_t eventSlice[eventCnt], eventSliceSW[eventCnt];
//
//	testTimes = 10;
//	for(int k = 0; k < testTimes; k++)
//	{
//		cout << "Test " << k << ":" << endl;
//
//	    int err_cnt = 0;
//
//		for (int i = 0; i < eventCnt; i++)
//		{
//			ts[i]  = rand();
//		}
//		sort(ts, ts+eventCnt);
//
//		for (int i = 0; i < eventCnt; i++)
//		{
//			x[i] = rand()%240;
//			y[i] = rand()%180;
//			pol[i] = 1;
////			idx = rand()%3;
//	//		x = 255;
//	//		y = 240;
////			cout << "x : " << x << endl;
////			cout << "y : " << y << endl;
////			cout << "idx : " << idx << endl;
//
//			data[i] = (uint64_t)(ts[i] << 32) + (uint64_t)(x[i] << 17) + (uint64_t)(y[i] << 2) + (pol[i] << 1);
////			cout << "data[" << i << "] is: "<< hex << data[i]  << endl;
//		}
//		for (int j = 0; j < eventCnt; j++)
//		{
//			if (eventSlice[j] != eventSliceSW[j])
//			{
//				std::cout << "eventSliceSW is: " << eventSliceSW[j] << std::endl;
//				std::cout << "eventSlice is: " << eventSlice[j] << std::endl;
//
//				cout << "j : " << j << endl;
//				cout << "x : " << int(x[j]) << endl;
//				cout << "y : " << int(y[j]) << endl;
//				cout << "ts : " << ts[j] << endl;
//				cout << "pol : " << pol[j] << endl;
//
//				err_cnt++;
//				cout << "Mismatch detected on TEST " << k << " and the mismatch index is: " << j << endl;
//			}
//		}
//
//		if(err_cnt == 0)
//		{
//			cout << "Test " << k << " passed." << endl;
//		}
//		else
//		{
//			cout << "Test " << k << " failed!!!" << endl;
//		}
//		total_err_cnt += err_cnt;
//		cout << endl;
//	}

	if (total_err_cnt == 0)
	{
			cout<<"*** TEST PASSED ***" << endl;
			retval = 0;
	} else
	{
			cout<<"!!! TEST FAILED - " << total_err_cnt << " mismatches detected !!!";
			cout<< endl;
			retval = -1;
	}

	// Return 0 if the test passes
	return retval;
}

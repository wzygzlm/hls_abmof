#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "abmofAccel.h"
#include "time.h"

#define TEST_TIMES 10

static col_pix_t slices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdx;

void resetPixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	slices[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

void writePixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	int8_t yNewIdx = y%COMBINED_PIXELS;
	cout << "Data before write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
	pix_t tmp = slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
	tmp += 1;
	slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) = tmp;
	cout << "Data after write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
}

void readBlockColsSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	two_cols_pix_t refColData;
	// concatenate two columns together
	refColData = (slices[sliceIdxRef][x][y/COMBINED_PIXELS + 1], slices[sliceIdxRef][x][y/COMBINED_PIXELS]);
//	cout << "refColData: " << refColData.range(255, 192) << endl;

	// concatenate two columns together
	two_cols_pix_t tagColData;
	// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
	tagColData = (slices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS + 1], slices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS]);

	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refCol[i] = refColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		tagCol[i] = tagColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		yColOffsetIdx++;
	}
}

void colSADSumSW(pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t out[2 * SEARCH_DISTANCE + 1])
{
	cout << "in1 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in1[m] << " ";
	}
	cout << endl;

	cout << "in2 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in2[m] << " ";
	}
	cout << endl;

	for(int i = 0; i <= 2 * SEARCH_DISTANCE; i++)
	{
		int16_t tmpOut = 0;
		for(int j = 0; j < BLOCK_SIZE; j++)
		{
			tmpOut += abs(in1[j] - in2[i+j]);
		}
//		cout << "tmpOut is " << tmpOut << endl;
		out[i] = tmpOut;
	}
}

// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.

static ap_int<16> miniRetVal[2*SEARCH_DISTANCE + 1] = {0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff};
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1] = {0, 0, 0, 0, 0, 0, 0};
static ap_int<16> localSumReg[BLOCK_SIZE][2*SEARCH_DISTANCE + 1];

static int16_t testTmpSum;
void miniSADSumSW(pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t shiftCnt,
		ap_int<16> *miniSumRet,
		ap_uint<6> *OFRet)
{
	int16_t out[2*SEARCH_DISTANCE + 1];

	colSADSumSW(in1, in2, out);

	ap_uint<1> cond1 = (shiftCnt > BLOCK_SIZE - 1) ? 1 : 0;
	for(int8_t i = 0; i < BLOCK_SIZE - 1; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[BLOCK_SIZE - 1][j] = out[j];
	}

	ap_uint<3> OFRet_x;
	for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = 0;
		for(int8_t j = 0; j <= BLOCK_SIZE - 1; j++)
		{
			miniSumTmp[i] += localSumReg[j][i];
		}

		if (miniSumTmp[i] < miniRetVal[i])
		{
			if((shiftCnt > BLOCK_SIZE - 1))
			{
				OFRet_x = ap_uint<3>(shiftCnt - BLOCK_SIZE - 1);
				miniRetVal[i] = miniSumTmp[i];
			}
		}
	}

	cout << "miniSumTmp is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniSumTmp[m] << " ";
	}
	cout << endl;

	cout << "miniRetVal is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniRetVal[m] << " ";
	}
	cout << endl;

	// Convert it to standard c type, so min function could be used.
	uint16_t intMiniRetVal[2*SEARCH_DISTANCE + 1];
	for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
	{
		intMiniRetVal[j] = miniRetVal[j].to_short();
	}

	ap_uint<3> OFRet_y;
	testTmpSum = *min_element(intMiniRetVal, intMiniRetVal + 2*SEARCH_DISTANCE + 1);
	OFRet_y = distance(intMiniRetVal, min_element(intMiniRetVal, intMiniRetVal + 2*SEARCH_DISTANCE + 1));
	cout << "Minimal value in int16_t is: " << testTmpSum << endl;
	*miniSumRet = ap_int<16>(*min_element(miniRetVal, miniRetVal + 2*SEARCH_DISTANCE + 1));

	*OFRet = (cond1) ? ap_uint<6>(OFRet_y.concat(OFRet_x)) : ap_uint<6>(0);

	cout << "OF_x is: " << OFRet_x << "\t OF_y is: " << OFRet_y << endl;
}



void parseEventsSW(uint64_t * dataStream, int32_t eventsArraySize, int32_t *eventSlice)
{
	glPLActiveSliceIdx++;
	sliceIdx_t idx = glPLActiveSliceIdx;

	for(int32_t i = 0; i < eventsArraySize; i++)
	{
		uint64_t tmp = dataStream[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		ap_int<16> miniRet;
		ap_uint<6> OFRet = 0;    // TODO: maybe change the initial value.

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; xOffSet++)
		{
//			xRd = (xOffSet == 0)? (ap_uint<8>)(xStream.read()): xRd;
//			yRd = (xOffSet == 0)? (ap_uint<8>)(yStream.read()): yRd;
			if (xOffSet == 0)
			{
				writePixSW(xWr, yWr, idx);

				resetPixSW(i/PIXS_PER_COL, (i % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i/PIXS_PER_COL, (i % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i, 64, (sliceIdx_t)(idx + 3));
//				resetPix(i, 96, (sliceIdx_t)(idx + 3));

//				resetPix(i, 128, (sliceIdx_t)(idx + 3));
//				resetPix(i, 160, (sliceIdx_t)(idx + 3));
//				resetPix(i, 192, (sliceIdx_t)(idx + 3));
//				resetPix(i, 224, (sliceIdx_t)(idx + 3));

				miniRetVal = ap_int<16>(0x7fff);

				initMiniSumLoop : for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
				{
					miniSumTmp[i] = ap_int<16>(0);
				}
			}
			else
			{
				pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

	//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

				readBlockColsSW(xWr + xOffSet - 1, yWr , idx + 1, idx + 2, out1, out2);

				miniSADSumSW(out1, out2, xOffSet, &miniRet, &OFRet);   // Here k starts from 1 not 0.
			}
		}
		apUint17_t tmp1 = apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
		ap_int<9> tmp2 = miniRet.range(8, 0);
		apUint6_t tmpOF = OFRet;
		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
	}

	resetLoop: for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
	}
}

int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

    int err_cnt = 0;
	int retval=0;

	int32_t eventsArraySize = 500;
	uint64_t data[eventsArraySize];
	int32_t eventSlice[eventsArraySize], eventSliceSW[eventsArraySize];

	ap_int<16> miniSumRet;
	pix_t refColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t refColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for(int k = 0; k < testTimes; k++)
	{
		ap_uint<64> x, y;
		ap_uint<2> idx;

		for (int i = 0; i < eventsArraySize; i++)
		{
			cout << "Test " << k << ":" << endl;
			x = rand()%20;
			y = rand()%20;
			idx = rand()%3;
	//		x = 255;
	//		y = 240;
	//		idx++;
			cout << "x : " << x << endl;
			cout << "y : " << y << endl;
			cout << "idx : " << idx << endl;

			data[i] = (uint64_t)(x << 17) + (uint64_t)(y << 2) + (1 << 1);
		}

		parseEventsSW(data, eventsArraySize, eventSliceSW);
		parseEvents(data, eventsArraySize, eventSlice);

		for (int j = 0; j < eventsArraySize; j++)
		{
			if (eventSlice[j] != eventSliceSW[j])
			{
				err_cnt++;
				cout << "Mismatch detected on TEST " << k << " and the mismatch index is: " << j << endl;
			}
		}
	}

	if (err_cnt == 0)
	{
			cout<<"*** TEST PASSED ***" << endl;
			retval = 0;
	} else
	{
			cout<<"!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
			cout<< endl;
			retval = 0;
	}

	// Return 0 if the test passes
	return retval;
}

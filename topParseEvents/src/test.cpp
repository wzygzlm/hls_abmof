#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "abmofAccel.h"
#include "time.h"

#define TEST_TIMES 51

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

static ap_int<16> miniRetVal = 0x7fff;
static ap_uint<6> minOFRet = ap_uint<6>(0xff);

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

	ap_uint<1> cond1 = (shiftCnt >= BLOCK_SIZE - 1) ? 1 : 0;
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


	ap_uint<3> OFRet_x = minOFRet.range(2, 0);
	ap_uint<3> OFRet_y = minOFRet.range(5, 3);

	for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = 0;
		for(int8_t j = 0; j <= BLOCK_SIZE - 1; j++)
		{
			miniSumTmp[i] += localSumReg[j][i];
		}
	}

	cout << "miniSumTmp is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniSumTmp[m] << " ";
	}
	cout << endl;

	// Find the minimal of current column.
	ap_int<16> miniRetValTmpIter = ap_int<16>(*min_element(miniSumTmp, miniSumTmp + 2*SEARCH_DISTANCE + 1));
	int miniIdx = distance(miniSumTmp, min_element(miniSumTmp, miniSumTmp + 2*SEARCH_DISTANCE + 1));

	// Compare with current global minimum value.
	if (miniRetValTmpIter < miniRetVal)
	{
		if((shiftCnt >= BLOCK_SIZE - 1))
		{
			miniRetVal = miniRetValTmpIter;     // Update the global value
			OFRet_x = ap_uint<3>(shiftCnt - BLOCK_SIZE + 1);   // Record the shift value and store it in OFRet_x
			OFRet_y = ap_uint<3>(miniIdx);
			minOFRet = OFRet_y.concat(OFRet_x);     // Update the OF value.
			cout << "OF and global minimum updated at index shiftCnt: " << shiftCnt << endl;
		}
	}

	cout << "OF_x is: " << OFRet_x << "\t OF_y is: " << OFRet_y << endl;

	*miniSumRet = miniRetVal;
	*OFRet = minOFRet;
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
		initMiniSumLoop : for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			miniSumTmp[j] = ap_int<16>(0);
		}

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE; xOffSet++)
		{

			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];


			readBlockColsSW(xWr + xOffSet, yWr , idx + 1, idx + 2, out1, out2);

			miniSADSumSW(out1, out2, xOffSet, &miniRet, &OFRet);   // Here k starts from 1 not 0.

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

//	for(int k = 0; k < testTimes; k++)
//	{
//		ap_uint<64> x, y;
//		ap_uint<2> idx;
//
//		for (int i = 0; i < eventsArraySize; i++)
//		{
//			cout << "Test " << k << ":" << endl;
//			x = rand()%20;
//			y = rand()%20;
//			idx = rand()%3;
//	//		x = 255;
//	//		y = 240;
//	//		idx++;
//			cout << "x : " << x << endl;
//			cout << "y : " << y << endl;
//			cout << "idx : " << idx << endl;
//
//			data[i] = (uint64_t)(x << 17) + (uint64_t)(y << 2) + (1 << 1);
//		}
//
//		parseEventsSW(data, eventsArraySize, eventSliceSW);
//		parseEvents(data, eventsArraySize, eventSlice);
//
//		for (int j = 0; j < eventsArraySize; j++)
//		{
//			if (eventSlice[j] != eventSliceSW[j])
//			{
//				err_cnt++;
//				cout << "Mismatch detected on TEST " << k << " and the mismatch index is: " << j << endl;
//			}
//		}
//	}

	/******************* Test miniSADSum module **************************/
	pix_t input1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			input2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	ap_int<16> miniSum, miniSumSW;
	ap_uint<6> OFRet, OFRetSW;

	for(int k = 0; k < TEST_TIMES; k++)
	{
		cout << "Test " << k << ":" << endl;

		for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			input1[j] = rand() % 16;
			input2[j] = rand() % 16;
		}
		miniSADSumSW(input1, input2, k, &miniSumSW, &OFRetSW);
		miniSADSum(input1, input2, k + 1, &miniSum, &OFRet);

		// Compare the results file with the golden results
		cout << "miniSumSW is: " << miniSumSW << "\t OFRetSW is: " << hex << OFRetSW << endl;
		cout << dec;    // Restore dec mode

		cout << "miniSumHW is: " << miniSum << "\t OFRetHW is: " << hex << OFRet << endl;
		cout << dec;    // Restore dec mode

		for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
		{
			if(miniSum != miniSumSW || OFRet != OFRetSW)
			{
				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << i << "!!!" << endl;
			}
		}

		cout << endl;
	}

//		/******************* Test min module **************************/
//		ap_int<16> testData[2*SEARCH_DISTANCE + 1];
//		ap_int<16> minSW, minHW;
//		int8_t indexSW, indexHW;
//
//		cout << "Start testing min module...... " << endl;
//
//		for(int k = 0; k < TEST_TIMES; k++)
//		{
//			cout << "Test " << k << ":" << endl;
//
//			for(int j = 0; j < 2*SEARCH_DISTANCE + 1; j++)
//			{
//				testData[j] = ap_int<16>(rand());
//			}
//
//			cout << "Test data is: " << endl;
//			for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//			{
//				cout << testData[m].to_short() << " ";
//			}
//			cout << endl;
//
//			minSW = *min_element(testData, testData + 2*SEARCH_DISTANCE + 1);
//			indexSW = distance(testData, min_element(testData, testData + 2*SEARCH_DISTANCE + 1));
//			minHW = min(testData, &indexHW);
//
//			cout << "minSW is: " << minSW.to_short() << "\t indexSW is: " << (short)indexSW << endl;
//			cout << "minHW is: " << minHW.to_short() << "\t indexHW is: " << (short)indexHW << endl;
//
//			if((minSW != minHW) || (indexSW != indexHW))
//			{
//				err_cnt++;
//				cout<<"!!! ERROR: Mismatch detected at index" << k << "!!!" << endl;
//			}
//			cout << endl;
//		}

	if (err_cnt == 0)
	{
			cout<<"*** TEST PASSED ***" << endl;
			retval = 0;
	} else
	{
			cout<<"!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
			cout<< endl;
			retval = -1;
	}

	// Return 0 if the test passes
	return retval;
}

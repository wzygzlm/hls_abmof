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
//	cout << "Data before write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
	pix_t tmp = slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
	tmp += 1;
	slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) = tmp;
//	cout << "Data after write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
}

void readBlockColsSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	two_cols_pix_t refColData;
	// concatenate two columns together
	refColData = (slices[sliceIdxRef][x][y/COMBINED_PIXELS], slices[sliceIdxRef][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);
//	cout << "refColData: " << refColData.range(255, 192) << endl;

	// concatenate two columns together
	two_cols_pix_t tagColData;
	// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
	tagColData = (slices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], slices[(sliceIdx_t)(sliceIdxTag + 0)][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

	// find the bottom pixel of the column that centered on y.
	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

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

	std::cout << "miniSumRetSW is: " << *miniSumRet << "\t OFRetSW is: " << std::hex << *OFRet << std::endl;
	std::cout << std::dec;    // Restore dec mode
}


void testMiniSADSumWrapperSW(apIntBlockCol_t *input1, apIntBlockCol_t *input2, int16_t eventCnt, apUint15_t *miniSum, apUint6_t *OF)
{
	pix_t ref[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tag[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	apIntBlockCol_t inData1, inData2;
	ap_int<16> miniSumSWRet;
	ap_uint<6> OFRetSWRet;

	for(int32_t i = 0; i < eventCnt; i++)
	{
		// Initialize the localSumReg
		for(int idx1 = 0; idx1 < BLOCK_SIZE; idx1++)
		{
			for(int idx2 = 0; idx2 < BLOCK_SIZE; idx2++)
			{
				localSumReg[idx1][idx2] = 0;
			}
		}
		miniRetVal = 0x7fff;
		minOFRet = ap_uint<6>(0xff);

		for(int shiftOffset = 0; shiftOffset < BLOCK_SIZE + 2 * SEARCH_DISTANCE; shiftOffset++)
		{
			cout << "current iteration index is: " << i * (BLOCK_SIZE + 2 * SEARCH_DISTANCE) + shiftOffset << endl;
			inData1 = *input1++;
			inData2 = *input2++;

			for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
			{
				ref[j] = pix_t(inData1.range(4*j + 3, 4*j));
				tag[j] = pix_t(inData2.range(4*j + 3, 4*j));
			}

			miniSADSumSW(ref, tag, shiftOffset, &miniSumSWRet, &OFRetSWRet);
		}

		std::cout << "miniSumRetSW is: " << apUint15_t(miniSumSWRet) << "\t OFRetSW is: " << std::hex << OFRetSWRet << std::endl;
		cout << dec;

		miniSum[i] = apUint15_t(miniSumSWRet);
		OF[i] = OFRetSWRet;
	}
}

void testSingleRwslicesSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePixSW(x, y, idx);
	readBlockColsSW(x, y, idx + 1, idx + 2, refCol, tagCol);
	resetPixSW(x, y, idx + 3);
}

void testRwslicesSW(uint64_t * data, sliceIdx_t idx, int16_t eventCnt, apIntBlockCol_t *refData, apIntBlockCol_t *tagData)
{
	// Check the accumulation slice is clear or not
	for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
	{
		for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
		{
			if (slices[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
			{
				cout << "Ha! I caught you, the pixel which is not clear!" << endl;
				cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << endl;
			}
		}
	}

	for(int32_t i = 0; i < eventCnt; i++)
	{
		uint64_t tmp = *data++;
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		writePixSW(xWr, yWr, idx);

		resetPixSW(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//		cout << "tmp is: " << hex << tmp << endl;
//		cout << "x is: " << xWr << "\t y is: " << yWr << "\t idx is: " << idx << endl;

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE; xOffSet++)
		{
			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

			readBlockColsSW(xWr, yWr , idx + 1, idx + 2, out1, out2);

			apIntBlockCol_t refBlockCol;
			apIntBlockCol_t tagBlockCol;

			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
				tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
			}

			*refData++ = refBlockCol;
			*tagData++ = tagBlockCol;
		}
	}


//	for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
//	{
//		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//	}
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

//	int32_t eventsArraySize = 500;
//	uint64_t data[eventsArraySize];
//	int32_t eventSlice[eventsArraySize], eventSliceSW[eventsArraySize];
//
//	ap_int<16> miniSumRet;
//	pix_t refColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
//	pix_t refColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
//
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

	/******************* Test rwSlices module **************************/
//	srand((unsigned)time(NULL));
	int16_t eventCnt = 1000;

	uint64_t data[eventCnt];
	apIntBlockCol_t refData[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)], tagData[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)];
	apIntBlockCol_t refDataSW[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)], tagDataSW[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)];

	ap_uint<64> x, y;
	sliceIdx_t idx;

	for(int k = 0; k < TEST_TIMES; k++)
	{
		cout << "Test " << k << ":" << endl;

		idx = sliceIdx_t(idx - 1);

		for (int i = 0; i < eventCnt; i++)
		{
			x = rand()%20;
			y = rand()%20 + COMBINED_PIXELS;
//			idx = rand()%3;
	//		x = 255;
	//		y = 240;
//			cout << "x : " << x << endl;
//			cout << "y : " << y << endl;
//			cout << "idx : " << idx << endl;

			data[i] = (uint64_t)(x << 17) + (uint64_t)(y << 2) + (1 << 1);
//			cout << "data[" << i << "] is: "<< hex << data[i]  << endl;
		}


		testRwslicesSW(data, idx, eventCnt, refDataSW, tagDataSW);
		testRwslices(data, idx, eventCnt, refData, tagData);

		for (int m = 0; m < eventCnt; m++)
		{
//			cout  << "refDataSW is: " << hex <<  refDataSW[m] << endl;
//			cout  << "tagDataSW is: " << hex <<  tagDataSW[m] << endl;
//			cout  << "refDataHW is: " << hex <<  refData[m] << endl;
//			cout  << "tagDataHW is: " << hex <<  tagData[m] << endl;
//			cout << dec;

			if(refDataSW[m] != refData[m] || tagDataSW[m] != tagData[m])
			{
				pix_t outSW1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t outSW2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t outHW1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t outHW2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

				for(int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
				{
					outSW1[i] = refDataSW[m].range(4 * i + 3, 4 * i);
					outSW2[i] = tagDataSW[m].range(4 * i + 3, 4 * i);
					outHW1[i] = refData[m].range(4 * i + 3, 4 * i);
					outHW2[i] = tagData[m].range(4 * i + 3, 4 * i);
				}

				cout << "refDataSW is:  ";
				for (int n = 0; n < BLOCK_SIZE + 2 * SEARCH_DISTANCE; n++)
				{
					cout << outSW1[n] << " ";
				}
				cout << "\t" ;

				cout << "tagDataSW is:  ";
				for (int n = 0; n < BLOCK_SIZE + 2 * SEARCH_DISTANCE; n++)
				{
					cout << outSW2[n] << " ";
				}
				cout << endl;

				cout << "refData is:  ";
				for (int n = 0; n < BLOCK_SIZE + 2 * SEARCH_DISTANCE; n++)
				{
					cout << outHW1[n] << " ";
				}
				cout << "\t" ;

				cout << "tagData is:  ";
				for (int n = 0; n < BLOCK_SIZE + 2 * SEARCH_DISTANCE; n++)
				{
					cout << outHW2[n] << " ";
				}
				cout << endl;

//				std::cout << "refDataSW is: " << refDataSW[m].to_ulong() << "\t tagDataSW is: " << std::hex << tagDataSW[m].to_ulong() << std::endl;
//				std::cout << "refData is: " << refData[m].to_ulong() << "\t tagData is: " << std::hex << tagData[m].to_ulong() << std::endl;

				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << m << "!!!" << endl;
			}
		}

		if(err_cnt == 0)
		{
			cout << "Test " << k << " passed." << endl;
		}
		cout << endl;
	}
	/******************* Test miniSADSumWrapper module **************************/
//	srand((unsigned)time(NULL));
//	int16_t eventCnt = 20;
//
//	apIntBlockCol_t refBlockColData[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)];
//	apIntBlockCol_t tagBlockColData[eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)];
//
//	apUint15_t miniSum[eventCnt], miniSumSW[eventCnt];
//	apUint6_t OFRet[eventCnt], OFRetSW[eventCnt];
//
//	for(int k = 0; k < TEST_TIMES; k++)
//	{
//		cout << "Test " << k << ":" << endl;
////		cout << "Input data is: " << endl;
//		for (int i = 0; i < eventCnt * (BLOCK_SIZE + 2 * SEARCH_DISTANCE); i++)
//		{
////			cout << "#" << i << ": " <<  endl;
//
//			for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
//			{
//				pix_t tmp1 = pix_t(rand() % 16);
//				pix_t tmp2 = pix_t(rand() % 16);
//				refBlockColData[i].range(4 * j + 3, 4 * j) = tmp1;
//				tagBlockColData[i].range(4 * j + 3, 4 * j) = tmp2;
//
////				cout << tmp1 << "  " << tmp2 << "  ";
//			}
////			cout << endl;
////			cout << "refBlockColData[eventCnt] is: " << refBlockColData[eventCnt] << "\t tagBlockColData[eventCnt] is: " << tagBlockColData[eventCnt] << endl;
//		}
//		testMiniSADSumWrapperSW(refBlockColData, tagBlockColData, eventCnt, miniSumSW, OFRetSW);
//		testMiniSADSumWrapper(refBlockColData, tagBlockColData, eventCnt, miniSum, OFRet);
//
//		for (int m = 0; m < eventCnt; m++)
//		{
//			if(miniSumSW[m] != miniSum[m] || OFRetSW[m] != OFRet[m])
//			{
//				std::cout << "miniSumRetSW is: " << miniSumSW[m] << "\t OFRetSW is: " << std::hex << OFRetSW[m] << std::endl;
//				std::cout << "miniSumRetHW is: " << miniSum[m] << "\t OFRetHW is: " << std::hex << OFRet[m] << std::endl;
//
//				err_cnt++;
//				cout<<"!!! ERROR: Mismatch detected at index" << m << "!!!" << endl;
//			}
//		}
//
//		cout << endl;
//		cout << endl;
//		cout << endl;
//		cout << endl;
//	}


//	/******************* Test miniSADSum module **************************/
//	srand((unsigned)time(NULL));
//
//	pix_t input1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
//			input2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
//	ap_int<16> miniSum, miniSumSW;
//	ap_uint<6> OFRet, OFRetSW;
//
//	for(int k = 0; k < TEST_TIMES; k++)
//	{
//		cout << "Test " << k << ":" << endl;
//
//		for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
//		{
//			input1[j] = rand() % 16;
//			input2[j] = rand() % 16;
//		}
//		miniSADSumSW(input1, input2, k, &miniSumSW, &OFRetSW);
//		miniSADSum(input1, input2, k + 1, &miniSum, &OFRet);
//
//		// Compare the results file with the golden results
//		cout << "miniSumSW is: " << miniSumSW << "\t OFRetSW is: " << hex << OFRetSW << endl;
//		cout << dec;    // Restore dec mode
//
//		cout << "miniSumHW is: " << miniSum << "\t OFRetHW is: " << hex << OFRet << endl;
//		cout << dec;    // Restore dec mode
//
//		for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
//		{
//			if(miniSum != miniSumSW || OFRet != OFRetSW)
//			{
//				err_cnt++;
//				cout<<"!!! ERROR: Mismatch detected at index" << i << "!!!" << endl;
//			}
//		}
//
//		cout << endl;
//	}

//	/******************* Test singleRwslices module **************************/
//	pix_t refColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
//	pix_t refColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
//
//	for(int k = 0; k < testTimes; k++)
//	{
//		ap_uint<8> x, y;
//		ap_uint<2> idx;
//
//		cout << "Test " << k << ":" << endl;
//		x = rand()%20;
//		y = rand()%20;
//		idx = rand()%3;
////		x = 255;
////		y = 240;
////		idx++;
//		cout << "x : " << x << endl;
//		cout << "y : " << y << endl;
//		cout << "idx : " << idx << endl;
//
//		testSingleRwslicesSW(x, y, idx, refColSW, tagColSW);
//		testSingleRwslicesHW(x, y, idx, refColHW, tagColHW);
//
//		cout << "refColSW is: " << endl;
//		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << refColSW[m] << " ";
//		}
//		cout << endl;
//
//		cout << "tagColSW is: " << endl;
//		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << tagColSW[m] << " ";
//		}
//		cout << endl;
//
//		cout << "refColHW is: " << endl;
//		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << refColHW[m] << " ";
//		}
//		cout << endl;
//
//		cout << "tagColHW is: " << endl;
//		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << tagColHW[m] << " ";
//		}
//		cout << endl;
//
//		for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//		{
//			{
//				if((refColHW[i] != refColSW[i]) || (tagColHW[i] != tagColSW[i]))
//				{
//					err_cnt++;
//					cout<<"!!! ERROR: Mismatch detected at index" << i << " !!!" << endl;
//				}
//			}
//		}
//
//		cout << endl;
//	}


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

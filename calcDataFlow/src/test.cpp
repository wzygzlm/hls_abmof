#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "calcDataFlow.h"
#include "time.h"

#define TEST_TIMES 100

void colSADSumSW(pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
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


static ap_int<16> miniRetVal[2*SEARCH_DISTANCE + 1] = {0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff};
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1] = {0, 0, 0, 0, 0, 0, 0};
static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];

void miniSADSumSW(pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> miniSumRet[2*SEARCH_DISTANCE + 1])
{
	static int16_t shiftCnt = 0;
	int16_t out[2*SEARCH_DISTANCE + 1];

	colSADSumSW(in1, in2, out);


	for(int8_t i = 0; i < 2*SEARCH_DISTANCE; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[2*SEARCH_DISTANCE][j] = out[j];
	}

	for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = 0;
		for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			miniSumTmp[i] += localSumReg[j][i];
		}
		miniRetVal[i] = (miniSumTmp[i] < miniRetVal[i]) && (shiftCnt >= 2*SEARCH_DISTANCE) ? miniSumTmp[i] : miniRetVal[i];
	}

	cout << "miniSumTmp is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniSumTmp[m] << " ";
	}
	cout << endl;

	for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
	{
		miniSumRet[j] = miniRetVal[j];
	}

	shiftCnt++;
}

int main()
{
	pixel_t input1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			input2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	ap_int<16> sumArray[2*SEARCH_DISTANCE + 1], sumArraySW[2*SEARCH_DISTANCE + 1];

    int err_cnt = 0;
	int retval=0;

	srand((unsigned)time(NULL));
	for(int k = 0; k < TEST_TIMES; k++)
	{
		cout << "Test " << k << ":" << endl;

		for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			input1[j] = rand() % 16;
			input2[j] = rand() % 16;
		}
		miniSADSum(input1, input2, sumArray);
		miniSADSumSW(input1, input2, sumArraySW);

		// Compare the results file with the golden results
		cout << "sumArray is: " << endl;
		for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
		{
			cout << sumArray[m] << " ";
		}
		cout << endl;

		cout << "sumArraySW is: " << endl;
		for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
		{
			cout << sumArraySW[m] << " ";
		}
		cout << endl;

		for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
		{
			if(sumArray[i] != sumArraySW[i])
			{
				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << i << "!!!" << endl;
			}
		}

		cout << endl;
	}

	if (err_cnt == 0) {
		cout<<"*** TEST PASSED ***" << endl;
		retval = 0;
	} else {
		cout<<"!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
		cout<< endl;
		retval = -1;
	}

	// Return 0 if the test passes
	return retval;
}

#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "calcDataFlow.h"

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
		cout << "tmpOut is " << tmpOut << endl;
		out[i] = tmpOut;
	}
}

int main()
{
	pixel_t input1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], input2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t sumArray[2*SEARCH_DISTANCE + 1], sumArraySW[2*SEARCH_DISTANCE + 1];

    int err_cnt = 0;
	int retval=0;

	for(int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		input1[i] = rand() % 16;
		input2[i] = rand() % 16;
	}

	colSADSum(input1, input2, sumArray);

	colSADSumSW(input1, input2, sumArraySW);

	// Compare the results file with the golden results
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
//		cout<<"The " << i << "th element of sumArraySW is " << sumArray[i]<<endl;
//		cout<<"The " << i << "th element of sumArraySW is " << sumArraySW[i]<<endl;
		if(sumArray[i] != sumArraySW[i])
		{
			err_cnt++;
			cout<<"!!! ERROR: Mismatch detected at index" << i << "!!!" << endl;
		}
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

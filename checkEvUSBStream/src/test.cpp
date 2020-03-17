#include <iostream>
#include "ap_int.h"
#include<stdint.h>
#include "hls_stream.h"
#include "assert.h"
#include "main.h"
using namespace std;
#include "ap_fixed.h"
#include "time.h"

const static int MAX_NUMBER=1000;
#define DTYPE ap_uint<32>
#define TEST_TIMES 200

int main ()
 {
	int testTimes = TEST_TIMES;

    int total_err_cnt = 0;
	int retval=0;
	/******************* Test parseEvents module from random value**************************/
	int32_t eventCnt = 5000;
	ap_uint<1> dataRd[eventCnt], dataVd[eventCnt];
	ap_uint<8> data[eventCnt];


	testTimes = 10;

	for(int k = 0; k < testTimes; k++)
	{
		cout << "Test " << k << ":" << endl;

	    int err_cnt = 0;


		for (int i = 0; i < eventCnt; i++)
		{
			dataRd[i] = rand()%2;
			dataVd[i] = rand()%2;
			data[i] = rand()%240;
		}

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

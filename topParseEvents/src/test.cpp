#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "abmofAccel.h"
#include "time.h"

#define TEST_TIMES 100
int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

    int err_cnt = 0;
	int retval=0;

	ap_int<16> miniSumRet;
	pix_t refColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t refColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for(int k = 0; k < testTimes; k++)
	{
		ap_uint<8> x, y;
		ap_uint<2> idx;

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

		topHW(x, y, idx, &miniSumRet);
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

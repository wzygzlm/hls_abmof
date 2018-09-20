#include <iostream>
#include "ap_fixed.h"
#include "readBlocks.h"
#include <cstdlib>
using namespace std;

#define TEST_TIMES 10


static col_pix_t slices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];

void writePixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	int8_t yNewIdx = y%COMBINED_PIXELS;
//	cout << "Data before write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
	pix_t tmp = slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
	tmp += 1;
	slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) = tmp;
//	cout << "Data after write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
}

int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

    int err_cnt = 0;
	int retval=0;

	for(int k = 0; k < testTimes; k++)
	{
		ap_uint<8> x, y;

		cout << "Test " << k << ":" << endl;
		x = rand()%256;
		y = rand()%256;
		cout << "x : " << x << endl;
		cout << "y : " << y << endl;

		writePixSW(x, y, 0);
		writePix(x, y, 0);
		cout << endl;
	}

	for (int i = 0; i < SLICE_WIDTH; i++)
	{
		for (int j = 0; j < SLICE_HEIGHT; j++)
		{
			int8_t yNewIdx = j%COMBINED_PIXELS;
			pix_t swPix = slices[0][i][j/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
			pix_t hwPix  = readPix(i, j, 0);
			if(hwPix != swPix)
			{
				cout << "hwPix is : " << hwPix << "\t";
				cout << "swPix is : " << swPix << endl;
				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << "( " << i << ", " << j << " )!!!" << endl;
			}
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

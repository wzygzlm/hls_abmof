#include <iostream>
#include "ap_fixed.h"
#include "readBlocks.h"
#include <cstdlib>
using namespace std;

#define TEST_TIMES 200


static col_pix_t slices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];

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

void topSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePixSW(x, y, idx);
	readBlockColsSW(x, y - BLOCK_SIZE/2 - SEARCH_DISTANCE, idx + 1, idx + 2, refCol, tagCol);
	resetPixSW(x, y, idx + 3);
}

int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

    int err_cnt = 0;
	int retval=0;
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

		topSW(x, y, idx, refColSW, tagColSW);
		topHW(x, y, idx, refColHW, tagColHW);

		cout << "refColSW is: " << endl;
		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
		{
			cout << refColSW[m] << " ";
		}
		cout << endl;

		cout << "tagColSW is: " << endl;
		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
		{
			cout << tagColSW[m] << " ";
		}
		cout << endl;

		cout << "refColHW is: " << endl;
		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
		{
			cout << refColHW[m] << " ";
		}
		cout << endl;

		cout << "tagColHW is: " << endl;
		for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
		{
			cout << tagColHW[m] << " ";
		}
		cout << endl;

		for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			{
				if((refColHW[i] != refColSW[i]) || (tagColHW[i] != tagColSW[i]))
				{
					err_cnt++;
					cout<<"!!! ERROR: Mismatch detected at index" << i << " !!!" << endl;
				}
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

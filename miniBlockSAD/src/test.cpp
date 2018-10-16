#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "ambofAccel.h"
#include "time.h"

#define TEST_TIMES 500

void blockSAD(pix_t blockIn1[BLOCK_SIZE][BLOCK_SIZE], pix_t blockIn2[BLOCK_SIZE][BLOCK_SIZE], uint16_t *sumRet)
{
	uint16_t tmpSum = 0;
	for(uint8_t i = 0; i < BLOCK_SIZE; i++)
	{
		for(uint8_t j = 0; j < BLOCK_SIZE; j++)
		{
			tmpSum += abs(blockIn1[i][j] - blockIn2[i][j]);
		}
	}
	*sumRet = tmpSum;
}

void miniBlockSADSW(pix_t refBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniRet, ap_uint<6> *OFRet)
{
	uint16_t tmpSum = 0x7fff;
	ap_uint<3> tmpOF_x = ap_uint<3>(7);
	ap_uint<3> tmpOF_y = ap_uint<3>(7);

	for(uint8_t xOffset = 0; xOffset < 2 * SEARCH_DISTANCE + 1; xOffset++)
	{
		for(uint8_t yOffset = 0; yOffset < 2 * SEARCH_DISTANCE + 1; yOffset++)
		{
			pix_t refBlockIn[BLOCK_SIZE][BLOCK_SIZE], tagBlockIn[BLOCK_SIZE][BLOCK_SIZE];
			uint16_t tmpBlockSum;
			for(uint8_t i = 0; i < BLOCK_SIZE; i++)
			{
				for(uint8_t j = 0; j < BLOCK_SIZE; j++)
				{
					refBlockIn[i][j] = refBlock[i + SEARCH_DISTANCE][j + SEARCH_DISTANCE];
					tagBlockIn[i][j] = tagBlock[i + xOffset][j + yOffset];
				}
			}
			blockSAD(refBlockIn, tagBlockIn, &tmpBlockSum);

			if(tmpBlockSum < tmpSum)
			{
				tmpSum = tmpBlockSum;
				tmpOF_x = ap_uint<3>(xOffset);
				tmpOF_y = ap_uint<3>(yOffset);
			}
		}
	}
	*miniRet = tmpSum;
	*OFRet = tmpOF_y.concat(tmpOF_x);
}


int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

    int total_err_cnt = 0;
	int retval=0;

	pix_t blockInRef[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t blockInTag[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for(int k = 0; k < TEST_TIMES; k++)
	{
		cout << "Test " << k << ":" << endl;
		int err_cnt = 0;

		for(int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
			{
				blockInRef[i][j] = rand() % 16;
				blockInTag[i][j] = rand() % 16;
			}
		}

		ap_uint<3> OF_x = rand() % 7;
		ap_uint<3> OF_y = rand() % 7;
		ap_uint<6> OF_GT = OF_y.concat(OF_x);

		uint16_t mini_GT = rand() % 10;

		for(int i = 0; i < BLOCK_SIZE; i++)
		{
			for(int j = 0; j < BLOCK_SIZE; j++)
			{
				blockInTag[i + OF_x][j + OF_y] = blockInRef[i + SEARCH_DISTANCE][j + SEARCH_DISTANCE];
			}
		}


		blockInRef[SEARCH_DISTANCE][SEARCH_DISTANCE] = rand() % 16;
		mini_GT = abs(blockInTag[OF_x][OF_y] - blockInRef[SEARCH_DISTANCE][SEARCH_DISTANCE]);

		ap_int<16> miniResultSW, miniResultHW;
		ap_uint<6> OFResultSW, OFResultHW;

		miniBlockSADSW(blockInRef, blockInTag, &miniResultSW, &OFResultSW);
		miniBlockSADHW(blockInRef, blockInTag, &miniResultHW, &OFResultHW);

		cout << "OF_GT is: " << hex << OF_GT << "\t OFResultSW is: " << OFResultSW << "\t OFResultHW is: " << OFResultHW << endl;
		cout << "mini_GT is: " << dec << mini_GT << "\t miniResultSW is: " << miniResultSW << "\t miniResultHW is: " << miniResultHW << endl;

		if(OFResultSW != OF_GT || miniResultSW != mini_GT || miniResultHW != mini_GT || OFResultHW != OF_GT)
		{
			err_cnt++;

			cout << "OFResultSW is: " << hex << OFResultSW << "\t miniResultSW is: " << dec << miniResultSW << endl;
			cout << "OFResultHW is: " << hex << OFResultHW << "\t miniResultHW is: " << dec << miniResultHW << endl;
			cout << "Test " << k << " failed." << endl;
		}

		if(err_cnt == 0)
		{
			cout << "Test " << k << " passed." << endl;
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

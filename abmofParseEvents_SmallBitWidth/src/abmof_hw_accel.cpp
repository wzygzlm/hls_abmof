#include "abmof_hw_accel.h"
#include "ap_int.h"

typedef ap_int<BITS_PER_PIXEL> pix_t;
typedef ap_uint<2> sliceIdx_t;

typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;

static col_pix_t glPLSlice0[DVS_WIDTH * DVS_HEIGHT/COMBINED_PIXELS], glPLSlice1[DVS_WIDTH * DVS_HEIGHT/COMBINED_PIXELS], glPLSlice2[DVS_WIDTH * DVS_HEIGHT/COMBINED_PIXELS];
// static col_pix_t glPLSlices[SLICES_NUMBER][DVS_WIDTH * BITS_PER_PIXEL * 20];

static sliceIdx_t glPLActiveSliceIdx, glPLTminus1SliceIdx, glPLTminus2SliceIdx;
static uint16_t glCnt;

int partFactor=6;

void accumulateHW(int16_t x, int16_t y, bool pol, int64_t ts)
{
	col_pix_t tmpData;
	ap_int<4> tmpTmpData;

	ap_int<7> yNewIdx = y/BITS_PER_PIXEL;
	ap_int<10> xNewIdx = x * BITS_PER_PIXEL + y - BITS_PER_PIXEL * yNewIdx;

	if (pol == true)
	{
//		switch(glPLActiveSliceIdx)
//		{
//		case 0:
//			tmpData = glPLSlice0[x];
//			break;
//		case 1:
//			tmpData = glPLSlice1[x];
//			break;
//		case 2:
//			tmpData = glPLSlice2[x];
//			break;
//		default:
//			break;
//		}
		if(glPLActiveSliceIdx == 0)
		{
			// Use bit selection plus for-loop to read multi-bits from a wider bit width value
			// rather than use range selection directly. The reason is that the latter will use
			// a lot of shift-register which will reduce a lot of LUTs consuming.
			tmpData = glPLSlice0[xNewIdx];

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpTmpData[yIndex] = tmpData[4*yNewIdx + yIndex];
			}
			tmpTmpData +=  1;

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpData[4*yNewIdx + yIndex] = tmpTmpData[yIndex];
			}

			glPLSlice0[xNewIdx] = tmpData;
		}
		else if(glPLActiveSliceIdx == 1)
		{
			// Use bit selection plus for-loop to read multi-bits from a wider bit width value
			// rather than use range selection directly. The reason is that the latter will use
			// a lot of shift-register which will reduce a lot of LUTs consuming.
			tmpData = glPLSlice1[xNewIdx];

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpTmpData[yIndex] = tmpData[4*yNewIdx + yIndex];
			}
			tmpTmpData +=  1;

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpData[4*yNewIdx + yIndex] = tmpTmpData[yIndex];
			}

			glPLSlice1[xNewIdx] = tmpData;
		}
		else if(glPLActiveSliceIdx == 2)
		{
			// Use bit selection plus for-loop to read multi-bits from a wider bit width value
			// rather than use range selection directly. The reason is that the latter will use
			// a lot of shift-register which will reduce a lot of LUTs consuming.
			tmpData = glPLSlice2[xNewIdx];

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpTmpData[yIndex] = tmpData[4*yNewIdx + yIndex];
			}
			tmpTmpData +=  1;

			for(int8_t yIndex = 0; yIndex < 4; yIndex++)
			{
				tmpData[4*yNewIdx + yIndex] = tmpTmpData[yIndex];
			}

			glPLSlice2[xNewIdx] = tmpData;
		}
	}
}

// #pragma SDS data zero_copy(eventSlice[0:DVS_WIDTH * DVS_HEIGHT])
//void copyToPS(int8_t *eventSlice)
//{
//	copyToPSLoop: for(int16_t i = 0; i < DVS_HEIGHT; i++)
//	{
//		copyToPS_label2:for(int16_t j = 0; j < DVS_WIDTH; j++)
//		{
//#pragma HLS PIPELINE
//			eventSlice[i * DVS_WIDTH + j] = glPLSlices[glPLCurrentSliceIdx][i][j];
//		}
//	}
//}

//void resetCurrentSliceHW()
//{
//	// clear current slice
////	resetSliceLoop: for(int16_t i = 0; i < DVS_HEIGHT; i=i+180)
////	{
////#pragma HLS PIPELINE
//		resetSliceLoop2:for(int16_t j = 0; j < DVS_WIDTH * BITS_PER_PIXEL *20; j++)
//		{
//			glPLSlices[glPLActiveSliceIdx][j][0] = 0;
//		}
//}


//int32_t calcOF(ap_int<4> refBlock[BLOCK_SIZE][BLOCK_SIZE], ap_int<4> targetBlocks[BLOCK_SIZE][BLOCK_SIZE])
//{
//	int32_t sum;
//
//	calOFLoop:for(int8_t m = 0; m < BLOCK_SIZE; m++)
//	{
//		calOFInnerLoop:for(int8_t n = 0; n < BLOCK_SIZE; n++)
//		{
//			int16_t tmpSum = refBlock[m][n] - targetBlocks[m][n];
//			if ( tmpSum < 0)
//			{
//				sum = sum - tmpSum;
//			}
//			else
//			{
//				sum = sum + tmpSum;
//			}
//		}
//	}
//}


int16_t sum;

ap_int<4> refBlock[BLOCK_SIZE][BLOCK_SIZE];
ap_int<4> targetBlocks[BLOCK_SIZE][BLOCK_SIZE];

void calcOF(int16_t x, int16_t y)
{
	readRefBlockLoop1: for(int8_t k = 0; k < BLOCK_SIZE; k++)
	{
		col_pix_t tmp1, tmp2;

		ap_int<7> yNewIdx = y/BITS_PER_PIXEL;
		ap_int<10> xNewIdx = x * BITS_PER_PIXEL + y - BITS_PER_PIXEL * yNewIdx;

		if(glPLActiveSliceIdx == 0)
		{
			tmp1 = glPLSlice2[xNewIdx + k];
			tmp2 = glPLSlice1[xNewIdx + k];

			for(int8_t l = 0; l < BLOCK_SIZE; l++)
			{
				ap_int<4> tmpTmp1, tmpTmp2;   //Store the mult-bit data of every pixel in the block.
				for(int8_t yIndex = 0; yIndex < 4; yIndex++)
				{
					tmpTmp1[yIndex] = tmp1[4*yNewIdx + yIndex];
					tmpTmp2[yIndex] = tmp2[4*yNewIdx + yIndex];
				}
				refBlock[k][l] = tmpTmp1;
				targetBlocks[k][l] = tmpTmp2;
			}
		}
		else if(glPLActiveSliceIdx == 1)
		{
			tmp1 = glPLSlice0[xNewIdx + k];
			tmp2 = glPLSlice2[xNewIdx + k];

			readBlockInnerLoop2: for(int8_t l = 0; l < BLOCK_SIZE; l++)
			{
				ap_int<4> tmpTmp1, tmpTmp2;   //Store the mult-bit data of every pixel in the block.
				for(int8_t yIndex = 0; yIndex < 4; yIndex++)
				{
					tmpTmp1[yIndex] = tmp1[4*yNewIdx + yIndex];
					tmpTmp2[yIndex] = tmp2[4*yNewIdx + yIndex];
				}
				refBlock[k][l] = tmpTmp1;
				targetBlocks[k][l] = tmpTmp2;
			}
		}
		else if(glPLActiveSliceIdx == 2)
		{
			tmp1 = glPLSlice1[xNewIdx + k];
			tmp2 = glPLSlice0[xNewIdx + k];

			for(int8_t l = 0; l < BLOCK_SIZE; l++)
			{
				ap_int<4> tmpTmp1, tmpTmp2;   //Store the mult-bit data of every pixel in the block.
				for(int8_t yIndex = 0; yIndex < 4; yIndex++)
				{
					tmpTmp1[yIndex] = tmp1[4*yNewIdx + yIndex];
					tmpTmp2[yIndex] = tmp2[4*yNewIdx + yIndex];
				}
				refBlock[k][l] = tmpTmp1;
				targetBlocks[k][l] = tmpTmp2;
			}
		}


	}
//
//
//	calOFLoop1:for(int8_t m = 0; m < BLOCK_SIZE; m++)
//	{
//		calOFInnerLoop1:for(int8_t n = 0; n < BLOCK_SIZE; n++)
//		{
//			ap_int<5> tmpSum = refBlock[m][n] - targetBlocks[m][n];
//			if ( tmpSum < 0)
//			{
//				sum = sum - tmpSum;
//			}
//			else
//			{
//				sum = sum + tmpSum;
//			}
//		}
//	}
}


#pragma SDS data access_pattern(data:SEQUENTIAL, eventSlice:SEQUENTIAL)
// #pragma SDS data data_mover(data:AXIFIFO:1, eventSlice:AXIFIFO:2)
// #pragma SDS data buffer_depth(data:512, eventSlice:1)
#pragma SDS data data_mover(data:AXIDMA_SIMPLE:1, eventSlice:AXIDMA_SIMPLE:2)
#pragma SDS data copy(data[0:eventsArraySize], eventSlice[0:eventsArraySize])
#pragma SDS data mem_attribute(data:PHYSICAL_CONTIGUOUS, eventSlice:PHYSICAL_CONTIGUOUS)
// #pragma SDS data zero_copy(eventSlice[0:DVS_WIDTH * DVS_HEIGHT])
void parseEvents(const uint64_t * data, int32_t eventsArraySize, int32_t *eventSlice)
{
	// Rotate the slices
	if(glPLActiveSliceIdx == 0)
	{
		glPLActiveSliceIdx = 1;

		glPLTminus1SliceIdx = 0;
		glPLTminus2SliceIdx = 2;
	}
	else if(glPLActiveSliceIdx == 1)
	{
		glPLActiveSliceIdx = 2;

		glPLTminus1SliceIdx = 1;
		glPLTminus2SliceIdx = 0;
	}
	else if(glPLActiveSliceIdx == 2)
	{
		glPLActiveSliceIdx = 0;

		glPLTminus1SliceIdx = 2;
		glPLTminus2SliceIdx = 1;
	}

// #pragma HLS ARRAY_PARTITION variable=glPLSlice0 complete dim=2
// #pragma HLS ARRAY_PARTITION variable=glPLSlice1 complete dim=2
// #pragma HLS ARRAY_PARTITION variable=glPLSlice2 complete dim=2
// #pragma HLS LATENCY min=1
//	resetCurrentSliceHW();

	uint16_t localCnt;

	// Experiment shows that this statement have on effect in the final result.
	// Only in the loop eventSlice started to output data.
	// It might be that HLS optimized it. Like in verilog, if there're two assignments
	// for a same variable, the first one will be ignored and only keep the last one.
	// Not sure if that's the reason.
	*eventSlice = localCnt + (glCnt << 16);     // The first byte to store the glCnt to check if they are always the same.

	// Every event always consists of 2 int32_t which is 8bytes.
	loop_1:for(int32_t i = 0; i < eventsArraySize; i = i + 1)
	{
// #pragma HLS PIPELINE
		#pragma HLS loop_tripcount min=0 max=10000
		uint64_t tmp = data[i];
		int16_t x = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		int16_t y = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		Cond_Region:
		{
			if (ts > 10000)
				{
//					resetCurrentSliceHW();
				}
		}

		// ts is unsued, should remove it.
		accumulateHW(x, y, pol, ts);


// #pragma HLS ARRAY_PARTITION variable=refBlock complete dim=0
// #pragma HLS ARRAY_PARTITION variable=targetBlocks complete dim=0



		// Do not share the temp1 and temp2 for these three cases.
		// Otherwise selector will be synthesed and it will consume
		// a lot of LUTs because temp1 and temp2's bit width is very big.
//		if(glPLActiveSliceIdx == 0)
//		{

//		calcOF(x, y);


//
//			// sum = calcOF(refBlock, targetBlocks);
//		}
//
//		else if(glPLActiveSliceIdx == 1)
//		{
//			ap_int<4> refBlock[BLOCK_SIZE][BLOCK_SIZE];
//			ap_int<4> targetBlocks[BLOCK_SIZE][BLOCK_SIZE];
//
//			readRefBlockLoop2: for(int8_t k = 0; k < BLOCK_SIZE; k++)
//			{
//
//				col_pix_t tmp1, tmp2;
//
//				tmp1 = glPLSlice0[x + k];
//				tmp2 = glPLSlice2[x + k];
//
//				readBlockInnerLoop2: for(int8_t l = 0; l < BLOCK_SIZE; l++)
//				{
//					ap_int<4> tmpTmp1, tmpTmp2;   //Store the mult-bit data of every pixel in the block.
//					for(int8_t yIndex = 0; yIndex < 4; yIndex++)
//					{
//						tmpTmp1[yIndex] = tmp1[4*y + yIndex];
//						tmpTmp2[yIndex] = tmp2[4*y + yIndex];
//					}
//					refBlock[k][l] = tmpTmp1;
//					targetBlocks[k][l] = tmpTmp2;
//				}
//			}
//
//			calOFLoop2:for(int8_t m = 0; m < BLOCK_SIZE; m++)
//			{
//				calOFInnerLoop2:for(int8_t n = 0; n < BLOCK_SIZE; n++)
//				{
//					ap_int<5> tmpSum = refBlock[m][n] - targetBlocks[m][n];
//					if ( tmpSum < 0)
//					{
//						sum = sum - tmpSum;
//					}
//					else
//					{
//						sum = sum + tmpSum;
//					}
//				}
//			}
//
//			//sum = calcOF(refBlock, targetBlocks);
//		}
//
//		else if(glPLActiveSliceIdx == 2)
//		{
//			ap_int<4> refBlock[BLOCK_SIZE][BLOCK_SIZE];
//			ap_int<4> targetBlocks[BLOCK_SIZE][BLOCK_SIZE];
//
//			readRefBlockLoop3: for(int8_t k = 0; k < BLOCK_SIZE; k++)
//			{
//
//				col_pix_t tmp1, tmp2;
//
//				tmp1 = glPLSlice1[x + k];
//				tmp2 = glPLSlice0[x + k];
//
//				readBlockInnerLoop3: for(int8_t l = 0; l < BLOCK_SIZE; l++)
//				{
//					ap_int<4> tmpTmp1, tmpTmp2;   //Store the mult-bit data of every pixel in the block.
//					for(int8_t yIndex = 0; yIndex < 4; yIndex++)
//					{
//						tmpTmp1[yIndex] = tmp1[4*y + yIndex];
//						tmpTmp2[yIndex] = tmp2[4*y + yIndex];
//					}
//					refBlock[k][l] = tmpTmp1;
//					targetBlocks[k][l] = tmpTmp2;
//				}
//			}
//
//			calOFLoop3:for(int8_t m = 0; m < BLOCK_SIZE; m++)
//			{
//				calOFInnerLoop3:for(int8_t n = 0; n < BLOCK_SIZE; n++)
//				{
//					ap_int<5> tmpSum = refBlock[m][n] - targetBlocks[m][n];
//					if ( tmpSum < 0)
//					{
//						sum = sum - tmpSum;
//					}
//					else
//					{
//						sum = sum + tmpSum;
//					}
//				}
//			}
//			// sum =  calcOF(refBlock, targetBlocks);
//		}


		if (i == 0)
		{
			// Output the current slice index and the sum result.
			*eventSlice = glPLSlice0[x+1] + glPLSlice1[x+1] + glPLSlice2[x+1] + localCnt + refBlock[i][i] + targetBlocks[i][i];
			// *eventSlice = localCnt + (glCnt << 16);

		}
		else
		{
			// Reorder the data to make it easier to be parsed.
			*eventSlice =  glPLSlice0[x+1] + glPLSlice1[x+1] + glPLSlice2[x+1] + (y << 8) + refBlock[i][i] + targetBlocks[i][i];
			// *eventSlice = x + (y << 8) + (pol << 16) + (sum << 17);
			// *eventSlice = glPLSlices[glPLActiveSliceIdx][x];
		}

		// For FIFO interface, this one could be commented.
		// We put it here only to make the program more readable.
		eventSlice++;

		localCnt++;
		glCnt++;
	}
	// copyToPS(eventSlice);
}

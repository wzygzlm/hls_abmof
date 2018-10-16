#include "ambofAccel.h"
#include "hls_video.h"

typedef hls::stream<ap_axiu<32,1,1,1> > AXI_STREAM;
typedef hls::Scalar<3, unsigned char> RGB_PIXEL;
typedef hls::Mat<20, 20, HLS_8UC1> RGB_IMAGE;

void image_filter_exp(AXI_STREAM& INPUT_STREAM0, AXI_STREAM& INPUT_STREAM1, AXI_STREAM& OUTPUT_STREAM, int rows, int cols)
{
	#pragma HLS INTERFACE axis port=INPUT_STREAM0
	#pragma HLS INTERFACE axis port=INPUT_STREAM1
	#pragma HLS INTERFACE axis port=OUTPUT_STREAM
	#pragma HLS dataflow
	//Create AXI streaming interfaces for the core
	RGB_IMAGE img_0(rows, cols);
	RGB_IMAGE img_1(rows, cols);
	RGB_IMAGE img_2(rows, cols);
	RGB_IMAGE img_3(rows, cols);
	RGB_IMAGE img_4(rows, cols);
	RGB_IMAGE img_5(rows, cols);
	RGB_PIXEL pix(50, 50, 50);

	// Convert AXI4 Stream data to hls::mat format
	hls::AXIvideo2Mat(INPUT_STREAM0, img_0);
	hls::AXIvideo2Mat(INPUT_STREAM1, img_1);
	// Execute the video pipelines
	hls::AbsDiff(img_0, img_1, img_2);
	// Convert the hls::mat format to AXI4 Stream format

	hls::Mat2AXIvideo(img_2, OUTPUT_STREAM);
}


void sadSum(ap_int<BITS_PER_PIXEL+1> sum[BLOCK_SIZE], int16_t *sadRet)
{
	ap_int<16> tmp = 0;
	calOFLoop2:for(ap_uint<4> i = 0; i < BLOCK_SIZE; i++)
	{
		if(sum[i] < 0) sum[i] = -sum[i];
//		sum[i] = sum[i] < 0 ? ap_int<BITS_PER_PIXEL+1>(-sum[i]) : sum[i];
		tmp = tmp + sum[i];
	}

	*sadRet = tmp.to_short();
}

void sad(pix_t refBlock[BLOCK_SIZE], pix_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
	int16_t retVal = 0;
	ap_int<pix_t::width+1> sum[BLOCK_SIZE];
//	*sadRet = 0;

	DFRegion:
	{
//		calOFLoop1:for(int16_t m = 0; m < BLOCK_SIZE; m++)
//		{
//			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
//			sum[m] = tmpSum;
//		}

		calOFDSPLoop: for(uint8_t m = 0; m < 5; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
			sum[m] = tmpSum;
		}

		calOFNoDSPLoop: for(uint8_t m = 5; m < BLOCK_SIZE; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
			sum[m] = tmpSum;
		}

		sadSum(sum, sadRet);
//		std::cout<<"sadRet is " << *sadRet << std::endl;
	}

}

void colSADSum(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1])
{
//	std::cout << "HW in1 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t1Col[m] << " ";
//	}
//	std::cout << std::endl;
//
//	std::cout << "HW in2 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t2Col[m] << " ";
//	}
//	std::cout << std::endl;

	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j + SEARCH_DISTANCE];   // Get the col data centered on current event.
			input2[j] = t2Col[i+j];
		}
		sad(input1, input2, &retVal[i]);
	}

}

// Function Description: return the minimum value of an array.
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1], int8_t *index)
{
	ap_int<16> tmp = inArr[0];
	int8_t tmpIdx = 0;
	minLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE + 1; i++)
	{
		// Here is a bug. Use the if-else statement,
		// cannot use the question mark statement.
		// Otherwise a lot of muxs will be generated,
		// DON'T KNOW WHY. SHOULD BE A BUG.
		if(inArr[i] < tmp) tmpIdx = i;
		if(inArr[i] < tmp) tmp = inArr[i];
//		tmp = (inArr[i] < tmp) ? inArr[i] : tmp;
	}
	*index = tmpIdx;
	return tmp;
}

void colsToStream(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut)
{
	apIntBlockCol_t refBlockCol;
	apIntBlockCol_t tagBlockCol;

	for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
	{
		refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = t1Col[l];
		tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = t2Col[l];
	}

	refStreamOut << refBlockCol;
	tagStreamOut << tagBlockCol;
}


void streamMiniBlockSAD(apIntBlockCol_t *refBlockCol, apIntBlockCol_t *tagBlockCol,
						hls::stream<apUint1_t> lastFlgStream,  hls::stream<int16_t> &sadRet)
{
	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	apIntBlockCol_t refData, tagData;
	refData = *refBlockCol++;
	tagData = *tagBlockCol++;

	// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
	// to calculate the range function. However, unroll it completely will make all this operations
	// are only wires connection and will not consume any resources.
	for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
	{
		in1[l] = refData.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
		in2[l] = tagData.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
	}

	int16_t ret;
	sad(in1, in2, &ret);

	sadRet.write(ret);
}



void blockSADHW(pix_t blockIn1[BLOCK_SIZE][BLOCK_SIZE], pix_t blockIn2[BLOCK_SIZE][BLOCK_SIZE], uint16_t *sumRet)
{
	uint16_t tmpSum = 0;
	blockSADHWLoop:for(uint8_t i = 0; i < BLOCK_SIZE; i++)
	{
//		blockSADHWInnerLoop:for(uint8_t j = 0; j < BLOCK_SIZE; j++)
//		{
//			tmpSum += hls::abs(blockIn1[i][j] - blockIn2[i][j]);
//		}

		pix_t in1[BLOCK_SIZE], in2[BLOCK_SIZE];
		for(uint8_t j = 0; j < BLOCK_SIZE; j++)
		{
			in1[j] = blockIn1[i][j];
			in2[j] = blockIn2[i][j];
		}
		int16_t ret;
		sad(in1, in2, &ret);
		tmpSum += ret;
	}
	*sumRet = tmpSum;
}


void blockWindowSADHW(pix_t blockIn1[BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1][BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1],
		pix_t blockIn2[BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1][BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1], uint16_t *sumRet)
{
	hls::Window<BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1, BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1, pix_t> refWin;
	hls::Window<BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1, BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1, pix_t> tagWin;

	blockWindowSADHW_label6:for(int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; i++)
	{
		blockWindowSADHW_label7:for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; j++)
		{
			refWin.val[i][j] = blockIn1[i][j];
			tagWin.val[i][j] = blockIn2[i][j];
		}
	}

	pix_t refBlock[BLOCK_SIZE][BLOCK_SIZE], tagBlock[BLOCK_SIZE][BLOCK_SIZE];

	blockWindowSADHW_label5:for (int xOffset = 0; xOffset < 2* SEARCH_DISTANCE + 1; xOffset++)
	{
		tagWin.shift_pixels_left();
		for(int i = 0; i < BLOCK_SIZE; i++)
		{
			for(int j = 0; j < BLOCK_SIZE; j++)
			{
				refBlock[i][j] = refWin.val[i][j];
				tagBlock[i][j] = tagWin.val[i][j];
			}
		}

		blockSADHW(refBlock, tagBlock, sumRet);
	}

}

void testTop(pix_t refBlock[BLOCK_SIZE][BLOCK_SIZE],
		pix_t tagBlock[BLOCK_SIZE][BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1],
		int16_t *sadRet)
{
	uint16_t tmpSum = 0x7fff;
	ap_uint<3> tmpOF_x = ap_uint<3>(7);
	ap_uint<3> tmpOF_y = ap_uint<3>(7);

	hls::LineBuffer<BLOCK_SIZE, BLOCK_SIZE, pix_t> refBuf;
	hls::LineBuffer<BLOCK_SIZE, BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1, pix_t> tagBuf;

	for(uint8_t xOffset = 0; xOffset < 2 * SEARCH_DISTANCE + 1; xOffset++)
	{
		for(uint8_t yOffset = 0; yOffset < 2 * SEARCH_DISTANCE + 1; yOffset++)
		{
			pix_t tagBlockIn[BLOCK_SIZE][BLOCK_SIZE];
			uint16_t tmpBlockSum;

			pix_t *refCol, *tagCol;

			refBuf.get_col(refCol, xOffset);
			tagBuf.get_col(tagCol, xOffset);

			sad(refCol, tagCol, sadRet);
		}
	}
}

void sadStream(hls::stream<apIntColBits_t> &colStream0, hls::stream<apIntColBits_t> &colStream1, hls::stream<uint16_t> &sadRetStream)
{
	sadStreamLoop2:for(uint8_t i = 0; i < BLOCK_SIZE; i++)
	{
		uint16_t tmpSum = 0;

//		for(int k = 0; k < SAD_PARALLEL_UNITS; k++)
//		{
			pix_t in0[BLOCK_SIZE], in1[BLOCK_SIZE];
			apIntColBits_t inData0, inData1;

			inData0 = colStream0.read();
			inData1 = colStream1.read();

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			sadStreamUnrollLoop:for (int8_t l = 0; l < BLOCK_SIZE; l++)
			{
				in0[l] = inData0.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in1[l] = inData1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			int16_t ret;
			sad(in0, in1, &ret);
			sadRetStream.write(tmpSum);
//		}
	}
}

// Function description:  Convert two blocks to col streams
void blockToColStreams(pix_t refBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1)
{
	apIntBlockCol_t refColData, tagColData;

	blockToColStreams_label1:for(int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		if(i >= SEARCH_DISTANCE && i < BLOCK_SIZE + SEARCH_DISTANCE)
		{
			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for(int l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				refColData.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = refBlock[i][l];
			}
			colStream0.write(refColData);
		}

		// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
		// to calculate the range function. However, unroll it completely will make all this operations
		// are only wires connection and will not consume any resources.
		for(int l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
		{
			tagColData.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = tagBlock[i][l];
		}
		colStream1.write(tagColData);
	}
}

// Function description: re-order the stream to make it adapt to following process element.
void reOrderColStreams(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<apIntBlockCol_t> &refStream, hls::stream<apIntBlockCol_t> &tagStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	reOrderColStreams_label4:for(int k= 0; k < BLOCK_SIZE + 2 * SEARCH_DISTANCE; k++)
	{
		if(k < BLOCK_SIZE)	colData0[k] = colStream0.read();
		colData1[k] = colStream1.read();
	}

	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		reOrderColStreams_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
			refStream.write(colData0[k]);
			tagStream.write(colData1[k + i]);
		}
	}
}

void sadParaUnits(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
				  int8_t offset, int16_t retVal[BLOCK_SIZE])
{
	for(int k= 0; k < BLOCK_SIZE; k++)
	{
		pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];

		for(ap_uint<4> m = 0; m < BLOCK_SIZE; m++)
		{
			input1[m] = t1Col[m + SEARCH_DISTANCE];   // Get the col data centered on current event.
			input2[m] = t2Col[m + offset];
		}
		sad(input1, input2, &retVal[k]);
	}
}

pix_t readPixFromBigColData(apIntBlockCol_t bigColData, ap_uint<8> idx)
{
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		retData[yIndex] = bigColData[colIdx];
//		retData[yIndex] = bigColData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

void readSmallColDataFromBigColData(apIntBlockCol_t bigData, ap_uint<8> idx, apIntColBits_t *smallData)
{
	for (int i = 0; i < BLOCK_SIZE; i++)
	{
		uint16_t idxOffset = idx + i;
		smallData->range(BITS_PER_PIXEL * i + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * i) = readPixFromBigColData(bigData, idxOffset);
	}
}


void colStreamToColSum(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<apUint112_t> outStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for(int k= 0; k < BLOCK_SIZE + 2 * SEARCH_DISTANCE; k++)
	{
		if(k < BLOCK_SIZE)	colData0[k] = colStream0.read();
		colData1[k] = colStream1.read();
	}

	colStreamToColSum_label1:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		colStreamToColSum_label2:for(int k= 0; k < BLOCK_SIZE; k++)
		{
			pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			int16_t out[2*SEARCH_DISTANCE + 1];

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = colData0[k].range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = colData1[k + i].range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			colSADSum(in1, in2, out);

			apUint112_t outputData;

			for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
			{
				outputData.range(16 * l + 15, 16 * l) = out[i];
			}

			outStream.write(outputData);
		}
	}
}

static ap_int<16> lastSumData[2 * SEARCH_DISTANCE + 1];
static apUint112_t lastSum;
void accumulateStream(hls::stream<apUint112_t> &inStream, hls::stream<int16_t> &outStream)
{
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		accumulateStream_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
			apUint112_t inData = inStream.read();

			uint16_t inputData[2 * SEARCH_DISTANCE + 1];

			if(k == BLOCK_SIZE - 1)
			{
				ap_int<16> tmpData[2 * SEARCH_DISTANCE + 1];
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] = lastSumData[l] + inputData[l];
				}

				ap_int<16> outputMinData;
				int8_t index;
				outputMinData = min(lastSumData, &index);
				outStream.write(outputMinData.to_short());

				// If use reshape directive, then here must use decrease form.
				// if use increase form, then the II is 2 cannot be 1.
				// And lastSumData couldn't be 0.
				// DON'T KNOW WHY. MIGHT BE A BUG.
				for (int l = 2 * SEARCH_DISTANCE; l >= 0; l--)
				{
					lastSumData[l] = 0;
				}
			}
			else
			{
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] += inputData[l];
				}
			}
		}
	}
}

static int16_t currentMin = 0x7fff;
void findStreamMin(hls::stream<int16_t> &inStream, hls::stream<int16_t> &minStream)
{
	findStreamMin_label4:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		int16_t inData = inStream.read();
		if(i == 2 * SEARCH_DISTANCE)
		{
			currentMin = (inData < currentMin) ? inData : currentMin;
			minStream.write(currentMin);
			currentMin = 0x7fff;
		}
		else
		{
			currentMin = (inData < currentMin) ? inData : currentMin;
		}
	}
}

void colStreamToMinStream(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<int16_t> &sumStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	reOrderColStreams2_label7:for(int k= 0; k < BLOCK_SIZE + 2 * SEARCH_DISTANCE; k++)
	{
		if(k < BLOCK_SIZE)	colData0[k] = colStream0.read();
		colData1[k] = colStream1.read();
	}

	reOrderColStreams2_label0:for (int i = 0; i < (2 * SEARCH_DISTANCE + 1) *  (2 * SEARCH_DISTANCE + 1); i++)
	{
		ap_int<16>  sumRet[2 * SEARCH_DISTANCE + 1];
		int16_t tmpRetVal[2];

		reOrderColStreams2_label9:for (int j = 0; j < 1; j++)
		{
			sumRet[j] = 0;

			reOrderColStreams2_label5:for(int k = 0; k < BLOCK_SIZE; k++)
			{
				pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
				apIntColBits_t input2SmallColData;

				readSmallColDataFromBigColData(colData1[k%BLOCK_SIZE + i % 7], i / 7, &input2SmallColData);

				// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
				// to calculate the range function. However, unroll it completely will make all this operations
				// are only wires connection and will not consume any resources.
				for (int8_t l = 0; l < BLOCK_SIZE; l++)
				{
					int8_t index = l + SEARCH_DISTANCE;
					input1[l] = colData0[k].range(BITS_PER_PIXEL * index + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * index);
					input2[l] = input2SmallColData.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				}

				sad(input1, input2, &tmpRetVal[1]);
				sumRet[j] += tmpRetVal[1];
			}
		}

		int8_t index;
		ap_int<16> miniSum = min(sumRet, &index);
		sumStream.write(miniSum.to_short());
	}
}


void miniBlockSADHW(pix_t refBlock[BLOCK_SIZE][BLOCK_SIZE],
		pix_t tagBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1][BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1],
		ap_int<16> *miniRet, ap_uint<6> *OFRet)
{
	uint16_t tmpSum = 0x7fff;
	ap_uint<3> tmpOF_x = ap_uint<3>(7);
	ap_uint<3> tmpOF_y = ap_uint<3>(7);

	for(uint8_t xOffset = 0; xOffset < 2 * SEARCH_DISTANCE + 1; xOffset++)
	{
		for(uint8_t yOffset = 0; yOffset < 2 * SEARCH_DISTANCE + 1; yOffset++)
		{
			pix_t tagBlockIn[BLOCK_SIZE][BLOCK_SIZE];
			uint16_t tmpBlockSum;
			for(uint8_t i = 0; i < BLOCK_SIZE; i++)
			{
				for(uint8_t j = 0; j < BLOCK_SIZE; j++)
				{
					tagBlockIn[i][j] = tagBlock[i + xOffset][j + yOffset];
				}
			}
			blockSADHW(refBlock, tagBlockIn, &tmpBlockSum);

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

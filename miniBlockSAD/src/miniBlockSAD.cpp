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

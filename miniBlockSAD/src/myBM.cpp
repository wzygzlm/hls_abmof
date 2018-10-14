#include "xf_stereoBM_config.h"
#include "ambofAccel.h"

#include "hls_video.h"

template<typename T,int ROWS,int COLS>
void xFShiftRight(T buf[ROWS][COLS])
{
#pragma HLS INLINE

	shift_right_loop2:
	for(unsigned char j = COLS-1; j >= 1; j--)
	{
#pragma HLS UNROLL
		shift_right_loop1:
		for(unsigned char i = 0; i < ROWS; i++)
		{
#pragma HLS UNROLL
			buf[i][j] = buf[i][j-1];
		}
	}
}

template<int ROWS,int COLS,typename T>
void xFInsertLeft(T buf[ROWS][COLS],T tmp[ROWS])
{
#pragma HLS INLINE
	insert_right_loop1:
	for(unsigned char i = 0; i < ROWS; i++)
	{
#pragma HLS UNROLL
		buf[i][0] = tmp[i];
	}
}

template<int WSIZE, int L_WIN_COLS, int R_WIN_COLS, typename T>
short int xFSADComputeInc(
		T l_win[WSIZE][L_WIN_COLS],
		T r_win_s[WSIZE][R_WIN_COLS],
		unsigned char d,
		unsigned short col,
		short int sad_cols_d[WSIZE])
{
#pragma HLS INLINE off
	short int a_sum = 0, b_sum = 0;
	// compute new column sads;
	for (unsigned char i = 0; i < WSIZE; i++) {
		b_sum += __ABS((unsigned char)l_win[i][0] - (unsigned char)r_win_s[i][d]);
	}
	// valid guard;
	if (col < d) b_sum = 0;
	// get previous sad_cols value;
	a_sum = sad_cols_d[WSIZE-1];
	// shift sad_cols[d];
	for (unsigned char j = WSIZE-1; j > 0; j--) {
		sad_cols_d[j] = sad_cols_d[j-1];
	}
	// fill in sad_cols with newly computed values;
	sad_cols_d[0] = b_sum;

	return (-a_sum+b_sum);
}


void sadAbs(unsigned char l_window[SAD_WINDOW_SIZE][SAD_WINDOW_SIZE], unsigned char r_window[SAD_WINDOW_SIZE][SAD_WINDOW_SIZE + PARALLEL_UNITS - 1],
		int sad[PARALLEL_UNITS])
{
//	xf::xFMinSAD<1>::find(inArr, *idxRet, *minRet);
//	int sad[PARALLEL_UNITS];
#pragma HLS array_partition variable=sad complete dim=0

	//create the left and right window buffers.
//	unsigned char l_window[SAD_WINDOW_SIZE][SAD_WINDOW_SIZE];
#pragma HLS ARRAY_PARTITION variable=l_window complete dim=2
#pragma HLS ARRAY_PARTITION variable=l_window complete dim=1
//	unsigned char r_window[SAD_WINDOW_SIZE][SAD_WINDOW_SIZE + PARALLEL_UNITS - 1];
#pragma HLS ARRAY_PARTITION variable=r_window complete dim=2
#pragma HLS ARRAY_PARTITION variable=r_window complete dim=1

	short int sad_cols[PARALLEL_UNITS][SAD_WINDOW_SIZE];
#pragma HLS array_partition variable=sad_cols complete dim=0

	unsigned char l_tmp[SAD_WINDOW_SIZE];
#pragma HLS array_partition variable=l_tmp complete dim=0
	unsigned char r_tmp[SAD_WINDOW_SIZE];
#pragma HLS array_partition variable=r_tmp complete dim=0
	xFShiftRight<unsigned char,SAD_WINDOW_SIZE,SAD_WINDOW_SIZE>(l_window);
	xFShiftRight<unsigned char,SAD_WINDOW_SIZE,SAD_WINDOW_SIZE + PARALLEL_UNITS - 1>(r_window);
	xFInsertLeft<SAD_WINDOW_SIZE,SAD_WINDOW_SIZE,unsigned char>(l_window,l_tmp);
	xFInsertLeft<SAD_WINDOW_SIZE,SAD_WINDOW_SIZE + PARALLEL_UNITS - 1,unsigned char>(r_window,r_tmp);

	loop_col:
	for (unsigned short col = 0; col < 10+SAD_WINDOW_SIZE-1; col++) {
//#pragma HLS LOOP_TRIPCOUNT min=0 max=COL_TC

#pragma HLS loop_flatten
#pragma HLS pipeline II=1
		loop_sad_compute:
		for (unsigned char d = 0; d < PARALLEL_UNITS; d++) {
			sad[d] += (int)xFSADComputeInc<SAD_WINDOW_SIZE, SAD_WINDOW_SIZE, SAD_WINDOW_SIZE + PARALLEL_UNITS - 1, unsigned char>(l_window, r_window, d, col, sad_cols[d]);
		}
	}
}

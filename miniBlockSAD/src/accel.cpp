#include "xf_stereoBM_config.h"

void stereolbm_accel(xf::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> &leftMat, xf::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> &rightMat, xf::Mat<XF_16UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> &dispMat, xf::xFSBMState<SAD_WINDOW_SIZE,NO_OF_DISPARITIES,PARALLEL_UNITS> &bm_state)
{
	xf::StereoBM<SAD_WINDOW_SIZE,NO_OF_DISPARITIES,PARALLEL_UNITS,XF_8UC1,XF_16UC1,XF_HEIGHT,XF_WIDTH,XF_NPPC1>(leftMat, rightMat, dispMat, bm_state);
}

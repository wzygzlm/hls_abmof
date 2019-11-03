#include "ap_utils.h"// Added include file
void test (
        int *z1,
        int a,
        int b,
        int *mode,
        volatile int *request,
        volatile int response[2],
        int *z2
        ) 
{
    int read1, read2;
    int opcode;
    int i;
P1: {
#pragma HLS PROTOCOL floating
        read1 = response[0];
        opcode = 5;
        ap_wait();// Added ap_wait statement
        *request = opcode;
        read2 = response[1];
        ap_wait();
    }
C1: {
        *z1 = a + b;
        *z2 = read1 + read2;
    }
}

################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./testbench/test.o 

CPP_DEPS += \
./testbench/test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/test.o: E:/xfOpenCV/hls_2018_1/EventStreamToFrameStream/src/test.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



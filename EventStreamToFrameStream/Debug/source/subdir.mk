################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/main.cpp \
../src/minizedVersion.cpp 

C_SRCS += \
../src/national_flag.c 

OBJS += \
./source/main.o \
./source/minizedVersion.o \
./source/national_flag.o 

CPP_DEPS += \
./source/main.d \
./source/minizedVersion.d 

C_DEPS += \
./source/national_flag.d 


# Each subdirectory must supply rules for building sources it contributes
source/main.o: E:/xfOpenCV/hls_2018_1/EventStreamToFrameStream/src/main.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/minizedVersion.o: E:/xfOpenCV/hls_2018_1/EventStreamToFrameStream/src/minizedVersion.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/national_flag.o: E:/xfOpenCV/hls_2018_1/EventStreamToFrameStream/src/national_flag.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/main_noAxi4lite.cpp \
../src/test.cpp 

OBJS += \
./src/main.o \
./src/main_noAxi4lite.o \
./src/minizedVersion.o \
./src/national_flag.o \
./src/test.o 

CPP_DEPS += \
./src/main.d \
./src/main_noAxi4lite.d \
./src/minizedVersion.d \
./src/test.d 

C_DEPS += \
./src/national_flag.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -DAESL_TB -D__llvm__ -D__llvm__ -IE:/xfOpenCV/hls_2018_1 -ID:/Xilinx/Vivado/2018.1/include -ID:/Xilinx/Vivado/2018.1/win64/tools/systemc/include -ID:/Xilinx/Vivado/2018.1/include/ap_sysc -ID:/Xilinx/Vivado/2018.1/include/etc -ID:/Xilinx/Vivado/2018.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



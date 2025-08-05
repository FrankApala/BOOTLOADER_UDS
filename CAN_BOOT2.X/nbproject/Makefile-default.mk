#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/boot/boot_image.c mcc_generated_files/boot/boot_verify_not_blank.c mcc_generated_files/boot/memory_partition.S mcc_generated_files/boot/com_adaptor_uart.c mcc_generated_files/boot/interrupts.S mcc_generated_files/boot/hardware_interrupt_table.S mcc_generated_files/boot/boot_demo.c mcc_generated_files/boot/boot_application_header.c mcc_generated_files/boot/boot_process.c mcc_generated_files/can/src/can1.c mcc_generated_files/flash/src/flash_asm.s mcc_generated_files/flash/src/flash.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/dmt.c mcc_generated_files/uart/src/uart1.c main.c iso14229/iso14229.c mcc_generated_files/timer/src/sccp2.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/boot/boot_image.o ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o ${OBJECTDIR}/mcc_generated_files/can/src/can1.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/iso14229/iso14229.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/boot/boot_image.o.d ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o.d ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.d ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o.d ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.d ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.d ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o.d ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o.d ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o.d ${OBJECTDIR}/mcc_generated_files/can/src/can1.o.d ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o.d ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/iso14229/iso14229.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/boot/boot_image.o ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o ${OBJECTDIR}/mcc_generated_files/can/src/can1.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/iso14229/iso14229.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o

# Source Files
SOURCEFILES=mcc_generated_files/boot/boot_image.c mcc_generated_files/boot/boot_verify_not_blank.c mcc_generated_files/boot/memory_partition.S mcc_generated_files/boot/com_adaptor_uart.c mcc_generated_files/boot/interrupts.S mcc_generated_files/boot/hardware_interrupt_table.S mcc_generated_files/boot/boot_demo.c mcc_generated_files/boot/boot_application_header.c mcc_generated_files/boot/boot_process.c mcc_generated_files/can/src/can1.c mcc_generated_files/flash/src/flash_asm.s mcc_generated_files/flash/src/flash.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/dmt.c mcc_generated_files/uart/src/uart1.c main.c iso14229/iso14229.c mcc_generated_files/timer/src/sccp2.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP508
MP_LINKER_FILE_OPTION=,--script=p33CK256MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/boot/boot_image.o: mcc_generated_files/boot/boot_image.c  .generated_files/flags/default/fac8248b1ef6caf5ffd9a8adef279b727c862064 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_image.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_image.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o: mcc_generated_files/boot/boot_verify_not_blank.c  .generated_files/flags/default/2a7f6eef097b28e3498e8c62ddb3b75789f96a20 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_verify_not_blank.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o: mcc_generated_files/boot/com_adaptor_uart.c  .generated_files/flags/default/e503e10f32fcbf11d227bb00a34253dca1734140 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/com_adaptor_uart.c  -o ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o: mcc_generated_files/boot/boot_demo.c  .generated_files/flags/default/fbd9462d8b9c5dc0e86cd1eba50487f470524ba8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_demo.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o: mcc_generated_files/boot/boot_application_header.c  .generated_files/flags/default/9809344df367a5056bd71c5ac18e4bd0c8878ad2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_application_header.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_process.o: mcc_generated_files/boot/boot_process.c  .generated_files/flags/default/ddf962a026dc87afb5ef125acb6204e5231226b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_process.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_process.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/can/src/can1.o: mcc_generated_files/can/src/can1.c  .generated_files/flags/default/514eb376ee6ec252354eb73d1490537f5bb18bda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/can/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/can/src/can1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/can/src/can1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/can/src/can1.c  -o ${OBJECTDIR}/mcc_generated_files/can/src/can1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/can/src/can1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/flash/src/flash.o: mcc_generated_files/flash/src/flash.c  .generated_files/flags/default/ddc993112171d86ace2c026fa6969e2f2225bb7b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/flash/src/flash.c  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/335217763574854eac6880ced394241791285520 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/cb08081b0f81ce5d8d3e3b2caa703c025e032082 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/bd7692995692333cf9340587bb15d309c5677e8a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/a90dbff556d0048ce85214b056f56fd73ac1565e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/597c7cd4f11d8c7f5eabc3b730cf7f7d317df9eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/806f2b9bab0187b5d5dca332e3e59e4d2c49f659 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/f9373198d9ce6f1a94e4cbb97b533bc039c72e2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/568b215567d95a9aa9f44384554fda023a39fa45 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/91a6a420462af2bd3a08df83fb54c6e0c79a01b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/ba2e5037c97206992c52081480377f5a37de4f31 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/iso14229/iso14229.o: iso14229/iso14229.c  .generated_files/flags/default/5779b1e2f890474dcc33c7c9cb4190aee3151b3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/iso14229" 
	@${RM} ${OBJECTDIR}/iso14229/iso14229.o.d 
	@${RM} ${OBJECTDIR}/iso14229/iso14229.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  iso14229/iso14229.c  -o ${OBJECTDIR}/iso14229/iso14229.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/iso14229/iso14229.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o: mcc_generated_files/timer/src/sccp2.c  .generated_files/flags/default/96cd4e79e118a67dc665de252db66c4e1cfb8a64 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp2.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/boot/boot_image.o: mcc_generated_files/boot/boot_image.c  .generated_files/flags/default/24e62f16afb1da9a906dc9e13bfeeffa66478ed4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_image.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_image.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_image.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o: mcc_generated_files/boot/boot_verify_not_blank.c  .generated_files/flags/default/a42cc17da93a90d1432a8de5204af179afbf03f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_verify_not_blank.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_verify_not_blank.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o: mcc_generated_files/boot/com_adaptor_uart.c  .generated_files/flags/default/7956b67b1dcea3519845538339e036288fd3c9fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/com_adaptor_uart.c  -o ${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/com_adaptor_uart.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o: mcc_generated_files/boot/boot_demo.c  .generated_files/flags/default/b3403bb4c2676a0f18283cbcfa74fb2f3f84e9b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_demo.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_demo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o: mcc_generated_files/boot/boot_application_header.c  .generated_files/flags/default/a5a1eaf5f4e0adfcf25a6cdb97c10042538ae6d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_application_header.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_application_header.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/boot_process.o: mcc_generated_files/boot/boot_process.c  .generated_files/flags/default/dd3df1a6497ed84d4f6a14af917038b86a11e606 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/boot/boot_process.c  -o ${OBJECTDIR}/mcc_generated_files/boot/boot_process.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/boot_process.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/can/src/can1.o: mcc_generated_files/can/src/can1.c  .generated_files/flags/default/7b580c03d13a7535c8e315b03f3728a6bde3788b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/can/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/can/src/can1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/can/src/can1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/can/src/can1.c  -o ${OBJECTDIR}/mcc_generated_files/can/src/can1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/can/src/can1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/flash/src/flash.o: mcc_generated_files/flash/src/flash.c  .generated_files/flags/default/60dc76086f50372f1ffcd3fe92a7bac4ff986bcb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/flash/src/flash.c  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/612ed3bed29b3f12a415d97dedcfc8d3502e4a98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/1dd846112cb53e601b5379a869b39661461521cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/11414c984fbfbfaee3f913f70934fb2cd1d78a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/a0140c706838a6408cb77d11058ce6bee840a2d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/e10be4e17e7d03aeaf2ccabd6f8bf42c6f79c9d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/dd1e7ccc06db962596a5dfa51abacaa5e627a35d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/14941200de1d506c21436669f622e1a3769869a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/2ac67aa318d5d7fa0272db6804d4795a96033658 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/d2f6904714ad1d6ec491d550bbf2ddf9ff50897a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/1c1ff9d598dde84917d4537bf741624a90f73c5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/iso14229/iso14229.o: iso14229/iso14229.c  .generated_files/flags/default/b939cea86236e96675cffe8c1c9b48a8d5d6cbd6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/iso14229" 
	@${RM} ${OBJECTDIR}/iso14229/iso14229.o.d 
	@${RM} ${OBJECTDIR}/iso14229/iso14229.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  iso14229/iso14229.c  -o ${OBJECTDIR}/iso14229/iso14229.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/iso14229/iso14229.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o: mcc_generated_files/timer/src/sccp2.c  .generated_files/flags/default/c2da47b4c9620a933813c9b68a6b10bb72f31371 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp2.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -O0 -msmart-io=1 -Wall -msfr-warn=off   -DUDS_TP_ISOTP_C -DUDS_SYS=UDS_SYS_CUSTOM -DUDS_LOG_LEVEL=UDS_LOG_WARN   -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o: mcc_generated_files/flash/src/flash_asm.s  .generated_files/flags/default/fac5c710dcaf381d349d50a42c1308a5cf91d846 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/flash/src/flash_asm.s  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/57b4c6c036e1dd03e9fc55851e7b1e8f77f233c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/84c9e03825a16765bb5f3107e6a46b8371707074 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o: mcc_generated_files/flash/src/flash_asm.s  .generated_files/flags/default/d7fd77e2c0c65e3670d5d40da810a4f93701321a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/flash/src/flash_asm.s  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/flash/src/flash_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/6644f6a72b324624731b1e73bb24ea0da13e3532 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/32343b9faef8cbd6a2b72ab38227c6bfaa3dd90a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o: mcc_generated_files/boot/memory_partition.S  .generated_files/flags/default/5e457bd0934b3fd3ab4afdac94b72ae6e92fadc2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/memory_partition.S  -o ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/interrupts.o: mcc_generated_files/boot/interrupts.S  .generated_files/flags/default/eeefa0d72864201c59a678e1a8752893bf32a4db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/interrupts.S  -o ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o: mcc_generated_files/boot/hardware_interrupt_table.S  .generated_files/flags/default/e879030f0349d7b8c14080bfad185f67ffc4fa52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/hardware_interrupt_table.S  -o ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o: mcc_generated_files/boot/memory_partition.S  .generated_files/flags/default/8934c4787203edbe4f6b655be8b8d61b6ee5ebea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/memory_partition.S  -o ${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/memory_partition.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/interrupts.o: mcc_generated_files/boot/interrupts.S  .generated_files/flags/default/dc43caa1a26972ddc5a96632c68a13fc6f946ff0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/interrupts.S  -o ${OBJECTDIR}/mcc_generated_files/boot/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/interrupts.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o: mcc_generated_files/boot/hardware_interrupt_table.S  .generated_files/flags/default/1f3b6c34eca9cbef4657204e6306cdc91b3dc380 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/boot" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/boot/hardware_interrupt_table.S  -o ${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"iso14229" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/boot/hardware_interrupt_table.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"iso14229" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/CAN_BOOT2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

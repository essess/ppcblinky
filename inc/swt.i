#
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# with the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
#
#   -Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimers.
#
#   -Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimers in the documentation
#    and/or other materials provided with the distribution.
#
#   -Neither Sean Stasiak, nor the names of other contributors may be used to
#    endorse or promote products derived from this Software without specific
#    prior written permission.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH
# THE SOFTWARE.
#
        .file       "swt.i"

# BASE: software watchdog timer -----------------------------------------------
SWT_BASE            .equ    $fff38000

# CR: control register --------------------------------------------------------
                                            ;  master access protection
MAP0_DIS            .equ    %0 << 0         ;< core instruction access disabled
MAP0_ENAB           .equ    %1 << 0         ;< enabled
MAP1_DIS            .equ    %0 << 1         ;< nexus access disabled
MAP1_ENAB           .equ    %1 << 1         ;< enabled
MAP2_DIS            .equ    %0 << 2         ;< dma access disabled
MAP2_ENAB           .equ    %1 << 2         ;< enabled

                                            ;  keyed service mode
KEY_FSS             .equ    %0 << 22        ;< fixed service sequence
KEY_KSM             .equ    %1 << 22        ;< keyed service mode

                                            ;  reset on invalid access
RIA_BERR            .equ    %0 << 23        ;< gen bus err
RIA_RST             .equ    %1 << 23        ;< gen system reset if WEN_ENAB

                                            ;  window mode
WND_REG             .equ    %0 << 24        ;< regular mode
WND_WM              .equ    %1 << 24        ;< windowed mode

                                            ;  interrupt then reset
ITR_RST             .equ    %0 << 25        ;< gen reset on first to
ITR_2ND             .equ    %1 << 25        ;< int first, reset second

                                            ;  hard lock
HLK_DIS             .equ    %0 << 26        ;< read/write
HLK_ENAB            .equ    %1 << 26        ;< write only

                                            ; soft lock
SLK_DIS             .equ    %0 << 27        ;< read/write
SLK_ENAB            .equ    %1 << 27        ;< write only

                                            ;  clock selection
CSL_SYS             .equ    %0 << 28        ;< system clock
CSL_OSC             .equ    %1 << 28        ;< oscillator clock

                                            ;  stop mode control
STP_RUN             .equ    %0 << 29        ;< run in stop mode
STP_STOP            .equ    %1 << 29        ;< stop in stop mode

                                            ;  debug mode control
FRZ_RUN             .equ    %0 << 30        ;< run in debug mode
FRZ_STOP            .equ    %1 << 30        ;< stop in debug mode

                                            ;  watchdog enabled
WEN_DIS             .equ    %0 << 31        ;< swt is disabled
WEN_ENAB            .equ    %1 << 31        ;< swt is enabled

SWT_CR_OFFSET       .equ    $0000
SWT_CR              .equ    SWT_BASE+SWT_CR_OFFSET

# IR: interrupt register ------------------------------------------------------
SWT_IR_OFFSET       .equ    $0004
SWT_IR              .equ    SWT_BASE+SWT_IR_OFFSET

# TO: timeout register --------------------------------------------------------
SWT_TO_OFFSET       .equ    $0008
SWT_TO              .equ    SWT_BASE+SWT_TO_OFFSET

# WN: window register ---------------------------------------------------------
SWT_WN_OFFSET       .equ    $000c
SWT_WN              .equ    SWT_BASE+SWT_WN_OFFSET

# SR: service register --------------------------------------------------------
SWT_SR_OFFSET       .equ    $0010
SWT_SR              .equ    SWT_BASE+SWT_SR_OFFSET

# CO: counter output register -------------------------------------------------
SWT_CO_OFFSET       .equ    $0014
SWT_CO              .equ    SWT_BASE+SWT_CO_OFFSET

# SK: service key register ----------------------------------------------------
SWT_SK_OFFSET       .equ    $0018
SWT_SK              .equ    SWT_BASE+SWT_SK_OFFSET

# -----------------------------------------------------------------------------
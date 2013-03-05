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
        .file       "blinky.s"
        .include    "inc\siu.i"
        .include    "inc\swt.i"

LED_OFF             .equ    PDO_VOH
LED_ON              .equ    PDO_VOL
LED0_GPDO           .equ    SIU_GPDO188_OFFSET

LED0_PCR            .equ    SIU_PCR188_OFFSET
LED0_PCR_VALUE      .equ    ( PA_GPIO | OBE_ENAB | DSC_50PF | ODE_ENAB | \
                              SRC_MAX | WPE_DIS )

# -----------------------------------------------------------------------------
#   @public
#   kill swt, kill booke wdt, and cycle led 0 continuously
# -----------------------------------------------------------------------------
        .section    .init, text
        .global     blinky
        .type       blinky, @function
blinky:
        lis         r1, (MAP0_ENAB|MAP1_ENAB|MAP2_ENAB)@h   ;< disable swt, but
        lis         r2, SWT_BASE@ha                         ;  still allow later
        stw         r1, SWT_CR@l(r2)                        ;  modification

        ; TODO ;< kill booke wdt

        li          r3, LED_ON                              ;< on first to avoid
        lis         r4, SIU_BASE@ha                         ;  glitch
        stb         r3, LED0_GPDO@l(r4)                     ;

        lis         r5, LED0_PCR_VALUE@h                    ;< set as output
        ori         r5, r5, LED0_PCR_VALUE@l                ;
        sth         r5, LED0_PCR@l(r4)                      ;

        ; TODO ;< invert, wait, loop

        b           .
# -----------------------------------------------------------------------------


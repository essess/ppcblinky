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
        .file       "siu.i"

# BASE: system integration unit -----------------------------------------------
SIU_BASE            .equ    $c3f90000

# PCR: pad configuration register ---------------------------------------------
                                            ;  pin assignment
PA_PRIM             .equ    %0001 << 2      ;< primary function
PA_ALT              .equ    %0010 << 2      ;< alternate function
PA_ALT2             .equ    %0100 << 2      ;< alternate function 2
PA_ALT3             .equ    %1000 << 2      ;< alternate function 3
PA_GPIO             .equ    %0000 << 2      ;< gpio

                                            ;  output buffer enable
OBE_DIS             .equ    %0    << 6      ;< disable output buffer for pad
OBE_ENAB            .equ    %1    << 6      ;< enable output buffer for pad

                                            ;  input buffer enable
IBE_DIS             .equ    %0    << 7      ;< disable input buffer for pad
IBE_ENAB            .equ    %1    << 7      ;< enable input buffer for pad

                                            ;  drive strength control
DSC_10PF            .equ    %00   << 8      ;< 10pf drive strength (weakest)
DSC_20PF            .equ    %01   << 8      ;< 20pf drive strength
DSC_30PF            .equ    %10   << 8      ;< 30pf drive strength
DSC_50PF            .equ    %11   << 8      ;< 50pf drive strength (strongest)

                                            ;  open drain output enable
ODE_DIS             .equ    %0    << 10     ;< disable (push/pull driver enabled)
ODE_ENAB            .equ    %1    << 10     ;< enable open drain for the pad

                                            ;  input hysteresis
HYS_DIS             .equ    %0    << 11     ;< disable hysteresis for the pad
HYS_ENAB            .equ    %1    << 11     ;< enable hysteresis for the pad

                                            ;  slew rate control
SRC_MIN             .equ    %00   << 12     ;< minimum slew rate
SRC_MED             .equ    %01   << 12     ;< medium slew rate
SRC_MAX             .equ    %11   << 12     ;< maximum slew rate

                                            ;  weak pullup/pulldown enable
WPE_DIS             .equ    %0    << 14     ;< disable weak pull device for pad
WPE_ENAB            .equ    %1    << 14     ;< enable weak pull device for pad

                                            ;  weak pullup/pulldown select
WPS_PDOWN           .equ    %0    << 15     ;< pulldown is enabled for the pad
WPS_PUP             .equ    %1    << 15     ;< pullup is enabled for the pad

SIU_PCR188_OFFSET   .equ    $01b8
SIU_PCR188          .equ    SIU_BASE+SIU_PCR188_OFFSET

SIU_PCR189_OFFSET   .equ    $01ba
SIU_PCR189          .equ    SIU_BASE+SIU_PCR189_OFFSET

SIU_PCR190_OFFSET   .equ    $01bc
SIU_PCR190          .equ    SIU_BASE+SIU_PCR190_OFFSET

SIU_PCR191_OFFSET   .equ    $01be
SIU_PCR191          .equ    SIU_BASE+SIU_PCR191_OFFSET

; GPDO: GPIO pin data out register --------------------------------------------
                                            ;  pin data out
PDO_VOH             .equ    %1 << 0         ;< voh is driven onto external pin
PDO_VOL             .equ    %0 << 0         ;< vol is driven onto external pin

SIU_GPDO188_OFFSET  .equ    $06bc
SIU_GPDO188         .equ    SIU_BASE+SIU_GPDO188_OFFSET

SIU_GPDO189_OFFSET  .equ    $06bd
SIU_GPDO1889        .equ    SIU_BASE+SIU_GPDO189_OFFSET

SIU_GPDO190_OFFSET  .equ    $06be
SIU_GPDO190         .equ    SIU_BASE+SIU_GPDO190_OFFSET

SIU_GPDO191_OFFSET  .equ    $06bf
SIU_GPDO191         .equ    SIU_BASE+SIU_GPDO191_OFFSET

# -----------------------------------------------------------------------------
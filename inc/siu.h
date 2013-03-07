/**
 * Copyright (c) 2013, Sean Stasiak. All rights reserved.
 * Developed by: Sean Stasiak <sstasiak@gmail.com>
 * Refer to license terms at the bottom of this file
 */

/* BASE: system integration unit ------------------------------------------ */
enum { SIU_BASE = 0xc3f90000 };

/* PCR: pad configuration register ---------------------------------------- */
enum
{                       /*   pin assignment:                                */
  PA_PRIM = 1 << 10,    /**< primary function                               */
  PA_ALT  = 2 << 10,    /**< alternate function                             */
  PA_ALT2 = 4 << 10,    /**< alternate function 2                           */
  PA_ALT3 = 8 << 10,    /**< alternate function 3                           */
  PA_GPIO = 0 << 10,    /**< gpio                                           */
  
                        /*   output buffer enable:                          */
  OBE_DIS  = 0 << 9,    /**< disable output buffer for pad                  */
  OBE_ENAB = 1 << 9,    /**< enable output buffer for pad                   */
  
                        /*   input buffer enable:                           */
  IBE_DIS  = 0 << 8,    /**< disable input buffer for pad                   */
  IBE_ENAB = 1 << 8,    /**< enable input buffer for pad                    */
  
                        /*  drive strength control                          */
  DSC_10PF = 0 << 6,    /**< 10pf drive strength (weakest)                  */
  DSC_20PF = 1 << 6,    /**< 20pf drive strength                            */
  DSC_30PF = 2 << 6,    /**< 30pf drive strength                            */
  DSC_50PF = 3 << 6,    /**< 50pf drive strength (strongest)                */
  
                        /*  open drain output enable                        */
  ODE_DIS  = 0 << 5,    /**< disable (push/pull driver enabled)             */
  ODE_ENAB = 1 << 5,    /**< enable open drain for the pad                  */
  
                        /*  input hysteresis                                */
  HYS_DIS  = 0 << 4,    /**< disable hysteresis for the pad                 */
  HYS_ENAB = 1 << 4,    /**< enable hysteresis for the pad                  */
  
                        /*  slew rate control                               */
  SRC_MIN = 0 << 2,     /**< minimum slew rate                              */
  SRC_MED = 1 << 2,     /**< medium slew rate                               */
  SRC_MAX = 2 << 2,     /**< maximum slew rate                              */
  
                        /*  weak pullup/pulldown enable                     */
  WPE_DIS  = 0 << 1,    /**< disable weak pull device for pad               */
  WPE_ENAB = 1 << 1,    /**< enable weak pull device for pad                */
  
                        /*  weak pullup/pulldown select                     */
  WPS_PDOWN = 0 << 0,   /**< pulldown is enabled for the pad                */
  WPS_PUP   = 1 << 0,   /**< pullup is enabled for the pad                  */
};

enum
{
  SIU_PCR188_OFFSET = 0x01b8,
  SIU_PCR188        = SIU_BASE+SIU_PCR188_OFFSET,

  SIU_PCR189_OFFSET = 0x01ba,
  SIU_PCR189        = SIU_BASE+SIU_PCR189_OFFSET,

  SIU_PCR190_OFFSET = 0x01bc,
  SIU_PCR190        = SIU_BASE+SIU_PCR190_OFFSET,

  SIU_PCR191_OFFSET = 0x01be,
  SIU_PCR191        = SIU_BASE+SIU_PCR191_OFFSET
};

/* GPDO: GPIO pin data out register --------------------------------------- */
enum
{                       /*   pin data out                                   */
  PDO_VOH  = 1 << 0,    /**< voh is driven onto external pin                */
  PDO_VOL  = 0 << 0,    /**< vol is driven onto external pin                */
  PDO_MASK = 1 << 0
};

enum
{
  SIU_GPDO188_OFFSET = 0x06bc,
  SIU_GPDO188        = SIU_BASE+SIU_GPDO188_OFFSET,

  SIU_GPDO189_OFFSET = 0x06bd,
  SIU_GPDO1889       = SIU_BASE+SIU_GPDO189_OFFSET,

  SIU_GPDO190_OFFSET = 0x06be,
  SIU_GPDO190        = SIU_BASE+SIU_GPDO190_OFFSET,

  SIU_GPDO191_OFFSET = 0x06bf,
  SIU_GPDO191        = SIU_BASE+SIU_GPDO191_OFFSET
};

/**
 * Copyright (c) 2013, Sean Stasiak. All rights reserved.
 * Developed by: Sean Stasiak <sstasiak@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * with the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 *   -Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimers.
 *
 *   -Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimers in the documentation
 *    and/or other materials provided with the distribution.
 *
 *   -Neither Sean Stasiak, nor the names of other contributors may be used to
 *    endorse or promote products derived from this Software without specific
 *    prior written permission.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH
 * THE SOFTWARE.
 */
/**
 * Copyright (c) 2013, Sean Stasiak. All rights reserved.
 * Developed by: Sean Stasiak <sstasiak@gmail.com>
 * Refer to license terms at the bottom of this file
 */

#include "blinky.h"
#include "siu.h"
#include "swt.h"

/**
 * @public
 * @brief kill swt, kill booke wdt, and cycle led 0 continuously
 * @note: TCR[WRC] can only be cleared by a reset. The BAM has turned it on for
 *        us, so the best we can do at this point is to simply put the trip
 *        point so far out in time that it won't trigger itself.
 */
__declspec(section ".init")
asm void
  blinky( void )
{
  enum { LED_OFF = PDO_VOH };
  enum { LED_ON = PDO_VOL };
  enum { LED0_GPDO = SIU_GPDO188_OFFSET };
  enum { LED0_PCR = SIU_PCR188_OFFSET };
  enum { LED0_PCR_VALUE = PA_GPIO | OBE_ENAB | DSC_50PF | ODE_ENAB | \
                          SRC_MAX | WPE_DIS };

        nofralloc
        lis         r1, (MAP0_ENAB|MAP1_ENAB|MAP2_ENAB)@h   /**< disable swt, but     */
        lis         r2, SWT_BASE@ha                         /*  still allow later     */
        stw         r1, SWT_CR@l(r2)                        /*  modification          */

        xor         r1, r1, r1                              /**< kill booke wdt as    */
        mttcr       r1                                      /*   best we can, see     */
                                                            /*   note above           */

        li          r3, LED_ON                              /**< set state to avoid   */
        lis         r2, SIU_BASE@ha                         /*   glitch on dir change */
        stb         r3, LED0_GPDO@l(r2)                     /*                        */

        lis         r1, LED0_PCR_VALUE@h                    /**< set as output        */
        ori         r1, r1, LED0_PCR_VALUE@l                /*                        */
        sth         r1, LED0_PCR@l(r2)                      /*                        */

        lis         r1, 0x0008                              /*< 0x00080000 ~6hz       */
@loop:  mtctr       r1                                      /*< reload cached cnt     */
@wait:  bdnz        @wait                                   /*                        */
        xori        r3, r3, PDO_MASK                        /*< invert state          */
        stb         r3, LED0_GPDO@l(r2)                     /*< drive                 */
        b           @loop
}

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
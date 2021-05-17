-- C3A00121.A
 --
--                             Grant of Unlimited Rights
--
--     Under contracts F33600-87-D-0337, F33600-84-D-0280, MDA903-79-C-0687,
--     F08630-91-C-0015, and DCA100-97-D-0025, the U.S. Government obtained 
--     unlimited rights in the software and documentation contained herein.
--     Unlimited rights are defined in DFAR 252.227-7013(a)(19).  By making 
--     this public release, the Government intends to confer upon all 
--     recipients unlimited rights  equal to those held by the Government.  
--     These rights include rights to use, duplicate, release or disclose the 
--     released technical data and computer software in whole or in part, in 
--     any manner and for any purpose whatsoever, and to have or permit others 
--     to do so.
--
--                                    DISCLAIMER
--
--     ALL MATERIALS OR INFORMATION HEREIN RELEASED, MADE AVAILABLE OR
--     DISCLOSED ARE AS IS.  THE GOVERNMENT MAKES NO EXPRESS OR IMPLIED 
--     WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS OF THE
--     SOFTWARE, DOCUMENTATION OR OTHER INFORMATION RELEASED, MADE AVAILABLE 
--     OR DISCLOSED, OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS FOR A
--     PARTICULAR PURPOSE OF SAID MATERIAL.
--*
 --
 -- OBJECTIVE:
 --      See file C3A00122.AM
 --
 -- TEST DESCRIPTION:
 --      See file C3A00122.AM
 -- 
 -- TEST FILES:
 --      The following files comprise this test:
 --
 --         C3A00120.A
 --      => C3A00121.A
 --         C3A00122.AM
 --
 --
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--
 --!
 
 Separate (C3A0012_0)
 procedure Log_Calc_Fast (Angle     : in  Float;
                          Method    : out Call_Kind) is
 begin
    C3A0012_0.Log_Result := Angle;
    Method := Fast_Call;
 end Log_Calc_Fast;

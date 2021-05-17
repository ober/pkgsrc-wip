-- LXH40080.A
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
--      See file LXH40084.AM for details on this test
--
-- TEST DESCRIPTION:
--      See file LXH40084.AM for details on this test
--
-- SPECIAL REQUIREMENTS:
--      See file LXH40084.AM for details on this test
--
-- TEST FILES:
--      This test consists of the following files:
--
--    =>   LXH40080.A
--         LXH40081.A
--         LXH40082.A
--         LXH40083.A
--         LXH40084.AM
--
-- APPLICABILITY CRITERIA:
--      See file LXH40084.AM for details on this test
--
-- PASS/FAIL CRITERIA:
--      See file LXH40084.AM for details on this test
--
-- CHANGE HISTORY:
--      22 MAR 96   SAIC   Initial version
--
--!

----------------------------------------------------------------- LXH4008_0

procedure LXH4008_0 is

  type UByte is mod 256;

  type IByte is range -127..127;

  function LXH4008_1(I: IByte) return UByte is separate;

  U : UByte;
  I : IByte := 42;

begin  -- Main test procedure.

  U := LXH4008_1(I);

end LXH4008_0;

-- LA200011.A
--
--                             Grant of Unlimited Rights
--
--     Under contracts F33600-87-D-0337, F33600-84-D-0280, MDA903-79-C-0687 and
--     F08630-91-C-0015, the U.S. Government obtained unlimited rights in the
--     software and documentation contained herein.  Unlimited rights are
--     defined in DFAR 252.227-7013(a)(19).  By making this public release,
--     the Government intends to confer upon all recipients unlimited rights
--     equal to those held by the Government.  These rights include rights to
--     use, duplicate, release or disclose the released technical data and
--     computer software in whole or in part, in any manner and for any purpose
--     whatsoever, and to have or permit others to do so.
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
--      See LA200010.A.
--
-- TEST DESCRIPTION:
--      See LA200010.A.
--
-- SPECIAL REQUIREMENTS:
--      See LA200010.A.
--
-- TEST FILES:
--      This test consists of the following files:
--         LA200010.A
--      -> LA200011.A
--         LA200012.AM
--
-- PASS/FAIL CRITERIA:
--      See LA200010.A.
--
-- CHANGE HISTORY:
--     25 JAN 99   RLB       Initial version.
--     27 JAN 99   RLB       Revised for reviewer comments.
--
--!

package body LA20001_0 is

   function LA20001_1 return Integer is separate; -- Has the same expanded name
                                                  -- as the child.

   procedure Do_a_Little (A : out Integer) is
   begin
      A := LA20001_1;
   end Do_a_Little;

end LA20001_0;

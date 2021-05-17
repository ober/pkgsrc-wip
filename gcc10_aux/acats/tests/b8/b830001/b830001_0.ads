-- B830001.A
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
--      Check that two homographs are not allowed to be declared explicitly
--      immediately within the same declarative region.
--      Check for cases of child package names.
--      Check for cases of dispatching operations declared in the visible part
--      of an instance.
--
-- TEST DESCRIPTION:
--      Declare the first grandparent package (B830001_0). Declare a parent
--      package (B830001_0.B830001_2) with a procedure in the parent package
--      specification (B830001_3).  Declare the second grandparent package
--      (B830001_10).  Declare a subunit in the second grandparent package
--      specification (B830001_11).  Declare a second parent package
--      (B830001_10.B830001_12).  Declare a variable in the grandparent package
--      body (B830001_12). Declare the third parent package (B830001_10.
--      B830001_13).  Declare a child package (B830001_10.B830001_13.
--      B830001_14).  In the parent package body, declare a variable
--      (B830001_14).  Declare a generic package with dispatching operations
--      in the visible part (B830001_20).
--
--             B830001_0                        B830001_10          B830001_20
--                     \                   (subunit B830001_11)
--                      \                       /        \
--                       \                     /          \
--                    B830001_2         B830001_12    B830001_13
--              (procedure B830001_3)                      |
--                                                         |
--                                                    B830001_14
--
--      The following cases should cause compile-time errors:
--         (a) declare a child package B830001_3.
--         (b) "with" the second parent package, B830001_12, in the subunit, 
--             B830001_11.
--         (c) "with" the child package, B830001_14 in the parent package body,
--             B830001_13.
--         (d) instantiate the generic package, B830001_20.
--
--
-- CHANGE HISTORY:
--      14 Jul 95   SAIC    Initial prerelease version.
--      17 Apr 96   SAIC    Replaced null bodies.
--      25 Jan 99   RLB     Removed case which violates 10.2(19) and eliminated
--                          occurrences of units with same name.
--!

package B830001_0 is
   procedure Do_Nothing;
   -- So a package body is required.

end B830001_0;

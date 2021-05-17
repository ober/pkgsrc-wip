-- B854005.A
--
--                             Grant of Unlimited Rights
--
--     The Ada Conformity Assessment Authority (ACAA) holds unlimited
--     rights in the software and documentation contained herein. Unlimited
--     rights are the same as those granted by the U.S. Government for older
--     parts of the Ada Conformity Assessment Test Suite, and are defined
--     in DFAR 252.227-7013(a)(19). By making this public release, the ACAA
--     intends to confer upon all recipients unlimited rights equal to those
--     held by the ACAA. These rights include rights to use, duplicate,
--     release or disclose the released technical data and computer software
--     in whole or in part, in any manner and for any purpose whatsoever, and
--     to have or permit others to do so.
--
--                                    DISCLAIMER
--
--     ALL MATERIALS OR INFORMATION HEREIN RELEASED, MADE AVAILABLE OR
--     DISCLOSED ARE AS IS. THE ACAA MAKES NO EXPRESS OR IMPLIED
--     WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS OF THE
--     SOFTWARE, DOCUMENTATION OR OTHER INFORMATION RELEASED, MADE AVAILABLE
--     OR DISCLOSED, OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS FOR A
--     PARTICULAR PURPOSE OF SAID MATERIAL.
--
--                                     Notice
--
--     The ACAA has created and maintains the Ada Conformity Assessment Test
--     Suite for the purpose of conformity assessments conducted in accordance
--     with the International Standard ISO/IEC 18009 - Ada: Conformity
--     assessment of a language processor. This test suite should not be used
--     to make claims of conformance unless used in accordance with
--     ISO/IEC 18009 and any applicable ACAA procedures.
--*
-- OBJECTIVE:
--     Check that if a renaming is of a prefixed view, the renaming is illegal
--     if renaming the prefix of that view as an object is illegal.
--
-- TEST DESCRIPTION:
--     This rule was added a Binding Interpretation AI12-0204-1. It seems
--     relatively important, as similar issues are prevented by explicit
--     rules and thus programmers may not be expecting issues. As the AI
--     was approved by WG 9 in 2017, and it is classified as a bug fix
--     intended to apply to Ada 2012, we test it here.
--
--     We borrow some of the type declarations from test B851005 to
--     generate the illegal prefixes. We only try a few simple cases as our
--     goal here is to ensure that this check is made, not to check the
--     details of 'known to be constrained' (tests B851005-7 do that).
--
-- CHANGE HISTORY:
--     07 Sep 2018 RLB Created test.
--
package B854005A is

   type Counter is tagged record
      Num : Natural := 1;
   end record;

   function Count (Obj : in Counter) return Natural;

   procedure Set (Obj : in out Counter; Num : in Natural);

   procedure Bump (Obj : in out Counter);

   type A0 is array (Integer range <>) of Counter;

   type R0 (D : Natural) is record
      F : Counter := (Num => D);
   end record;

   type Rec (D : Integer := 1) is
      record
         F1 : R0(D);
         F2 : A0(1 .. D);
         F3 : R0(3);
         case D is
            when 1 =>
               F4 : Counter := (Num => D);
            when others =>
               F5 : Character := 'R';
           end case;
      end record;

end B854005A;

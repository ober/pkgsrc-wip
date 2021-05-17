-- C732002.A
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
--      Check differences between specific and class-wide type invariants.
--
-- TEST DESCRIPTION:
--      This test is losely derived from section 16.3 of John Barnes'
--      "Programming in Ada 2012".
--      Invariant checks are expected to be performed on an in out parameter of
--      a type with an invariant after a procedure call.
--      In this test the parent type has both a specific invariant (within an
--      outer circle) and a class-wide invariant (in the positive quadrant).
--      So it should be ok to move the point inwards, but not to move it
--      outside the outer circle (specific invariant should apply) or to the
--      negative quadrant (class-wide invariant should apply).
--      The child type has a different specific invariant (outside an inner
--      circle) and a couple of overriding subprograms that should not inherit
--      the parent's specific invariant.
--      So it should be ok to move the point outwards outside the outer circle
--      (since the parent's specific invariant shouldn't apply), but not to
--      move it inside the inner circle (own specific invariant should apply)
--      or to the negative quadrant (class-wide invariant should apply).
--
-- CHANGE HISTORY:
--      19 Jan 15   JAC     Initial pre-release version.
--      09 Apr 15   RLB     Renamed, readied for release.
--
--!
package C732002_Places is

   pragma Assertion_Policy (Check);

   type Disc_Pt_Type is tagged private
      with Type_Invariant       => Check_Inside            (Disc_Pt_Type),
           Type_Invariant'Class => Check_Positive_Quadrant (Disc_Pt_Type);

   function Check_Inside            (Disc_Pt : Disc_Pt_Type) return Boolean;

   function Check_Positive_Quadrant (Disc_Pt : Disc_Pt_Type) return Boolean;

   function Init return Disc_Pt_Type;

   procedure Move_In  (Disc_Pt : in out Disc_Pt_Type);

   procedure Move_Out (Disc_Pt : in out Disc_Pt_Type);

   procedure Negate   (Disc_Pt : in out Disc_Pt_Type);

private

   type Disc_Pt_Type is tagged record
      X, Y : Float range -1.0 .. +1.0;
   end record;

   function Check_Inside            (Disc_Pt : Disc_Pt_Type) return Boolean is
      (Disc_Pt.X ** 2 + Disc_Pt.Y <= 1.0); -- Note no allowance for inaccuracy

   function Check_Positive_Quadrant (Disc_Pt : Disc_Pt_Type) return Boolean is
      (Disc_Pt.X > 0.0 and Disc_Pt.Y > 0.0);

end C732002_Places;

-- CD30004.A
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
--
--
--      Check that the unspecified Size of static discrete
--      subtypes is the number of bits needed to represent each value
--      belonging to the subtype using an unbiased representation, where
--      space for a sign bit is provided only in the event the subtype
--      contains negative values.  Check that for first subtypes specified
--      Sizes are supported reflecting this representation. [ARM 95 13.3(55)].
--
-- TEST DESCRIPTION:
--      This test defines a few types that should have distinctly recognizable
--      sizes.  A packed record which should result in very specific bits
--      sizes for it's components is used to check the first part of the
--      objective. The second part of the objective is checked by giving
--	sizes for a similar set of types.
--
-- APPLICABILITY CRITERIA:
--      All implementations must attempt to compile this test.
--
--      For implementations validating against Systems Programming Annex (C):
--        this test must execute and report PASSED.
--
--      For implementations not validating against Annex C:
--        this test may report compile time errors at one or more points
--        indicated by "-- ANX-C RQMT", in which case it may be graded as inapplicable.
--        Otherwise, the test must execute and report PASSED.
--
-- CHANGE HISTORY:
--      22 JUL 95   SAIC   Initial version
--      06 MAY 96   SAIC   Revised for 2.1
--      26 FEB 97   PWB.CTA Added pragma Pack for type Check_Record
--      16 FEB 98   EDS    Modified Documentation.
--      06 JUL 99   RLB    Repaired comments, removed junk test cases.
--                         Added test cases to test that appropriate Size
--                         clauses are allowed.

--!
----------------------------------------------------------------- CD30004_0

package CD30004_0 is

--      Check that the unspecified Size of static discrete and fixed point
--      subtypes are the number of bits needed to represent each value
--      belonging to the subtype using an unbiased representation, where
--      space for a sign bit is provided only in the event the subtype
--      contains negative values.  Check that for first subtypes specified
--      Sizes are supported reflecting this representation.

  type Bits_2 is ( Zeroth_Bit, Fiercest_Bit, Secants_Bit, Threadless_Bit );

  type Bits_3 is range 0..2**3-1;

  type Bits_5 is range -2**4+1..2**4-1;  -- allow for 1's comp

  type Bits_14 is mod 2**14;

  type Check_Record is
  record
    B14 : Bits_14;
    B2  : Bits_2;
    B3  : Bits_3;
    B5  : Bits_5;
    C   : Character;
  end record;
  pragma Pack ( Check_Record );

  procedure TC_Check_Values;
  procedure TC_Check_Specified_Sizes;

end CD30004_0;

-- BA120184.A
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
--    The ACAA has created and maintains the Ada Conformity Assessment Test
--    Suite for the purpose of conformity assessments conducted in accordance
--    with the International Standard ISO/IEC 18009 - Ada: Conformity
--    assessment of a language processor. This test suite should not be used
--    to make claims of conformance unless used in accordance with
--    ISO/IEC 18009 and any applicable ACAA procedures.
--
--*
--
-- OBJECTIVE:
--    See BA120180.A.
--
-- TEST DESCRIPTION
--    See BA120180.A.
--
-- TEST FILES:
--    This test consists of the following files:
--        BA120180.A
--        BA120181.A
--        BA120182.A
--        BA120183.A
--     -> BA120184.A
--        BA120185.A
--        BA120186.A
--        BA120187.A
--
-- PASS/FAIL CRITERIA:
--    See BA120180.A.
--
-- CHANGE HISTORY:
--    22 May 2018   RLB   Created test from existing test BA12014.
--
--!

private with BA12018_0.BA12018_1;
procedure BA12018_T4 (X : in out BA12018_0.Rec) is -- ERROR: {34;4}
                                         -- Used in subprogram specification
    Z : Float := BA12018_0.BA12018_1.Func (92); -- OK. {18;5}

    Temp : BA12018_0.Rec := ('G', 'B'); -- OK. {12;14}

begin
    X := Temp;
end BA12018_T4;

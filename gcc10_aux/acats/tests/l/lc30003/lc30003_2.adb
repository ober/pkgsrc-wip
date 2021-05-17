-- LC300031.A
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
--      See LC300030.A.
--
-- TEST DESCRIPTION:
--      See LC300030.A.
--
-- SPECIAL REQUIREMENTS:
--      See LC300030.A.
--
-- TEST FILES:
--      This test consists of the following files:
--         LC300030.A
--      -> LC300031.A
--         LC300032.AM
--
-- PASS/FAIL CRITERIA:
--      See LC300030.A.
--
-- CHANGE HISTORY:
--     20 Jul 2003   RLB    Initial test, created from BC3009C.
--     03 Apr 2003   RLB    Changed case of OPTIONAL ERROR to match test
--                          suite documentation.
--
--!

with LC30003_0;
procedure LC30003_2 is
    procedure Three is new LC30003_0; -- OPTIONAL ERROR: This instantiation
                                      -- violates 12.3(19).
begin
    Three;
end LC30003_2;

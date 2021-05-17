-- BA120165.A
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
--    See BA120160.A.
--
-- TEST DESCRIPTION
--    See BA120160.A.
--
-- TEST FILES:
--    This test consists of the following files:
--        BA120160.A
--        BA120161.A
--        BA120162.A
--        BA120163.A
--        BA120164.A
--     -> BA120165.A
--        BA120166.A
--
-- PASS/FAIL CRITERIA:
--    See BA120160.A.
--
-- CHANGE HISTORY:
--    29 Mar 2007   RLB   Created test from BA12014.
--    20 Aug 2007   RLB   Removed broken test case and associated file.
--
--!

-- Inherits limited private with clause.
generic
package BA12016_0.Parent.T5 is

    type Acckk is access BA12016_0.BA12016_1.R; -- ERROR: Used in visible part.

private

    Z : constant access BA12016_0.BA12016_1.R := null; -- OK.

end BA12016_0.Parent.T5;

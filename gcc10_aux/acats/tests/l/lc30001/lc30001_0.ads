-- LC300010.A
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
--      Check that recursive instantiation is not allowed. (This is rule
--      12.3(19)). Case 1 - Instantiation of self.
--
-- TEST DESCRIPTION:
--      Declare the generic package (LC30001_0), a renames of it (LC30001_1),
--      the instantiate the renames in the body of the package.
--      Declare a main subprogram that includes an instantiation of the
--      generic. An attempt to execute this partition must fail.
--
-- SPECIAL REQUIREMENTS:
--      To build this test:
--         1) Compile the file LC300010 (and include the results in the
--            program library).
--         2) Compile the file LC300011 (and include the results in the
--            program library).
--         3) Compile the file LC300012 (and include the results in the
--            program library).
--         4) Attempt to build an executable image.
--         5) If an executable image results, run it.
--
-- TEST FILES:
--      This test consists of the following files:
--      -> LC300010.A
--         LC300011.A
--         LC300012.AM
--
-- PASS/FAIL CRITERIA:
--      The test passes if a link time error message reports that
--      LC200012 contains a recursive instantiation, or the
--      compilation of LC300011 or LC300012 is rejected because it contains
--      a recursive instantiation.
--
-- CHANGE HISTORY:
--     20 Jul 2002   RLB    Initial test, created from BC3009C.
--!



generic
package LC30001_0 is
    procedure Dummy;
end LC30001_0;

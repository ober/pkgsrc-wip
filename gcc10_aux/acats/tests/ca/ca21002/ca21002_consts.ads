-- CA21002.A
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
--
--*
-- OBJECTIVE:
--     Check that the categorization aspects Pure and Preelaborate can
--     be specified by a constant in another package.
--
--     Check that the categorization aspects Pure and Preelaborate can
--     specified as False, in which case they have no effect.
--
-- TEST DESCRIPTION:
--     We imagine that a subsystem of related packages are all specified
--     Pure (resp. Preelaborate) via an external constant, which allows
--     their categorization to be changed as a group by changing the constant.
--     Further, we imagine that the categorization has been turned off
--     to add some debugging code (emulated in this test by package Report)
--     that doesn't have the appropriate categorization. (After the debugging
--     is completed, the debugging code would be removed or commented out,
--     and the flag changed to True to re-apply the categorization.)
--
--     We try two subsystems, one for Pure and one for Preelaborate.
--
--     Note that the test can act as a kind of B-Test by changing the
--     values of the constants Is_Pure and Is_Preelab to True; the
--     withs of Report in the packages should be rejected in that case.
--
-- CHANGE HISTORY:
--     18 Feb 2015  RLB  Created test.
--
--!
package CA21002_Consts is
   Is_Pure    : constant Boolean := False;
   Is_Preelab : constant Boolean := False;
end CA21002_Consts;

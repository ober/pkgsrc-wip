-- B4320020.A
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
--      Check that the type of an extension aggregate cannot be a type such
--      that the current view of the parent of the aggregate type is not a
--      descendant of the full view of the ancestor type.
--
-- TEST DESCRIPTION:
--
--      The test declares a root private type, and then various extensions
--      of that type in a child package and an unrelated package. Finally,
--      extensions of the extensions are declared in a child package. The
--      tests are then carried out in the body of that package and the body
--      of the root package, where the full root type is visible, but the
--      it is not visible for the extensions which derive from the partial view
--      of the root type.
--
--      This example is an enhanced version of the example found in
--      AI05-0115-1. This objective comes from the definition of "decendant"
--      enhanced by AI05-0115-1. Ada already has rules that the components of
--      the ancestor of types like these are not visible, and the enhanced
--      rules ensure that aggregates cannot be written for types with hidden
--      components.
--
-- TEST FILES:
--      This test consists of the following files:
--      -> B4320020.A
--         B4320021.A
--         B4320022.A
--
-- PASS/FAIL CRITERIA:
--      Files B4320021.A and B4320022.A contain errors. All errors in these
--      files must be detected to pass the test.
--
-- CHANGE HISTORY:
--      30 Dec 19   RLB     Created test.
--!

package B432002 is

   type Root is tagged private;

   procedure Force_Body;

private

   type Root is tagged record
      C1 : Integer := 0;
   end record;

end B432002;

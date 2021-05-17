-- BXH4003.A
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
-- OBJECTIVE
--     Check pragma Restrictions.
--     Check that the application of the configuration pragma Restrictions
--     with the specific restriction:
--       No_Local_Allocators
--     disallows allocators in subprograms, generic subprograms, tasks, and
--     entry bodies. Check that generic units are expanded at the point of
--     instantiation for the purposes of this check (13.12(8.1-4)).
--     Check that allocators and generic instantiations are still
--     allowed at the library package level.
--
-- TEST DESCRIPTION
--     The test requires that the configuration pragma
--     Restrictions(No_Local_Allocators) be processed.  Allocators
--     and generic instantiations used in this test within an enclosed scope
--     should cause compilation errors.  Library level allocators and generic
--     instantiations should still be allowed.
--
-- APPLICABILITY CRITERIA:
--      This test is only applicable for a compiler attempting validation
--      for the Safety and Security Annex.
--
-- SPECIAL REQUIREMENTS
--      The implementation must process a configuration pragma which is not
--      part of any Compilation Unit; the method employed is implementation
--      defined.
--
--
-- CHANGE HISTORY:
--      26 OCT 95   SAIC   Initial version
--      11 APR 96   SAIC   Removed unintentional error case for 2.1
--      21 NOV 96   SAIC   Corrected for 2.1 release
--      14 MAR 03   RLB    Corrected so that instantiations are really
--                         illegal. (The Technical Corrigendum made it legal
--                         to have instantiations with No_Local_Allocators).
--                         Added missing entry body check.
--      14 APR 03   RLB    Corrected parameter name in new generic.
--      23 MAY 03   RLB    Corrected additional test errors.
--
--!

---------------------------- CONFIGURATION PRAGMAS -----------------------

pragma Restrictions(No_Local_Allocators);                         -- OK

package body BXH4003_2 is
  type Reference is access Item;
  Default_Item : constant Reference := new Item; -- OK
                                                 -- (in library level instance)
  function Is_Default (The_Item : in Item) return Boolean is
  begin
    return The_Item = Default_Item.all;
  end Is_Default;
end BXH4003_2;

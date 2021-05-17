-- CXH3001.A
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
--     Check pragma Reviewable.
--     Check that pragma Reviewable is accepted as a configuration pragma.
--
-- TEST DESCRIPTION
--     The test requires that the configuration pragma Reviewable
--     be processed.  The following package contains a simple "one of each
--     construct in the language" to check that the configuration pragma has
--     not disallowed some feature of the language.  This test should generate
--     no errors.
--
-- APPLICABILITY CRITERIA:
--      This test is only applicable for a compiler attempting validation
--      for the Safety and Security Annex.
--
-- PASS/FAIL CRITERIA:
--      This test passes if it correctly compiles, executes, and reports PASS.
--      It fails if the pragma is rejected.  The effect of the pragma should
--      be to produce a listing with information, including warnings, as
--      required in H.3.1. Specific form and contents of this listing are not
--      required by this test and are not part of the PASS/FAIL criteria.
--
-- SPECIAL REQUIREMENTS
--      The implementation must process a configuration pragma which is not
--      part of any Compilation Unit; the method employed is implementation
--      defined.
--
--      Pragma Reviewable requires that the implementation provide the
--      following information for the compilation units in this test:
--
--        o Where compiler-generated run-time checks remain (6)
--
--        o Identification of any construct with a language-defined check
--          that is recognized prior to runtime as certain to fail if
--          executed (7)
--
--        o For each reference to a scalar object, an identification of
--          the reference as either "known to be initialized,"
--          or "possibly uninitialized" (8)
--
--        o Where run-time support routines are implicitly invoked (9)
--
--        o An object code listing including: (10)
--
--          o Machine instructions with relative offsets (11)
--
--          o Where each data object is stored during its lifetime (12)
--
--          o Correspondence with the source program (13)
--
--        o Identification of each construct for which the implementation
--          detects the possibility of erroneous execution (14)
--
--        o For each subprogram, block, task or other construct implemented by
--          reserving and subsequently freezing an area of the run-time stack,
--          an identification of the length of the fixed-size portion of
--          the area and an indication of whether the non-fixed size portion
--          is reserved on the stack or in a dynamically managed storage
--          region (15)
--
--
-- CHANGE HISTORY:
--      26 OCT 95   SAIC   Initial version
--      12 NOV 96   SAIC   Revised for 2.1
--      27 AUG 99   RLB    Removed result dependence on uninitialized object.
--      30 AUG 99   RLB    Repaired the above.
--
--!

---------------------------- CONFIGURATION PRAGMAS -----------------------

pragma Reviewable;                                                -- OK

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

with Report;
package body CXH3001_0 is

 procedure P(R:Root) is
    Warnable : Positive := 0; -- (7)                      -- OPTIONAL WARNING
    -- this would raise Constraint_Error if P were ever called, however
    -- this test never calls P.
  begin
    case R.Disc is
      when Item   => Report.Comment("Got Item");
      when Stuff  => Report.Comment("Got Stuff");
      when Things => Report.Comment("Got Things");
    end case;
    if Report.Ident_Int( Warnable ) = 0 then
      Global_Variable := not Global_Variable; -- (8) known to be initialized
    end if;
  end P;

  function F return A_Proc is
  begin
    return P'Access;
  end F;

  protected body PT is

    entry Set(Switch: Boolean) when True is
    begin
      Toggle := Switch;
    end Set;

    function Enquire return Boolean is
    begin
      return Toggle;
    end Enquire;

  end PT;

  task body TT is
  begin
    loop
      accept Release;
      exit when Global_Variable;
    end loop;
  end TT;

  -- (9) TT activation
end CXH3001_0;

-- B391001.A
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
--      Check that:
--      A discriminant on a tagged type is not allowed to have a
--      default.
--      Private record extension is not allowed to be declared
--      immediately within a subprogram declarative region.
--      Record extension of a nonlimited type does not allow limited
--      components.
--      Record extension does not allow repeating identifiers used in
--      the parent declaration.
--
-- TEST DESCRIPTION:
--      This test declares a tagged type and attempts to extend it in
--      four illegal ways as described in the objective.
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--      15 Nov 95   SAIC    Restructured for 2.0.1
--      15 Mar 07   RLB     Removed tests of nested extensions, as those
--                          are allowed by the Amendment.
--
--!

package B391001_0 is

  type Unlimited_Tagged_Type is tagged record
    Simple_Component : Boolean;
  end record;

  type Limited_Type is limited private;

private
   type Limited_Type is new Integer;
end B391001_0;

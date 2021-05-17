-- BC54A01.A
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
--      Check that, for a formal access-to-subprogram subtype whose profile
--      contains access parameters, the designated subtypes of the
--      corresponding access parameters in the formal and actual profiles must
--      statically match. Check cases where the designated subtype is an
--      elementary subtype.
--
-- TEST DESCRIPTION:
--      Two subtypes of the same type statically match if their constraints
--      statically match. Two constraints statically match if they are both
--      null constraints, both are static and have equal corresponding bounds
--      or discriminant values, or both are nonstatic and result from the same
--      elaboration of a constraint of a subtype indication or the same
--      evaluation of a range of a discrete subtype definition.
--
--      The test declares generics with formal access-to-subprogram types
--      (access-to-procedure and access-to-function) with designated profiles
--      containing access parameters of an elementary type (discrete (integer),
--      floating point, and access-to-tagged). For each of these designated
--      types (as appropriate), various actual access-to-subprogram types are
--      declared whose access parameters designate unconstrained, constrained,
--      and derived subtypes with null, static, and nonstatic constraints.
--
-- TEST FILES:
--      The following files comprise this test:
--
--         FC54A00.A
--      -> BC54A01.A
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--
--!

with FC54A00;
package BC54A01_0 is

--
-- Generics declaring access-to-subprogram formals:
--

   -- Designated type is discrete:

   generic
      type ATS is access procedure (P: access FC54A00.Numerals);
   package Static_Discrete is end;

   generic
      type ATS is access procedure (P: access FC54A00.Positive_Nonstatic);
   package Nonstatic_Discrete is end;


   -- Designated type is floating point:

   generic
      type ATS is access function (P: access FC54A00.Float_Type)
        return Integer;
   package Unconstrained_Float is end;

   generic
      type ATS is access function (P: access FC54A00.Float_With_Range)
        return Integer;
   package Constrained_Float is end;



   -- Designated type is access-to-tagged:

   generic
      type ATS is access function (P: access FC54A00.Tagged_Ptr)
        return Boolean;
   package Unconstrained_Tagged_Access is end;


end BC54A01_0;

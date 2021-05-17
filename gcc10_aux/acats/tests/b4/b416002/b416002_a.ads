-- B416002.A
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
--
-- OBJECTIVE:
--     Check that a generalized indexing is illegal in a variable context
--     if no Variable_Indexing is specified and Constant_Indexing specifies
--     a function returning an ordinary object.
--
-- HISTORY:
--      14 May 2015   RLB   Created test.

package B416002_A is
   -- A customized version of the foundation F416A00.

   type Window is tagged private
      with Constant_Indexing => Cnst;

   type Kind is (Player, Ghost, Power_Pill);

   type Color is (White, Yellow, Orange, Pink, Red, Cyan, Blue, Green, Violet);

   type Sprite is record
      K : aliased Kind;
      C : Color;
      X, Y : Natural;
   end record;

   subtype Name is String(1..6);

   Missing_Error : exception;

   function Cnst (W : in Window; N : in Name) return Sprite;

   procedure Create_Sprite (W : in out Window;
                            N : in Name;
                            X : in Natural;
                            Y : in Natural;
                            K : in Kind;
                            C : in Color);

private

   type Tuple is record
       N : Name;
       S : Sprite;
   end record;

   type SArray is array (1..10) of Tuple;
   type Window is tagged record
      Count : Natural := 0;
      Sprites : SArray;
   end record;

end B416002_A;

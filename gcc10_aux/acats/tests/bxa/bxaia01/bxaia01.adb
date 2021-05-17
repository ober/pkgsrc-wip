-- BXAIA01.A
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
--      Check that reverse iterators are not allowed for package
--      Ada.Containers.Indefinite_Hashed_Maps.
--
-- TEST DESCRIPTION:
--      This test checks that forward, but not reverse iterators in the
--      Ada 2012 syntax are supported for Indefinite_Hashed_Maps. We check
--      this as it is different than most of the other containers.
--
-- CHANGE HISTORY:
--      20 Nov 14   RLB     Created from parts of CXAIA10.
--
--!
with Ada.Containers.Indefinite_Hashed_Maps;
with Report;
with FXAIA00; -- Foundation.

procedure BXAIA01 is

   My_Default_Value : constant String := "zzz";

   Value_In_Ptr_Array : FXAIA00.Value_In_Ptr_Array_Type
      renames FXAIA00.Value_In_Ptr_Array;

   type My_Key_Type is new Integer;

   use type Ada.Containers.Hash_Type;

   function My_Hash (Key : My_Key_Type) return Ada.Containers.Hash_Type is
   begin

      return Ada.Containers.Hash_Type (Key) * 17; -- Some prime

   end My_Hash;

   function My_Equivalent_Keys (Left, Right : My_Key_Type) return Boolean is
   begin

      return Left = Right;

   end My_Equivalent_Keys;

   package My_Indefinite_Hashed_Maps is new
     Ada.Containers.Indefinite_Hashed_Maps
     (Key_Type        => My_Key_Type,
      Element_Type    => String,
      Hash            => My_Hash,
      Equivalent_Keys => My_Equivalent_Keys); -- Default =

   My_Map_1 : My_Indefinite_Hashed_Maps.Map;

   My_Cursor_1 : My_Indefinite_Hashed_Maps.Cursor;

   use type Ada.Containers.Count_Type;
   use type My_Indefinite_Hashed_Maps.Cursor;
   use type My_Indefinite_Hashed_Maps.Map;

begin

   Report.Test
     ("BXAIA01",
      "Check that reverse iterators aren't supported for package " &
      "Ada.Containers.Indefinite_Hashed_Maps");

   declare

      Pos_Of_First_Char : Natural;
      Total_Out         : Natural;

   begin

      My_Map_1.Clear;

      Total_Out := 0;

      for E of My_Map_1 loop                  -- OK.

         Pos_Of_First_Char := Character'Pos (E (1));

         Total_Out := Total_Out + Pos_Of_First_Char;

      end loop;

      for E of reverse My_Map_1 loop          -- ERROR:

         Pos_Of_First_Char := Character'Pos (E (1));

         Total_Out := Total_Out + Pos_Of_First_Char;

      end loop;

      for C in My_Map_1.Iterate loop          -- OK.

         Pos_Of_First_Char := Character'Pos (My_Map_1 (C) (1));

         Total_Out := Total_Out + Pos_Of_First_Char;

      end loop;

      for C in reverse My_Map_1.Iterate loop  -- ERROR:

         Pos_Of_First_Char := Character'Pos (My_Map_1 (C) (1));

         Total_Out := Total_Out + Pos_Of_First_Char;

      end loop;

      for C in My_Map_1.Iterate(Start => My_Cursor_1) loop  -- ERROR:
         -- No Start parameter, either.

         Pos_Of_First_Char := Character'Pos (My_Map_1 (C) (1));

         Total_Out := Total_Out + Pos_Of_First_Char;

      end loop;

   end;


   Report.Result;

end BXAIA01;

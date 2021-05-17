-- C460015.A
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
-- OBJECTIVES:
--      Check that if the operand type of a type conversion is
--      access-to-limited-class-wide, Constraint_Error is raised if the
--      tag of the object designated by the operand does not identify a
--      specific type that is covered by or descended from the target type.
--
-- TEST DESCRIPTION:
--      Attempt to convert a parameter of a type that designates a class-wide
--      type to an object of a type that designates a specific member of that
--      class, for both an actual with a different tag and an actual with a
--      matching tag.
--
--      This test checks 4.6(42) as required by 4.6(50).
--
--      We check limited types specially since they require the use of access
--      types in many uses, and industrial experience suggests that they can
--      be implemented differently that their nonlimited cousins.
--
-- CHANGE HISTORY:
--      19 Aug 16   JAC     Initial pre-release version.
--      19 Jan 17   RLB     Readied for release: replaced objective, renamed
--                          to appropriate number, added class-wide cases,
--                          eliminated 11.6 problems, added third level of
--                          types, and checks on null.
--
--!
package C460015_1 is
   protected type Some_Lock is
      procedure Set;
      procedure Clear;
      function Is_Locked return Boolean;
   private
      Locked : Boolean := False;
   end Some_Lock;

   type Root_Facade_Type is tagged limited record
      Error_Code : Integer;
   end record;

   type Root_Facade_Ptr_Type is access all Root_Facade_Type;

   type Facade_Class_Ptr_Type is access all Root_Facade_Type'Class;

   type Facade_A_Type is new Root_Facade_Type with
   record
      Lock_A : Some_Lock;
   end record;

   type Facade_A_Ptr_Type is access all Facade_A_Type;

   type Facade_A_Class_Ptr_Type is access all Facade_A_Type'Class;

   type Facade_B_Type is new Facade_A_Type with
   record
      B : Character;
   end record;

   type Facade_B_Ptr_Type is access all Facade_B_Type;

   type Facade_B_Class_Ptr_Type is access all Facade_B_Type'Class;

   procedure Define_Construct
     (Facade_Class_Ptr : in Facade_Class_Ptr_Type);

   procedure Define_Class_Construct
     (Facade_Class_Ptr : in Facade_Class_Ptr_Type);

   function Init_Facade_Class_Ptr_with_Root return Facade_Class_Ptr_Type;

   function Init_Facade_Class_Ptr_with_A return Facade_Class_Ptr_Type;

   function Init_Facade_Class_Ptr_with_B return Facade_Class_Ptr_Type;

end C460015_1;

-- CC50001.A
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
--      Check that, in an instance, each implicit declaration of a predefined
--      operator of a formal tagged private type declares a view of the
--      corresponding predefined operator of the actual type (even if the
--      operator has been overridden for the actual type). Check that the
--      body executed is determined by the type and tag of the operands.
--
-- TEST DESCRIPTION:
--      The formal tagged private type has an unknown discriminant part, and
--      is thus indefinite. This allows both definite and indefinite types
--      to be passed as actuals. For tagged types, definite implies
--      nondiscriminated, and indefinite implies discriminated (with known
--      or unknown discriminants).
--
--      Only nonlimited tagged types are tested, since equality operators
--      are not predefined for limited types. 
--
--      A tagged type is passed as an actual to a generic formal tagged
--      private type. The tagged type overrides the predefined equality
--      operator. A subprogram within the generic calls the equality operator
--      of the formal type. In an instance, the equality operator denotes
--      a view of the predefined operator of the actual type, but the
--      call dispatches to the body of the overriding operator.
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--      21 Nov 95   SAIC    ACVC 2.0.1 fixes: Corrected expected result on
--                          calls to "=" within the instance. Modified
--                          commentary.
--
--!

package CC50001_0 is

   type Count_Type is tagged record                     -- Nondiscriminated
      Count : Integer := 0;                             -- tagged type.
   end record;

   function "="(Left, Right : Count_Type)               -- User-defined
     return Boolean;                                    -- equality operator.


   subtype Str_Len is Natural range 0 .. 100;
   subtype Stu_ID  is String (1 .. 5);
   subtype Dept_ID is String (1 .. 4);
   subtype Emp_ID  is String (1 .. 9);
   type    Status   is (Student, Faculty, Staff);

   type Person_Type (Stat : Status;                     -- Discriminated
                     NameLen, AddrLen : Str_Len) is     -- tagged type.
     tagged record                                 
      Name    : String (1 .. NameLen);
      Address : String (1 .. AddrLen);
      case Stat is
         when Student =>
            Student_ID  : Stu_ID;
         when Faculty =>
            Department  : Dept_ID;
         when Staff   =>
            Employee_ID : Emp_ID;
      end case;
   end record;

   function "="(Left, Right : Person_Type)              -- User-defined
     return Boolean;                                    -- equality operator.


   -- Testing entities: ------------------------------------------------

   TC_Count_Item     : constant Count_Type  := (Count => 111);

   TC_Person_Item    : constant Person_Type :=
     (Faculty, 18, 17, "Eccles, John Scott", "Popham House, Lee", "0931");

   ---------------------------------------------------------------------


end CC50001_0;

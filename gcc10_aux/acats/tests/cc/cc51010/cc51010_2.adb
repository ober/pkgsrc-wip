-- CC510103.AM
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
--    The ACAA has created and maintains the Ada Conformity Assessment Test
--    Suite for the purpose of conformity assessments conducted in accordance
--    with the International Standard ISO/IEC 18009 - Ada: Conformity
--    assessment of a language processor. This test suite should not be used
--    to make claims of conformance unless used in accordance with
--    ISO/IEC 18017 and any applicable ACAA procedures.
--
--*
--
-- OBJECTIVE
--     See CC510100.A.
--
-- TEST DESCRIPTION
--     See CC510100.A.
--
-- SPECIAL REQUIREMENTS
--     See CC510100.A.
--
-- TEST FILES:
--      This test consists of the following files:
--         CC510100.A
--         CC510101.A
--         CC510102.A
--      -> CC510103.AM
--
-- CHANGE HISTORY:
--      06 Jan 2015   RLB   Split test into individual files.
--      17 Mar 2015   RLB   Moved body of CC51010_2 here.
--      19 Mar 2015   RLB   Made parameter in out.
--      12 Dec 2017   RLB   Corrected name of main subprogram to match
--                          requirements outlined in User Guide section 4.3.3.
--
--!

with CC51010_1; use CC51010_1;
with Report;
package body CC51010_2 is

   Elt_Value : constant Integer := 17;

   function Access_To (Obj : in out CC51010_1.Set)
      return access CC51010_1.Set is
   begin
      return Obj'Unchecked_Access;
         -- If we know that Set is nonlimited, we could make this more useful
         -- by allocating a copy; but then the generic would need a cleanup
         -- procedure formal. That would make sense in a real container,
         -- as it would make the container more flexible.
   end Access_To;


   procedure Do_Test is
       S1 : CC51010_1.Set;
       S2 : CC51010_1.Set;
       S3 : CC51010_1.Set;

       My_Map : A_Map_of_Sets.Map_Type;

   begin
       --  Initialize S1 to { 1 .. 10 }

       for I in Integer range 1 .. 10 loop
          Add (I, S1);
       end loop;
       A_Map_of_Sets.Insert (Map => My_Map, Key => 1, Elem => S1);

       --  Initialize S2 to { 5 .. 15 }

       for I in Integer range 5 .. 15 loop
          Add (I, S2);
       end loop;
       A_Map_of_Sets.Insert (Map => My_Map, Key => 2, Elem => S2);

       --  Initialize S3 to { 20 .. 25 }

       for I in Integer range 20 .. 25 loop
          Add (I, S3);
       end loop;
       A_Map_of_Sets.Insert (Map => My_Map, Key => 3, Elem => S3);

       -- Get elements from Map by key, check if they are correct:
       if A_Map_of_Sets.Element (Map => My_Map, Key => 2).all /= S2 then
          Report.Failed ("Wrong set retrieved from map - 1st read");
       end if;
       if A_Map_of_Sets.Element (Map => My_Map, Key => 1).all /= S1 then
          Report.Failed ("Wrong set retrieved from map - 2nd read");
       end if;
       if A_Map_of_Sets.Element (Map => My_Map, Key => 3).all /= S3 then
          Report.Failed ("Wrong set retrieved from map - 3rd read");
       end if;
   end Do_Test;

end CC51010_2;

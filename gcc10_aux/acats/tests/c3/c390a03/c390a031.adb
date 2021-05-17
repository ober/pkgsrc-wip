-- C390A031.AM
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
--      Check that a nonprivate tagged type declared in a package specification
--      may be extended with a private extension in a different package
--      specification, and that this private extension may in turn be extended
--      by a private extension.
--
--      Check that each derivative inherits the user-defined primitive
--      subprograms of its parent (including those that its parent inherited),
--      that it may override these inherited primitive subprograms, and that it
--      may also declare its own primitive subprograms.
--
--      Check that predefined equality operators are defined for the tagged
--      type and its derivatives.
--
--      Check that type conversion is defined from a type extension to its
--      parent, and that this parent itself may be a type extension.
--
-- TEST DESCRIPTION:
--      Declare a root tagged type and two associated primitive subprograms
--      in a package specification (foundation code).
-- 
--      Extend the root type with a private extension in a different package
--      specification. Declare a new primitive subprogram for the extension,
--      and override one of the two inherited subprograms. Within the
--      overriding subprogram, utilize type conversion to call the parent's
--      implementation of the same subprogram. Also within the overriding
--      subprogram, call the new primitive subprogram and each inherited
--      subprogram. Declare operations of the private extension which utilize
--      aggregates and equality operators to verify the correctness of the
--      components.
--      
--      Extend the extension with a private extension in the same package
--      specification. Declare a new primitive subprogram for this second
--      extension, and override one of the three inherited subprograms.
--      Within the overriding subprogram, utilize type conversion to call the
--      parent's implementation of the same subprogram. Also within the
--      overriding subprogram, call the new primitive subprogram and each
--      inherited subprogram. Declare operations of the private extension
--      which override the verification operations of its parent. Within
--      these overriding operations, utilize type conversion to call the
--      parent's implementations of the same operations.
-- 
--      In the main program, declare objects of the two extended types.
--      For each object, call the overriding subprogram, and verify the
--      correctness of the components by calling the verification operations
--      declared in the second package.
-- 
-- TEST FILES:
--      This test consists of the following files:
--
--         F390A00.A
--         C390A030.A
--      => C390A031.AM
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--      04 Jun 96   SAIC    ACVC 2.1: Modified prologue.
--
--!

with Report;

with F390A00;  -- Basic alert abstraction.
with C390A030; -- Extended alert abstraction.

use  F390A00;  -- Primitive operations of Alert_Type directly visible.

procedure C390A031 is
begin

   Report.Test ("C390A03", "Primitive operation inheritance by type " &
                "extensions: all extensions are private and declared " &
                "in same package, but a different package from that " &
                "of root type");


   -- The case for type F390A00.Alert_Type is tested in C390A01.
   -- That subtest is not repeated here.


   LOW_ALERT_SUBTEST: ---------------------------------------------------------

      declare
         Low_Alarm : C390A030.Low_Alert_Type;  -- Priv. ext. of tagged type.
         use C390A030; -- Primitive operations of extension directly visible.
      begin
         if not C390A030.Initial_Values_Okay (Low_Alarm) then
            Report.Failed ("Wrong initial values for Low_Alert_Type");
         end if;

         Handle (Low_Alarm);

         if C390A030.Bad_Final_Values (Low_Alarm) then
            Report.Failed ("Wrong values for Low_Alert_Type after Handle");
         end if;
      end Low_Alert_Subtest;


   -- Check intermediate display counts:

   if F390A00.Display_Count_For /= (Null_Device => 1,
                                    Teletype    => 1,
                                    Console     => 0,
                                    Big_Screen  => 0)
   then
      Report.Failed ("Wrong display counts after Low_Alert");
   end if;


   MEDIUM_ALERT_SUBTEST: ------------------------------------------------------

      declare
         Medium_Alarm : C390A030.Medium_Alert_Type; -- Priv. ext. of extension.
         use C390A030; -- Primitive operations of extension directly visible.
      begin
         if not C390A030.Initial_Values_Okay (Medium_Alarm) then
            Report.Failed ("Wrong initial values for Medium_Alert_Type");
         end if;

         Handle (Medium_Alarm);

         if C390A030.Bad_Final_Values (Medium_Alarm) then
            Report.Failed ("Wrong values for Medium_Alert_Type after Handle");
         end if;
      end Medium_Alert_Subtest;


   -- Check final display counts:

   if F390A00.Display_Count_For /= (Null_Device => 2,
                                    Teletype    => 2,
                                    Console     => 1,
                                    Big_Screen  => 0)
   then
      Report.Failed ("Wrong display counts after Medium_Alert_Type");
   end if;


   Report.Result;

end C390A031;

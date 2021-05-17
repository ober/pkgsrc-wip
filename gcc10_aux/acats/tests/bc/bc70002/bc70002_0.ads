-- BC70002.A
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
--      Check that the actual corresponding to a generic formal package
--      must be an instance of the template for the formal package. Check
--      for the case where the formal package is declared in a library-
--      level generic subprogram.
--
-- TEST DESCRIPTION:
--      The template for a formal package is the generic_package_name
--      in a formal_package_declaration:
--
--      formal_package_declaration ::=
--       with package ID is new generic_package_name formal_package_actual_part
--                              ^^^^^^^^^^^^^^^^^^^^
--                                   template
--
--      Declare a library-level generic subprogram which declares a formal
--      package with (<>) as its actual part. Declare various instances
--      of the template for the formal package and verify that they may
--      be passed as actuals in instantiations of the library-level
--      generic subprogram. Attempt to pass other entities as actuals in
--      instantiations of the library-level subprogram:
--
--         - The template for the formal package.
--         - An instance of a generic package which is identical to the
--           template.
--         - A generic subprogram.
--         - A non-generic package similar to an instance of the template.
--
--      Each of these latter entities are illegal.
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--
--!

generic                                                -- Generic package which
   type Element_Type is private;                       -- serves as template
package BC70002_0 is                                   -- for formal package.
   Object : Element_Type;
end BC70002_0;

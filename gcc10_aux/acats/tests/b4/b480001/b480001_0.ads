-- B480001.A
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
--      Check that if the subtype indication of an uninitialized allocator
--      specifies an access type, no explicit constraint is permitted.
--
-- TEST DESCRIPTION:
--      The test checks that an explicit index or discriminant constraint is
--      illegal in the subtype indication of an uninitialized allocator if the
--      subtype mark is that of an access type.
--
--
-- CHANGE HISTORY:
--      05 Apr 96   SAIC    Prerelease version for ACVC 2.1.
--      03 Aug 96   SAIC    Removed constraint from
--                          Single_Indirect_Access_Person. Added
--                          initialization and parameter cases.
--
--!

package B480001_0 is

   type Unconstrained_Array is array (Integer range <>) of Integer;

   type Direct_Access_Array          is access Unconstrained_Array;
   type Single_Indirect_Access_Array is access Direct_Access_Array;

end B480001_0;

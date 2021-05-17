-- BXC6002.A
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
--     Check that if an atomic object is used as an actual for a generic
--     formal object of mode in out, the type of the generic formal object
--     must be atomic.
--
--     Check that if the prefix of 'Access denotes an atomic object (including
--     a component), the designated type of the resulting access type must be
--     atomic.
--
-- TEST DESCRIPTION:
--     An atomic type is one to which a pragma Atomic applies.
--
--     An atomic object is any of the following:
--
--        (1) An object to which a pragma Atomic applies.
--        (2) A component of an array to which a pragma Atomic_Components
--            applies.
--        (3) An object of a atomic type (i.e., a type to which a pragma
--            Atomic applies).
--
--     This test attempts to use various atomic objects as actuals for
--     generic formal objects of mode in out, and verifies that such usages
--     are illegal if the type of the formal object is not atomic.
--
--     Additionally, the test uses several atomic objects as prefixes of
--     'Access, and verifies that such usages are illegal if the designated
--     type of the expected type of 'Access is not atomic.
--
-- APPLICABILITY CRITERIA:
--      This test is only applicable for implementations validating the
--      Systems Programming Annex.
--
-- PASS/FAIL CRITERIA:
--      An implementation may reject one or more of the pragmas Atomic and
--      Atomic_Components in this test if it cannot support indivisible reads
--      and updates for the specified object or type. If a pragma is rejected,
--      certain ERROR cases (as noted in the body of the test) need not be
--      reported as errors.
--
--
-- CHANGE HISTORY:
--      21 Feb 96   SAIC    Initial version for ACVC 2.1.
--      12 Jun 96   SAIC    Fixed typos. Changed Pass/Fail criterion and
--                          comments following certain error cases. Reworded
--                          comments following pragmas.
--      19 Feb 97   PWB.CTA Changed OK. to ERROR: in non-atomic formal case
--!

package BXC6002_0 is

   type Vowels is ('a', 'e', 'i', 'o', 'u');
   pragma Atomic (Vowels);                                     -- N/A => ERROR.
             -- Implementation must reject this pragma if it does not support
             -- indivisible read/write for Vowels objects.  

   type Array_Of_Vowels is array (1 .. 5) of Vowels;


   type Four_Bits is range 0 .. 15;

   type Acc_Four_Bits is access all Four_Bits;

   type Array_Of_Four_Bits is array (1 .. 2) of aliased Four_Bits;
   pragma Atomic_Components (Array_Of_Four_Bits);              -- N/A => ERROR.
          -- Implementation must reject this pragma if it does not support
          -- indivisible read/write for Four_Bits objects.  

   type Acc_Array is access all Array_Of_Four_Bits;


   type Modular is mod 256;
   for Modular'Size use 8;

   type Acc_Modular is access all Modular;

   type Atomic_Modular is new Modular;
   pragma Atomic (Atomic_Modular);                             -- N/A => ERROR.
     -- Implementation must reject this pragma if it does not support
     -- indivisible read/write for Atomic_Modular objects.  

   type Acc_Atomic_Mod is access all Atomic_Modular;

end BXC6002_0;

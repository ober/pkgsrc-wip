-- BC50002.A
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
--      Check that, for a generic formal derived type, the actual must be
--      in the class rooted at the ancestor subtype. Check for record
--      and tagged types.
--
-- TEST DESCRIPTION:
--      For each type category considered, define a derivation class:
--
--                                    Root
--                                   /    \
--                           <Ancestor>   Sibling
--                               /            \
--                            Child          Nephew
--                            /
--                       Grandchild
--
--      Use Ancestor as the ancestor type of the generic formal derived
--      type. Instantiate the generic for each of the types in the
--      derivation class. Ancestor, Child, and Grandchild are legal as
--      actuals. Root, Sibling, and Nephew are illegal as actuals.
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--
--!

package BC50002_0 is  -- Type definitions.

--
-- Record types:
--

   type State  is (Open, Closed);
   type Device is (Printer, Disk, Drum);

   subtype Storage_Device is Device range Disk .. Drum;


   type Peripheral (Unit: Device) is record          -- "Root" type.
      Status : State;
      case Unit is
         when Printer =>
            Line_Count : Natural;
         when others =>
            Cylinder : Natural;
            Track    : Natural;
      end case;
   end record;

   type Local_Peripheral is new Peripheral;            -- "Ancestor" type

   type Local_Storage (Dev : Storage_Device)           -- "Child" type.
     is new Local_Peripheral (Unit => Dev);

   type Local_Disk is new Local_Storage(Disk);         -- "Grandchild" type.
     

   type Remote_Peripheral is new Peripheral;           -- "Sibling" type.

   type Remote_Output is new                           -- "Nephew" type.
     Remote_Peripheral(Printer);

--
-- Tagged types:
--

   type Expression is tagged null record;              -- "Root" type.

   type Expr_Ptr is access all Expression'Class;

   type Operation is new Expression with null record;  -- "Ancestor" type.

   type Binary_Operation is new Operation with record  -- "Child" type.
      Left, Right : Expr_Ptr;
   end record;

   type Addition is new Binary_Operation               -- "Grandchild" type.
     with null record;                      


   type Literal is new Expression with null record;    -- "Sibling" type.

   type Numeric_Literal is new Literal with record     -- "Nephew" type.
      Value : Float;
   end record;

end BC50002_0;

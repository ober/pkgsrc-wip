-- B641003.A
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
--     Check that, for an out parameter of a scalar type with a specified
--     Default_Value, it is illegal to pass a type conversion of an object
--     unless the type of the object is related and has a specified
--     Default_Value.
--
-- TEST DESCRIPTION:
--     The 2016 Corrigendum added 6.4.1(5.1/4) to make illegal circumstances
--     where the value to pass into an out parameter is not well defined.
--     For scalar types, that rule was:
--
--       If the mode is out, the actual parameter is a view conversion, and
--       the type of the formal parameter is a scalar type that has the 
--       Default_Value aspect specified, then 
--       [A] there shall exist a type (other than a root numeric type) that is
--           an ancestor of both the target type and the operand type; and
--       [B} the type of the operand of the conversion shall have the
--           Default_Value aspect specified.

--     That rule proved to not be strong enough and it was changed by
--     Ada 202x to:
--
--       If the mode is out, the actual parameter is a view conversion, and
--       the type of the formal parameter is a scalar type, then 
--       [C] the target and operand type both do not have the Default_Value
--           aspect specified; or
--       [D] the target and operand type both shall have the Default_Value
--           aspect specified, and there shall exist a type (other than a root 
--           numeric type) that is an ancestor of both the target type and the
--           operand type. 
--
--     (Note: Case [D] is the combination of cases [A] and [B].)
--
--     We only test the Ada 2012 plus TC1 rule here; test cases where the
--     results of the rules would differ (those where the parameter type 
--     does not have Default_Value specified) are commented out.
    
-- CHANGE HISTORY:
--     30 Mar 21   RLB     Created test for RRS, donated to ACATS.
--
--!
package B641003_0 is

   Unused : constant := -16#6789#;
   type Small_Integer is range -16#8000#..16#7FFF#
      with Default_Value => Unused;
      
   type Word_16 is mod 2**16
      with Default_Value => 16#DEAD#;

   type Also_Word is mod 2**16;
   
   Flt_Value : constant := -2.25;

   type Small_Float is digits 3
      with Default_Value => Flt_Value;

   type Also_Float is digits 4;
    
   Fix_Value : constant := 3.75;

   type Small_Fixed is delta 0.125 range -4.0 .. 4.0
      with Small => 0.125, Default_Value => Fix_Value;
    
   type Also_Fixed is delta 0.25 range -4.0 .. 4.0
      with Small => 0.25;
    
end B641003_0;

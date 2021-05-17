-- B392009.A
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
--      Check that a subprogram call through a dereference of an access-to-
--      subprogram value is not considered a call on a dispatching operation;
--      therefore, the actual parameter in such a subprogram call may not be
--      dynamically tagged. Check that a designated profile of an
--      access-to-subprogram type which contains parameters of a tagged type
--      does not introduce a primitive operation of the tagged type.
--
-- TEST DESCRIPTION:
--      The designated profile of an access-to-subprogram type may contain
--      parameters of a tagged type. However, the subprogram designated by
--      a given access-to-subprogram value may or may not be a dispatching
--      operation of the tagged type. The actual parameter in a subprogram
--      call which is a dereference of such an access-to-subprogram value
--      must not be dynamically tagged unless the subprogram is a dispatching
--      operation -- this is a compile-time check. But it is not determinable
--      at compile time whether any given access-to-subprogram value designates
--      a dispatching or non-dispatching operation. Therefore all calls to
--      such an access-to-subprogram value involving dynamically tagged
--      operands must be disallowed.
--
--      Furthermore, although the subprogram designated by an
--      access-to-subprogram value may be a dispatching operation, calls
--      made through the access-to-subprogram value do not dispatch; i.e.,
--      the actual parameter to the call must be of the tagged type in the
--      designated profile, and may not be any other descendant of that tagged
--      type.
--
--      A subprogram (procedure or function) of the tagged type is called
--      through an access-to-subprogram value with various actuals which are
--      dynamically tagged (formal parameter, class-wide object, type
--      conversion to a class-wide type, dynamically tagged function call,
--      dereference of an access-to-class-wide value), and with actuals of
--      specific tagged types in the class.
--
--      Cases of access-to-subprogram types with designated profiles containing
--      access parameters are also checked; actuals are of access types
--      designating objects of specific tagged types in the class, as well
--      as the class-wide type of the root type of the class.
--
--
-- CHANGE HISTORY:
--      06 Dec 94   SAIC    ACVC 2.0
--      07 Sep 07   RLB     Corrected for Amendment changes: made null
--                          exclusions explicit so that the
--                          access-to-subprogram type match the subprograms.
--
--!

package B392009_0 is

   type Root is tagged record                    -- Root type of class.
      Component : Boolean := False;
   end record;

   function Dyn_Tag_Func (A: Root)               -- Function with
     return Root;                                -- controlling result.

   procedure Proc (A: in Root);                  -- Dispatching operation.
   function Func (A: Root) return Root;          -- Dispatching operation.

   function Access_Parm_Func (A: not null access Root)
     return Root;                                -- Dispatching operation.

   procedure Access_Parm_Proc
     (A: access Root'Class);                     -- Class-wide operation.



   type Child is new Root with record
      New_Field : String (1 .. 10) := (others => ' ');
   end record;

   function Dyn_Tag_Func (A: Child)              -- Function with
     return Child;                               -- controlling result.

   procedure Proc (A: in Child);                 -- Dispatching operation
                                                 -- (overrides parent's Proc).

   function Func (A: Child) return Child;        -- Dispatching operation.
                                                 -- (overrides parent's Func).

   function Access_Parm_Func (A: not null access Child)
     return Child;                               -- Dispatching operation.
                                                 -- (overrides parent's).

end B392009_0;

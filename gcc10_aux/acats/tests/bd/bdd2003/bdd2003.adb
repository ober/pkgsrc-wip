
   --======================================================================--

with Ada.Streams.Stream_IO;
with BDD2003_0;

procedure BDD2003 is

   type Non_Limited_Type is range 1 .. 10;
   type Acc_Non_Limited_Type is access Non_Limited_Type;

   task type Task_Type is
      entry The_Entry;
   end Task_Type;

   task body Task_Type is
   begin
      accept The_Entry;
   end Task_Type;

   type Derived_Limited_Type is new BDD2003_0.Limited_Type;

   type Non_Lim_Comp_Type is
      record
         Non_Limited_Component_Field : Integer := 0;
      end record;

   type Comp_With_Lim_Type is
      record
         Limited_Component_Field : BDD2003_0.Limited_Type;
      end record;

   type Comp_With_Der_Lim_Type is
      record
         Derived_Limited_Component_Field : Derived_Limited_Type;
      end record;

   type Comp_With_Acc_Disc (Disc : access Non_Limited_Type) is limited
      record
         Non_Lim_Field : Non_Limited_Type;
      end record;

   type Composite_With_Task_Type is
      record
         Task_Component_Field : Task_Type;
      end record;

   protected type Protected_Type is
         entry Obtain;
         procedure Return_Result;
      private
         In_Use : Boolean := False;
      end Protected_Type;

   protected body Protected_Type is
      entry Obtain when not In_Use is
      begin
         In_Use := True;
      end Obtain;

      procedure Return_Result is
      begin
         In_Use := False;
      end Return_Result;
   end Protected_Type;


   Limited_Object          : BDD2003_0.Limited_Type;
   Root_Object             : BDD2003_0.Root_Type;
   Extended_Object         : BDD2003_0.Extended_Type;
   Root_With_LComp_Object  : BDD2003_0.Root_With_Limited_Comp_Type;
   Ext_With_LComp_Object   : BDD2003_0.Extended_With_Limited_Comp_Type;

   Acc                     : aliased Non_Limited_Type;
   Non_Limited_Object      : Non_Limited_Type;
   Task_Object             : Task_Type;
   Derived_Limited_Object  : Derived_Limited_Type;
   Non_Lim_Comp_Object     : Non_Lim_Comp_Type;
   Composite_Object1       : Comp_With_Lim_Type;
   Composite_Object2       : Comp_With_Der_Lim_Type;
   Composite_Object3       : Composite_With_Task_Type;
   Composite_Object4       : Comp_With_Acc_Disc(Acc'Access);
   A_Protected_Object      : Protected_Type;

   Stream_File_Object      : Ada.Streams.Stream_IO.File_Type;
   Str_Access              : Ada.Streams.Stream_IO.Stream_Access;

begin

   Ada.Streams.Stream_IO.Create (Stream_File_Object,
                                 Ada.Streams.Stream_IO.Out_File,
                                 "AFile");

   Str_Access := Ada.Streams.Stream_IO.Stream (Stream_File_Object);



   -- Ensure that an attempt at writing to a stream using the 'Write
   -- attribute for a task type, limited type, or composite type containing
   -- a limited type is rejected.

   Non_Limited_Type'Write (Str_Access, Non_Limited_Object);  -- OK. {4;1}

   Task_Type'Write (Str_Access,  Task_Object);               -- ERROR: {4;1}
                                                  -- Task_Type is limited.

   BDD2003_0.Limited_Type'Write (Str_Access, Limited_Object);-- ERROR: {4;1}
                                                  -- Limited_Type is limited.

   Derived_Limited_Type'Write
     (Str_Access, Derived_Limited_Object);                   -- ERROR: {1:4;1}
                                                  -- Derived_Limited _Type is
                                                  -- limited.

   Non_Lim_Comp_Type'Write (Str_Access, Non_Lim_Comp_Object); -- OK. {4;1}

   Comp_With_Lim_Type'Write (Str_Access, Composite_Object1); -- ERROR: {4;1}
                                                  -- Type contains a component
                                                  -- of a limited type.

   Comp_With_Der_Lim_Type'Write (Str_Access, Composite_Object2);-- ERROR: {4;1}
                                                  -- Type contains a component
                                                  -- of a type derived from a
                                                  -- limited type.

   Composite_With_Task_Type'Write
     (Str_Access, Composite_Object3);                        -- ERROR: {1:4;1}
                                                  -- Type contains a component
                                                  -- of a task type.

   Comp_With_Acc_Disc'Write (Str_Access, Composite_Object4); -- ERROR: {4;1}
                                                  -- Attr. ref is illegal if
                                                  -- type is limited.

   Protected_Type'Write (Str_Access, A_Protected_Object);    -- ERROR: {4;1}
                                                  -- Protected_Type is limited.

   BDD2003_0.Limited_Type'Write (Str_Access, Limited_Object);-- ERROR: {4;1}
                                                  -- Limited_Type is limited.

   BDD2003_0.Root_Type'Write (Str_Access, Root_Object);      -- ERROR: {4;1}
                                                  -- Root_Type is limited.

   BDD2003_0.Extended_Type'Write (Str_Access, Extended_Object);-- ERROR: {4;1}
                                                  -- Extended_Type is limited.

   BDD2003_0.Root_With_Limited_Comp_Type'Write
     (Str_Access, Root_With_LComp_Object);                   -- ERROR: {1:4;1}
                                                  -- Type is extended with
                                                  -- limited component.

   BDD2003_0.Extended_With_Limited_Comp_Type'Write
     (Str_Access, Ext_With_LComp_Object);                    -- ERROR: {1:4;1}
                                                  -- Type is extended with
                                                  -- limited component.




   -- Ensure that an attempt at reading from a stream using the 'Read
   -- attribute for a task type, limited type, or composite type containing
   -- a limited type is rejected.

   Non_Limited_Type'Read (Str_Access, Non_Limited_Object);   -- OK. {4;1}

   Task_Type'Read (Str_Access,  Task_Object);                -- ERROR: {4;1}
                                                  -- Task_Type is limited.

   BDD2003_0.Limited_Type'Read (Str_Access, Limited_Object); -- ERROR: {4;1}
                                                  -- Limited_Type is limited.

   Derived_Limited_Type'Read
     (Str_Access, Derived_Limited_Object);                   -- ERROR:{1:4;1}
                                                  -- Derived_Limited_Type
                                                  -- is limited.

   Non_Lim_Comp_Type'Read (Str_Access, Non_Lim_Comp_Object); -- OK. {4;1}

   Comp_With_Lim_Type'Read (Str_Access, Composite_Object1);  -- ERROR: {4;1}
                                                  -- Type contains a component
                                                  -- of a limited type.

   Comp_With_Der_Lim_Type'Read (Str_Access, Composite_Object2); -- ERROR: {4;1}
                                                  -- Type contains a component
                                                  -- of a type derived from
                                                  -- a limited type.

   Composite_With_Task_Type'Read (Str_Access, Composite_Object3);-- ERROR:{4;1}
                                                  -- Type contains a component
                                                  -- of a task type.

   Comp_With_Acc_Disc'Read (Str_Access, Composite_Object4);  -- ERROR: {4;1}
                                                  -- Attr. ref is illegal if
                                                  -- type is limited.

   Protected_Type'Read (Str_Access, A_Protected_Object);     -- ERROR: {4;1}
                                                  -- Protected_Type is limited.


   BDD2003_0.Limited_Type'Read (Str_Access, Limited_Object); -- ERROR: {4;1}
                                                  -- Limited_Type is limited.

   BDD2003_0.Root_Type'Read (Str_Access, Root_Object);       -- ERROR: {4;1}
                                                  -- Root_Type is limited.

   BDD2003_0.Extended_Type'Read (Str_Access, Extended_Object); -- ERROR: {4;1}
                                                  -- Extended_Type is limited.

   BDD2003_0.Root_With_Limited_Comp_Type'Read
     (Str_Access, Root_With_LComp_Object);                   -- ERROR: {1:4;1}
                                                  -- Type is extended with
                                                  -- limited component.

   BDD2003_0.Extended_With_Limited_Comp_Type'Read
     (Str_Access, Ext_With_LComp_Object);                    -- ERROR: {1:4;1}
                                                  -- Type is extended with
                                                  -- limited component.

   declare

      package Attribute_Definitions is

         type Tagged_Limited_Type is tagged limited
           record
              Str : String(1..4) := "abcd";
         end record;

         -- User defined subprograms will provide the type-related attributes
         -- for 'Read and 'Write.

         procedure Root_Read
           (Stream : access Ada.Streams.Root_Stream_Type'Class;
            Item   : out    Tagged_Limited_Type);

         procedure Root_Write
           (Stream : access Ada.Streams.Root_Stream_Type'Class;
            Item   : Tagged_Limited_Type);

         -- Attribute definition clauses.

         for Tagged_Limited_Type'Read  use Root_Read;
         for Tagged_Limited_Type'Write use Root_Write;

         New_Limited_Object : Tagged_Limited_Type;

      end Attribute_Definitions;

      package body Attribute_Definitions is

         -- Subprogram bodies.

         procedure Root_Read
           (Stream : access Ada.Streams.Root_Stream_Type'Class;
            Item   : out    Tagged_Limited_Type) is
         begin
            Non_Limited_Object := Non_Limited_Type'First;   -- Dummy body.
         end Root_Read;

         procedure Root_Write
           (Stream : access Ada.Streams.Root_Stream_Type'Class;
            Item   : Tagged_Limited_Type) is
         begin
            Non_Limited_Object := Non_Limited_Type'Last;    -- Dummy body.
         end Root_Write;

      end Attribute_Definitions;

      use Attribute_Definitions;

   begin

      -- Since the attributes 'Read and 'Write have been specified by
      -- attribute_definition_clauses, an attribute reference to the 'Read
      -- or 'Write attributes is legal.

      Tagged_Limited_Type'Read  (Str_Access, New_Limited_Object);  -- OK. {7;1}
      Tagged_Limited_Type'Write (Str_Access, New_Limited_Object);  -- OK. {7;1}

   end;

end BDD2003;

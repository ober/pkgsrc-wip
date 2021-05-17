

with Ada.Text_IO;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded;
with Ada.Calendar;
with Ada.Calendar.Arithmetic, Ada.Calendar.Formatting;
package body Grading_Data is

   STRICT_CHECKS : constant Boolean := True;
      -- Make extra checks on the contents of the files.

   NO_TIME : constant Ada.Calendar.Time :=
      Ada.Calendar.Time_Of (Year => 1901, Month => 1, Day => 1,
                            Seconds => 0.0);

   procedure Put_Event_Line (Event : Event_Count) is
      -- Write a line containing the event information for the given
      use type Trace.Event_Type; -- For "=".
      -- event index.
   begin
      if Event = 0 then
         Ada.Text_IO.Put_Line ("Null Event");
      else
         Ada.Text_IO.Put ("Event " & Grading_Data.Event_Count'Image (Event));
         case Event_Trace(Event).Event is
            when Trace.Unknown =>
               Ada.Text_IO.Put ("; Kind=UNKNOWN; ");
            when Trace.Compilation_Start =>
               Ada.Text_IO.Put ("; Kind=C_Start; ");
            when Trace.Compilation_End =>
               Ada.Text_IO.Put ("; Kind=C_End;   ");
            when Trace.Compile_Error =>
               Ada.Text_IO.Put ("; Kind=C_Err;   ");
            when Trace.Compile_Warning =>
               Ada.Text_IO.Put ("; Kind=C_Warn;  ");
            when Trace.Binder_Start =>
               Ada.Text_IO.Put ("; Kind=B_Start; ");
            when Trace.Binder_End =>
               Ada.Text_IO.Put ("; Kind=B_End;   ");
            when Trace.Binder_Error =>
               Ada.Text_IO.Put ("; Kind=B_Err;   ");
            when Trace.Binder_Warning =>
               Ada.Text_IO.Put ("; Kind=B_Warn;  ");
            when Trace.Execution_Start =>
               Ada.Text_IO.Put ("; Kind=Ex_Start;");
            when Trace.Execution_End =>
               Ada.Text_IO.Put ("; Kind=Ex_End;  ");
            when Trace.Execution_Failure =>
               Ada.Text_IO.Put ("; Kind=Ex_Fail; ");
            when Trace.Execution_Not_Applicable =>
               Ada.Text_IO.Put ("; Kind=Ex_NA;   ");
            when Trace.Execution_Special_Action =>
               Ada.Text_IO.Put ("; Kind=Ex_S_Act;");
         end case;
         Ada.Text_IO.Put ("Time=" &
            Ada.Calendar.Formatting.Image(Event_Trace(Event).Timestamp));
         Ada.Text_IO.Put ("; Name=" & Event_Trace(Event).Name);
         Ada.Text_IO.New_Line;
         if Event_Trace(Event).Event = Trace.Compilation_Start then
            Ada.Text_IO.Put ("    Line=" &
               Trace.Line_Number_Type'Image (Event_Trace(Event).Start_Line));
         elsif Event_Trace(Event).Event = Trace.Compile_Error or else
               Event_Trace(Event).Event = Trace.Compile_Warning then
            Ada.Text_IO.Put ("    Line=" &
               Trace.Line_Number_Type'Image (Event_Trace(Event).Error_Line));
            Ada.Text_IO.Put ("; Pos=" &
               Trace.Line_Position_Type'Image (
                  Event_Trace(Event).Error_Position));
         else --Nothing else.
             Ada.Text_IO.Put ("   ");
         end if;
         if Ada.Strings.Unbounded.Length (Event_Trace(Event).Message) /= 0 then
            Ada.Text_IO.Put ("; Mess=" &
               Ada.Strings.Unbounded.To_String (Event_Trace(Event).Message));
         end if;
         Ada.Text_IO.New_Line;
      end if;
   end Put_Event_Line;


   procedure Put_Summary_Item_Line (Item : Summary_Item_Count) is
      -- Write a line containing the summary item information for the given
      -- summary item index.
      use type Test_Summary.Info_Kind_Type; -- For "=".
   begin
      if Item = 0 then
         Ada.Text_IO.Put_Line ("Null Item");
      else
         Ada.Text_IO.Put ("Item " &
            Grading_Data.Summary_Item_Count'Image (Item));
         case Summary_of_Tests(Item).Kind is
            when Test_Summary.Unknown =>
               Ada.Text_IO.Put ("; Kind=UNKNOWN;   ");
            when Test_Summary.Compilation_Unit =>
               Ada.Text_IO.Put ("; Kind=Comp_Unit; ");
            when Test_Summary.Error =>
               Ada.Text_IO.Put ("; Kind=Error;     ");
            when Test_Summary.Possible_Error =>
               Ada.Text_IO.Put ("; Kind=Pos_Error; ");
            when Test_Summary.Optional_Error =>
               Ada.Text_IO.Put ("; Kind=Opt_Error; ");
            when Test_Summary.NA_Error =>
               Ada.Text_IO.Put ("; Kind=NA_Error;  ");
            when Test_Summary.Annex_C_Requirement =>
               Ada.Text_IO.Put ("; Kind=AnxCRqmnt; ");
            when Test_Summary.OK =>
               Ada.Text_IO.Put ("; Kind=OK;        ");
         end case;
         Ada.Text_IO.Put ("Src Name=" & Summary_of_Tests(Item).Source_Name);
         Ada.Text_IO.New_Line;
         Ada.Text_IO.Put ("   Start Line=" &
            Trace.Line_Number_Type'Image (Summary_of_Tests(Item).Start_Line));
         Ada.Text_IO.Put (":" &
            Trace.Line_Position_Type'Image (
               Summary_of_Tests(Item).Start_Position));
         Ada.Text_IO.Put ("; End Line=" &
            Trace.Line_Number_Type'Image (Summary_of_Tests(Item).End_Line));
         Ada.Text_IO.Put (":" &
            Trace.Line_Position_Type'Image (
               Summary_of_Tests(Item).End_Position));
         if Summary_of_Tests(Item).Kind = Test_Summary.Possible_Error then
             Ada.Text_IO.Put ("; Label=" & Ada.Strings.Fixed.Trim (
                        Summary_of_Tests(Item).Set_Label, Ada.Strings.Right));
         elsif Summary_of_Tests(Item).Kind = Test_Summary.Compilation_Unit then
             Ada.Text_IO.New_Line;
             case Summary_of_Tests(Item).Unit_Kind is
                when Test_Summary.Package_Specification =>
                   Ada.Text_IO.Put ("   Unit=Package Spec; ");
                when Test_Summary.Package_Body =>
                   Ada.Text_IO.Put ("   Unit=Package Body; ");
                when Test_Summary.Generic_Package =>
                   Ada.Text_IO.Put ("   Unit=Generic Pack; ");
                when Test_Summary.Procedure_Specification =>
                   Ada.Text_IO.Put ("   Unit=Proc Spec;    ");
                when Test_Summary.Procedure_Body =>
                   Ada.Text_IO.Put ("   Unit=Proc Body;    ");
                when Test_Summary.Generic_Procedure =>
                   Ada.Text_IO.Put ("   Unit=Generic Proc; ");
                when Test_Summary.Function_Specification =>
                   Ada.Text_IO.Put ("   Unit=Function Spec;");
                when Test_Summary.Function_Body =>
                   Ada.Text_IO.Put ("   Unit=Function Body;");
                when Test_Summary.Generic_Function =>
                   Ada.Text_IO.Put ("   Unit=Generic Func; ");
                when Test_Summary.Package_Instantiation =>
                   Ada.Text_IO.Put ("   Unit=Package Inst; ");
                when Test_Summary.Procedure_Instantiation =>
                   Ada.Text_IO.Put ("   Unit=Proc Inst;    ");
                when Test_Summary.Function_Instantiation =>
                   Ada.Text_IO.Put ("   Unit=Function Inst;");
                when Test_Summary.Package_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Package Ren;  ");
                when Test_Summary.Procedure_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Proc Ren;     ");
                when Test_Summary.Function_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Function Ren; ");
                when Test_Summary.Generic_Package_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Gen Pack Ren; ");
                when Test_Summary.Generic_Procedure_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Gen Proc Ren; ");
                when Test_Summary.Generic_Function_Renaming =>
                   Ada.Text_IO.Put ("   Unit=Gen Func Ren; ");
                when Test_Summary.Package_Subunit =>
                   Ada.Text_IO.Put ("   Unit=Pack Subunit; ");
                when Test_Summary.Procedure_Subunit =>
                   Ada.Text_IO.Put ("   Unit=Proc Subunit; ");
                when Test_Summary.Function_Subunit =>
                   Ada.Text_IO.Put ("   Unit=Func Subunit; ");
                when Test_Summary.Task_Subunit =>
                   Ada.Text_IO.Put ("   Unit=Task Subunit; ");
                when Test_Summary.Protected_Subunit =>
                   Ada.Text_IO.Put ("   Unit=Prot Subunit; ");
                when Test_Summary.Configuration_Pragma =>
                   Ada.Text_IO.Put ("   Unit=Pragma;       ");
             end case;
             if Summary_of_Tests(Item).Is_Main then
                 Ada.Text_IO.Put ("Is_Main!; ");
             end if;
             if Summary_of_Tests(Item).Optional then
                 Ada.Text_IO.Put ("Optional!; ");
             end if;
             Ada.Text_IO.Put ("Unit_Name=" & Ada.Strings.Fixed.Trim (
                        Summary_of_Tests(Item).Unit_Name, Ada.Strings.Right));
         -- else no other components.
         end if;
         Ada.Text_IO.New_Line;
      end if;
   end Put_Summary_Item_Line;


   procedure Get_Item (Buffer     : in     String;
                       Item_Start :    out Natural;
                       Item_End   :    out Natural;
                       Next_Item  :    out Natural;
                       Is_Last    : in     Boolean := False) is
      -- Extract the next item from the Buffer. The Buffer starts at the
      -- beginning of the item to get, and ends at the end of the significant
      -- characters. (That means its a slice.) If Is_Last is True, the
      -- item is the last one and it is not followed by a comma. Otherwise,
      -- the item is followed by a comma. Upon return, Next_Item is set
      -- to the first character of the next item (Buffer'Last+1 if
      -- Is_Last = True). Item_Start and Item_End bound the item; any quoting
      -- is not included in the text returned by these items.
      --
      -- An item ends at the next comma, unless it is quoted, in which case
      -- it ends at the comma that immediately follows the closing quote.
      --
      -- If the format is bad somehow (for instance the closing quote isn't
      -- immediately at the end or comma), then Format_Error is raised with
      -- an appropriate message.
      Loc : Natural;
   begin
      if Is_Last then
         if Buffer'Length = 0 then
            Item_Start := Buffer'Last + 1;
            Item_End   := Buffer'Last;
            Next_Item  := Buffer'Last + 1;
         elsif Buffer(Buffer'First) /= '"' then
            -- Not quoted. Check for embedded commas:
            Loc := Ada.Strings.Fixed.Index (Buffer, ",");
            if Loc /= 0 then
               -- A comma in the last item. No good.
               raise Format_Error with "comma in last item - " & Buffer;
            -- else OK.
            end if;
            -- Also check for embedded quotes:
            Loc := Ada.Strings.Fixed.Index (Buffer, """");
            if Loc /= 0 then
               -- A quote in the middle of the last item. No good.
               raise Format_Error with "embedded quote in last item - " &
                  Buffer;
            -- else OK.
            end if;
            -- Return the contents to the end:
            Item_Start := Buffer'First;
            Item_End   := Buffer'Last;
            Next_Item  := Buffer'Last + 1;
         else
            -- Find the ending quote:
            Loc := Ada.Strings.Fixed.Index (
                     Buffer(Buffer'First+1..Buffer'Last), """");
            if Loc = 0 then
               -- Missing ending quote. No good.
               raise Format_Error with "last item missing closing quote - " &
                                                                Buffer;
            elsif Loc = Buffer'Last then -- Great
               Item_Start := Buffer'First + 1;
               Item_End   := Buffer'Last - 1;
               Next_Item  := Buffer'Last + 1;
            elsif Buffer(Buffer'Last) = '"' then
               -- An extra quote in the middle.
               raise Format_Error with "quote in middle of quoted text - " &
                                                                Buffer;

            end if;
         end if;
      else -- Not the last item.
         if Buffer'Length = 0 then
            -- Non-last item is missing.
            raise Format_Error with "non-last item missing trailing comma - " &
                                                                Buffer;
         elsif Buffer(Buffer'First) = ',' then
            -- Item is empty:
            Item_Start := Buffer'First + 1;
            Item_End   := Buffer'First;
            Next_Item  := Buffer'First + 1;
         elsif Buffer(Buffer'First) = '"' then
            -- Item is quoted:
            -- Find the ending quote:
            Loc := Ada.Strings.Fixed.Index (
                     Buffer(Buffer'First+1..Buffer'Last), """");
            if Loc = 0 then
               -- Missing ending quote. No good.
               raise Format_Error with "non-last item missing closing quote - "
                                                         & Buffer;
            elsif Loc < Buffer'Last and then Buffer(Loc+1) = ',' then
               -- Immediately trailing comma, great.
               Item_Start := Buffer'First + 1;
               Item_End   := Loc - 1;
               Next_Item  := Loc + 2;
            else
               -- Close quote isn't the last part of part of the item. No good.
               raise Format_Error with "close quote does not end non-last " &
                  "item - " & Buffer;
            end if;
         else -- Item is not quoted.
            Loc := Ada.Strings.Fixed.Index (Buffer, ",");
            Item_Start := Buffer'First;
            Item_End   := Loc - 1;
            Next_Item  := Loc + 1;
            -- Check for embedded quotes:
            Loc := Ada.Strings.Fixed.Index (
                                     Buffer(Item_Start .. Item_End), """");
            if Loc /= 0 then
               -- A quote in the middle of the last item. No good.
               raise Format_Error with "embedded quote in non-last item - " &
                  Buffer;
            -- else OK.
            end if;
         end if;
      end if;
   end Get_Item;


   procedure Read_Event_Trace (Trace_File_Name : in String) is
      -- Read the event trace from the file named Trace_File_Name, putting
      -- the result into Event_Trace, with Last_Event set to the last event
      -- in the data.
      -- Propagates any I/O exceptions, as well as Format_Error if the
      -- data is malformatted.
      File : Ada.Text_IO.File_Type;
      Buffer : String(1..512);
      Last : Natural;
      Item_Start, Item_End, Next_Item : Natural;
      Working_Record : Trace.Event_Record;
      use type Trace.Event_Type; -- For "=".
   begin
      Ada.Text_IO.Open (File, Ada.Text_IO.In_File, Trace_File_Name);
      loop
         Ada.Text_IO.Get_Line (File, Buffer, Last);
         if Last = Buffer'Last then
            raise Format_Error with "Excessively long line at record" &
               Event_Count'Image(Last_Event);
         end if;
         if Last < Buffer'First then
            -- Empty line; skip it.
            goto Next_Line;
         -- else not empty.
         end if;

         -- Event field:
         Get_Item (Buffer(1..Last), Item_Start, Item_End, Next_Item);
         declare
            Upper_Event : constant String :=
               Ada.Strings.Fixed.Translate (Buffer(Item_Start..Item_End),
                  Ada.Strings.Maps.Constants.Upper_Case_Map);
         begin
            if Upper_Event = "EVENT" then
               -- A file header.
               goto Next_Line;
            -- Otherwise, set up a record with the correct discriminant.
            elsif Upper_Event = "UNKN" then
               Working_Record := (Event     => Trace.Unknown,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "CSTART" then
               Working_Record := (Event     => Trace.Compilation_Start,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "CEND" then
               Working_Record := (Event     => Trace.Compilation_End,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "CERR" then
               Working_Record := (Event     => Trace.Compile_Error,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "CWARN" then
               Working_Record := (Event     => Trace.Compile_Warning,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "BSTART" then
               Working_Record := (Event     => Trace.Binder_Start,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "BEND" then
               Working_Record := (Event     => Trace.Binder_End,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "BERR" then
               Working_Record := (Event     => Trace.Binder_Error,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "BWARN" then
               Working_Record := (Event     => Trace.Binder_Warning,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "EXSTART" then
               Working_Record := (Event     => Trace.Execution_Start,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "EXEND" then
               Working_Record := (Event     => Trace.Execution_End,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "EXFAIL" then
               Working_Record := (Event     => Trace.Execution_Failure,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "EXNA" then
               Working_Record := (Event     => Trace.Execution_Not_Applicable,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            elsif Upper_Event = "EXSACT" then
               Working_Record := (Event     => Trace.Execution_Special_Action,
                                  Timestamp => NO_TIME,
                                  others    => <>);
            else
               raise Format_Error with "Unknown event kind " & Upper_Event &
                  " - record" & Event_Count'Image(Last_Event);
            end if;
         end;

         -- Timestamp field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         begin
            Working_Record.Timestamp :=
               Ada.Calendar.Formatting.Value (Buffer(Item_Start..Item_End));
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad timestamp " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Event_Count'Image(Last_Event);
         end;

         -- Name field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         begin
            Ada.Strings.Fixed.Move (
               Target => Working_Record.Name,
               Source => Ada.Strings.Fixed.Translate (
                  Buffer(Item_Start..Item_End),
                  Ada.Strings.Maps.Constants.Upper_Case_Map));
            -- We force this name to UPPER case so we can compare it without
            -- any casing issues. Even file names are effectively case
            -- insensitive (they are chosen that way, the file system doesn't
            -- matter).
         exception
            when Ada.Strings.Length_Error =>
               raise Format_Error with "Name value too long " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Event_Count'Image(Last_Event);
         end;

         -- Line field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Line : Trace.Line_Number_Type;
         begin
            if Item_End < Item_Start then
               Line := 0;
            else
               Line := Trace.Line_Number_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            if Working_Record.Event = Trace.Compilation_Start then
               Working_Record.Start_Line := Line;
            elsif Working_Record.Event = Trace.Compile_Error then
               Working_Record.Error_Line := Line;
            elsif Working_Record.Event = Trace.Compile_Warning then
               Working_Record.Error_Line := Line;
            else -- not used.
               if Strict_Checks and then Line /= 0 then
                  raise Format_Error with "Line value given for wrong kind of "
                     & "event " & Buffer(Item_Start..Item_End) &
                     " - record" & Event_Count'Image(Last_Event);
               end if;
            end if;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad Line value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Event_Count'Image(Last_Event);
         end;

         -- Position field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Position : Trace.Line_Position_Type;
         begin
            if Item_End < Item_Start then
               Position := 0;
            else
               Position := Trace.Line_Position_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            if Working_Record.Event = Trace.Compile_Error then
               Working_Record.Error_Position := Position;
            elsif Working_Record.Event = Trace.Compile_Warning then
               Working_Record.Error_Position := Position;
            else -- not used.
               if Strict_Checks and then Position not in 0 .. 1 then
                  raise Format_Error with "Position value given for wrong " &
                     "kind of event " & Buffer(Item_Start..Item_End) &
                     " - record" & Event_Count'Image(Last_Event);
               end if;
            end if;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad Position value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Event_Count'Image(Last_Event);
         end;

         -- Message field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End,
                   Next_Item, Is_Last => True);
         Working_Record.Message :=
            Ada.Strings.Unbounded.To_Unbounded_String (
               Buffer(Item_Start..Item_End));

         -- Insert the record:
         Last_Event := Last_Event + 1;
         Event_Trace(Last_Event) := Working_Record;

         <<Next_Line>> null;
      end loop;
   exception
      when Ada.Text_IO.End_Error =>
         -- Reached the end of the file (normal condition).
         Ada.Text_IO.Close (File);
      -- when others => -- Propagate other exceptions.
   end Read_Event_Trace;


   procedure Read_Summary_of_Tests (Summary_Item_Name : in String) is
      -- Read the summary of tests to grade from the file named
      -- Summary_Item_Name, putting the result into Summary_of_Tests, with
      -- Last_Summary_Item set to the last summary item in the data.
      -- Propagates any I/O exceptions, as well as Format_Error if the
      -- data is malformatted.
      File : Ada.Text_IO.File_Type;
      Buffer : String(1..512);
      Last : Natural;
      Item_Start, Item_End, Next_Item : Natural;
      Working_Record : Test_Summary.Info_Record;
      use type Test_Summary.Info_Kind_Type; -- For "=".
   begin
      Ada.Text_IO.Open (File, Ada.Text_IO.In_File, Summary_Item_Name);
      loop
         Ada.Text_IO.Get_Line (File, Buffer, Last);
         if Last = Buffer'Last then
            raise Format_Error with "Excessively long line at record" &
               Summary_Item_Count'Image(Last_Summary_Item);
         end if;
         if Last < Buffer'First then
            -- Empty line; skip it.
            goto Next_Line;
         -- else not empty.
         end if;


         -- Kind field:
         Get_Item (Buffer(1..Last), Item_Start, Item_End, Next_Item);
         declare
            Upper_Kind : constant String :=
               Ada.Strings.Fixed.Translate (Buffer(Item_Start..Item_End),
                  Ada.Strings.Maps.Constants.Upper_Case_Map);
         begin
            if Upper_Kind = "KIND" then
               -- A file header.
               goto Next_Line;
            -- Otherwise, set up a record with the correct discriminant.
            elsif Upper_Kind = "UNKN" then
               Working_Record := (Kind      => Test_Summary.Unknown,
                                  others    => <>);
            elsif Upper_Kind = "ERROR" then
               Working_Record := (Kind      => Test_Summary.Error,
                                  others    => <>);
            elsif Upper_Kind = "OERROR" then
               Working_Record := (Kind      => Test_Summary.Optional_Error,
                                  others    => <>);
            elsif Upper_Kind = "PERROR" then
               Working_Record := (Kind      => Test_Summary.Possible_Error,
                                  others    => <>);
            elsif Upper_Kind = "NAERR" then
               Working_Record := (Kind      => Test_Summary.NA_Error,
                                  others    => <>);
            elsif Upper_Kind = "OK" then
               Working_Record := (Kind      => Test_Summary.OK,
                                  others    => <>);
            elsif Upper_Kind = "ACRQMT" then
               Working_Record := (Kind     => Test_Summary.Annex_C_Requirement,
                                  others   => <>);
            elsif Upper_Kind = "UPACKSPEC" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Package_Specification,
                   others    => <>);
            elsif Upper_Kind = "UFUNCSPEC" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Function_Specification,
                   others    => <>);
            elsif Upper_Kind = "UPROCSPEC" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Procedure_Specification,
                   others    => <>);
            elsif Upper_Kind = "UGENPACK" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Package,
                   others    => <>);
            elsif Upper_Kind = "UGENFUNC" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Function,
                   others    => <>);
            elsif Upper_Kind = "UGENPROC" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Procedure,
                   others    => <>);
            elsif Upper_Kind = "UPACKBODY" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Package_Body,
                   others    => <>);
            elsif Upper_Kind = "UFUNCBODY" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Function_Body,
                   others    => <>);
            elsif Upper_Kind = "UPROCBODY" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Procedure_Body,
                   others    => <>);
            elsif Upper_Kind = "UPACKINST" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Package_Instantiation,
                   others    => <>);
            elsif Upper_Kind = "UFUNCINST" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Function_Instantiation,
                   others    => <>);
            elsif Upper_Kind = "UPROCINST" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Procedure_Instantiation,
                   others    => <>);
            elsif Upper_Kind = "UPACKREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Package_Renaming,
                   others    => <>);
            elsif Upper_Kind = "UFUNCREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Function_Renaming,
                   others    => <>);
            elsif Upper_Kind = "UPROCREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Procedure_Renaming,
                   others    => <>);
            elsif Upper_Kind = "UGPACKREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Package_Renaming,
                   others    => <>);
            elsif Upper_Kind = "UGFUNCREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Function_Renaming,
                   others    => <>);
            elsif Upper_Kind = "UGPROCREN" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Generic_Procedure_Renaming,
                   others    => <>);
            elsif Upper_Kind = "PACKSUB" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Package_Subunit,
                   others    => <>);
            elsif Upper_Kind = "PROCSUB" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Procedure_Subunit,
                   others    => <>);
            elsif Upper_Kind = "FUNCSUB" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Function_Subunit,
                   others    => <>);
            elsif Upper_Kind = "TASKSUB" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Task_Subunit,
                   others    => <>);
            elsif Upper_Kind = "PROTSUB" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Protected_Subunit,
                   others    => <>);
            elsif Upper_Kind = "PRAGMA" then
               Working_Record :=
                  (Kind      => Test_Summary.Compilation_Unit,
                   Unit_Kind => Test_Summary.Configuration_Pragma,
                   others    => <>);
            else
               raise Format_Error with "Unknown Kind " & Upper_Kind &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
            end if;
         end;

         -- Source_Name field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         begin
            Ada.Strings.Fixed.Move (
               Target => Working_Record.Source_Name,
               Source => Ada.Strings.Fixed.Translate (
                  Buffer(Item_Start..Item_End),
                  Ada.Strings.Maps.Constants.Upper_Case_Map));
            -- We force this name to UPPER case so we can compare it without
            -- any casing issues. File names are effectively case
            -- insensitive (they are chosen that way, the file system doesn't
            -- matter).
         exception
            when Ada.Strings.Length_Error =>
               raise Format_Error with "Source name value too long " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         -- Start_Line field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Line : Trace.Line_Number_Type;
         begin
            if Item_End < Item_Start then
               Line := 0;
            else
               Line := Trace.Line_Number_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            Working_Record.Start_Line := Line;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad Start Line value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         -- Start_Pos field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Pos : Trace.Line_Position_Type;
         begin
            if Item_End < Item_Start then
               Pos := 0;
            else
               Pos := Trace.Line_Position_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            Working_Record.Start_Position := Pos;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad Start Pos value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         -- End_Line field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Line : Trace.Line_Number_Type;
         begin
            if Item_End < Item_Start then
               Line := 0;
            else
               Line := Trace.Line_Number_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            Working_Record.End_Line := Line;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad End Line value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         -- End_Pos field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         declare
            Pos : Trace.Line_Position_Type;
         begin
            if Item_End < Item_Start then
               Pos := 0;
            else
               Pos := Trace.Line_Position_Type'Value (
                                           Buffer(Item_Start..Item_End));
            end if;
            Working_Record.End_Position := Pos;
         exception
            when Constraint_Error =>
               raise Format_Error with "Bad End Pos value " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         if Strict_Checks then
            -- The range declared by Start..End has to be non-null.
            -- (A null compilation unit or error range makes no sense.)
            declare
               use type Trace.Line_Number_Type, Trace.Line_Position_Type;
            begin
               if Working_Record.Start_Line > Working_Record.End_Line then
                  raise Format_Error with "Null line range for summary item " &
                     Buffer(1..Last) &
                     " - record" & Summary_Item_Count'Image(Last_Summary_Item);
               elsif
                  Working_Record.Start_Line = Working_Record.End_Line and then
                  Working_Record.Start_Position >
                                              Working_Record.End_Position then
                  raise Format_Error with "Null line position range for " &
                     "summary item " & Buffer(1..Last) &
                     " - record" & Summary_Item_Count'Image(Last_Summary_Item);
               end if;
            end;
         -- else no check requested.
         end if;

         -- Name_Label field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End, Next_Item);
         begin
            if Working_Record.Kind = Test_Summary.Compilation_Unit then
               Ada.Strings.Fixed.Move (
                  Target => Working_Record.Unit_Name,
                  Source => Buffer(Item_Start..Item_End));
            elsif Working_Record.Kind = Test_Summary.Possible_Error then
               Ada.Strings.Fixed.Move (
                  Target => Working_Record.Set_Label,
                  Source => Buffer(Item_Start..Item_End));
            else -- Not used.
               if Strict_Checks and then -- The name has to be empty
                  Item_Start <= Item_End then
                  raise Format_Error with "Unit name/PE Label not empty " &
                     Buffer(Item_Start..Item_End) &
                     " - record" & Summary_Item_Count'Image(Last_Summary_Item);
               end if;
            end if;
         exception
            when Ada.Strings.Length_Error =>
               raise Format_Error with "Unit name/PE Label value too long " &
                  Buffer(Item_Start..Item_End) &
                  " - record" & Summary_Item_Count'Image(Last_Summary_Item);
         end;

         -- Flag field:
         Get_Item (Buffer(Next_Item..Last), Item_Start, Item_End,
                   Next_Item, Is_Last => True);
         declare
            Upper_Flag : constant String :=
               Ada.Strings.Fixed.Translate (Buffer(Item_Start..Item_End),
                  Ada.Strings.Maps.Constants.Upper_Case_Map);
         begin
            if Working_Record.Kind = Test_Summary.Compilation_Unit then
                if Upper_Flag = "" then
                   Working_Record.Is_Main  := False;
                   Working_Record.Optional := False;
                elsif Upper_Flag = "MAIN" then
                   Working_Record.Is_Main  := True;
                   Working_Record.Optional := False;
                elsif Upper_Flag = "OPTMAIN" then
                   Working_Record.Is_Main  := True;
                   Working_Record.Optional := True;
                elsif Upper_Flag = "OPT" then
                   Working_Record.Is_Main  := False;
                   Working_Record.Optional := True;
                else
                   raise Format_Error with "Unknown Flag " & Upper_Flag &
                     " - record" & Summary_Item_Count'Image(Last_Summary_Item);
                end if;
            else
               -- Flag not used for this kind.
               if Strict_Checks and then Upper_Flag'Length  /= 0 then
                  raise Format_Error with "Flag not empty " &
                     Buffer(Item_Start..Item_End) &
                     " - record" & Summary_Item_Count'Image(Last_Summary_Item);
               end if;
            end if;
         end;

         -- Insert the record:
         Last_Summary_Item := Last_Summary_Item + 1;
         Summary_of_Tests(Last_Summary_Item) := Working_Record;

         <<Next_Line>> null;
      end loop;
   exception
      when Ada.Text_IO.End_Error =>
         -- Reached the end of the file (normal condition).
         Ada.Text_IO.Close (File);
      -- when others => -- Propagate other exceptions.
   end Read_Summary_of_Tests;


   procedure Read_Manual_Grading_List (Manual_Grading_Name : in String) is
      -- Read the list of tests that may require manual grading from the file
      -- named Manual_Grading_Name, putting the result into Manual_Grading_List
      -- with Last_Manual_Grading set to the last manual grading item in the
      -- data. Propagates any I/O exceptions, as well as Format_Error if the
      -- data is malformatted.
      File : Ada.Text_IO.File_Type;
      Buffer : String(1..512);
      Last : Natural;
      Item_Start, Item_End, Next_Item : Natural;
   begin
      Ada.Text_IO.Open (File, Ada.Text_IO.In_File, Manual_Grading_Name);
      loop
         Ada.Text_IO.Get_Line (File, Buffer, Last);
         if Last = Buffer'Last then
            raise Format_Error with "Excessively long line at record" &
               Summary_Item_Count'Image(Last_Summary_Item);
         end if;
         Item_Start := Ada.Strings.Fixed.Index (Buffer(1..Last), "--");
         if Item_Start /= 0 then -- Item ends with a comment.
            -- Chop off the comment.
            Last := Item_Start - 1;
         end if;
         -- Remove any trailing white space or control characters:
         for I in reverse 1 .. Last loop
            if Buffer(I) = ' ' or else
               not Ada.Characters.Handling.Is_Graphic (Buffer(I)) then
               Last := I - 1; -- Drop the white space/control character.
            else
               exit; -- Not white space/control character.
            end if;
         end loop;
         if Last < Buffer'First then
            -- (Now) empty line; skip it.
            goto Next_Line;
         -- else not empty.
         end if;

         if Last < 7 then
            raise Format_Error with "Manual Grading test name too short: " &
                      Buffer(1..Last) & " - record" &
                      Manual_Grading_Count'Image(Last_Manual_Grading);
         elsif Last > Trace.Name_Subtype'Last then
            raise Format_Error with "Manual Grading test name too long: " &
                      Buffer(1..Last) & " - record" &
                      Manual_Grading_Count'Image(Last_Manual_Grading);
         end if;

         -- Insert the record:
         Last_Manual_Grading := Last_Manual_Grading + 1;
         Ada.Strings.Fixed.Move (Target =>
                                    Manual_Grading_List(Last_Manual_Grading),
                                 Source =>
                                    Ada.Strings.Fixed.Translate (
                                       Buffer(1..Last),
                                       Ada.Strings.Maps.
                                          Constants.Upper_Case_Map));

         <<Next_Line>> null;
      end loop;
   exception
      when Ada.Text_IO.End_Error =>
         -- Reached the end of the file (normal condition).
         Ada.Text_IO.Close (File);
      -- when others => -- Propagate other exceptions.
   end Read_Manual_Grading_List;


   function Manual_Grading_Requested_for_Test
               (Source_Name : Trace.Name_Subtype) return Boolean is
      -- Returns True if the test in the source file Source_Name is
      -- included on the potentially manually graded tests list, and
      -- returns False otherwise.
   begin
      for Man in 1 .. Last_Manual_Grading loop
         if Manual_Grading_List(Man)(1 .. 7) = Source_Name(1 .. 7) then
            return True; -- The test name is on the potentially manually
                         -- graded tests list.
         -- else not this test, continue checking.
         end if;
      end loop;
      return False;
   end Manual_Grading_Requested_for_Test;

end Grading_Data;

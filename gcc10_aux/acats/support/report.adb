

with Ada.Text_IO, Ada.Calendar;
use Ada.Text_IO, Ada.Calendar;
pragma Elaborate (Ada.Text_IO, Ada.Calendar);

package body Report is

     type Status is (Pass, Fail, Does_Not_Apply, Action_Required,
                     Unknown);

     type Time_Integer is range 0 .. 86_400;

     Test_Status : Status := Fail;

     Max_Name_Len : constant := 15;     -- Maximum Test Name Length.
     Test_Name : String (1..Max_Name_Len);

     No_Name : constant String := "NO_NAME";
     Test_Name_Len : Integer range 0..Max_Name_Len := 0;

     Event_Trace_File_Name : constant String := "etrace.csv";
          -- This name will work on Windows and POSIX targets.
          -- Change it if it doesn't work.
     Max_Event_Message_Len : constant := 150;
          -- Limit event messages to this length.

     ACATS_Version : constant String := "4.1";
                                       -- Version of ACATS being run (X.XX).

     procedure Put_Msg (Msg : String) is
          -- Write message.  Long messages are folded (and indented).
          Max_Len : constant Integer range 50..150 := 72;  -- Maximum output
                                        -- line length.
          Indent : constant Integer := Test_Name_Len + 9;  -- Amount to
                                        -- indent continuation lines.
          I : Integer := 0;             -- Current Indentation.
          M : Integer := Msg'First;     -- Start of message slice.
          N : Integer;                  -- End of message slice.
     begin
          loop
               if I + (Msg'Last-M+1) > Max_Len then
                    N := M + (Max_Len-I) - 1;
                    if Msg (N) /= ' ' then
                         while N >= M and then Msg (N+1) /= ' ' loop
                              N := N - 1;
                         end loop;
                         if N < M then
                              N := M + (Max_Len-I) - 1;
                         end if;
                    end if;
               else N := Msg'Last;
               end if;
               Set_Col (Standard_Output, Ada.Text_IO.Count (I+1));
               Put_Line (Standard_Output, Msg (M..N));
               I := Indent;
               M := N + 1;
               while M <= Msg'Last and then Msg (M) = ' ' loop
                    M := M + 1;
               end loop;
               exit when M > Msg'Last;
          end loop;
     end Put_Msg;

     function Inner_Time_Stamp (Full : in Boolean := False) return String is
          Time_Now : Ada.Calendar.Time;
          Dur_Second : Day_Duration;
          Year,
          Month,
          Day,
          Hour,
          Minute,
          Second,
          SubSecond : Time_Integer := 1;

          function Convert (Number : Time_Integer) return String is
               Str : String (1..2) := (others => '0');
               Dec_Digit : constant String := "0123456789";
               Num : Time_Integer := Number;
          begin
               if Num = 0 then
                    return Str;
               else
                    Num := Num mod 100;
                    Str (2) := Dec_Digit (Integer (Num mod 10 + 1));
                    Num := Num / 10;
                    Str (1) := Dec_Digit (Integer (Num + 1));
                    return Str;
               end if;
          end Convert;
     begin
          Time_Now := Ada.Calendar.Clock;
          -- Note: This entire routine except the above call could
          -- be replaced by a call to Ada.Calendar.Formatting.Image
          -- if we don't mind the 4 digit year, and that we couldn't
          -- use the result on an Ada 95 compiler.
          Split (Time_Now, Year_Number (Year), Month_Number (Month),
                  Day_Number (Day), Dur_Second);
          if Full then
               -- Remove the fractional part without overflow (do this first
               -- so we don't round the seconds, and don't need a larger
               -- integer type [24-bits is not enough]):
               Second := Time_Integer'Max(Time_Integer(Dur_Second)-1, 0);
               Minute := Second / 60;
               -- Leave just seconds:
               Dur_Second := Dur_Second - Integer(Minute)*Day_Duration'(60.0);
               -- Multiply by 100:
               Dur_Second := Dur_Second * 100;
               SubSecond := Time_Integer(Dur_Second);
               SubSecond := SubSecond mod 100;
               -- Remove the fractional part:
               if Dur_Second <= Day_Duration(SubSecond) then
                    -- The value is just the subseconds.
                    Dur_Second := 0.0;
               else
                    Dur_Second := Dur_Second - Day_Duration(SubSecond);
               end if;
               -- Put everything back the way it was:
               Dur_Second := Dur_Second / 100;
               Dur_Second := Dur_Second + Integer(Minute)*Day_Duration'(60.0);
          end if;
          Second := Time_Integer(Dur_Second);
          Hour := Second / 3600;
          Second := Second mod 3600;
          Minute := Second / 60;
          Second := Second mod 60;
          if Full then
               return (Convert (Time_Integer (Year)/100) &
                       Convert (Time_Integer (Year)) & "-" &
                       Convert (Time_Integer (Month)) & "-" &
                       Convert (Time_Integer (Day)) & " " &
                       Convert (Time_Integer (Hour)) & ":" &
                       Convert (Time_Integer (Minute)) & ":" &
                       Convert (Time_Integer (Second)) & '.' &
                       Convert (Time_Integer (SubSecond)));
          else
               return (Convert (Time_Integer (Year)) & "-" &
                       Convert (Time_Integer (Month)) & "-" &
                       Convert (Time_Integer (Day)) & " " &
                       Convert (Time_Integer (Hour)) & ":" &
                       Convert (Time_Integer (Minute)) & ":" &
                       Convert (Time_Integer (Second)));
          end if;
     end Inner_Time_Stamp;

     function Time_Stamp return String is
     begin
          return Inner_Time_Stamp;
     end Time_Stamp;

     procedure Put_Event_Trace (Event : in String;
                                Msg : in String) is
          -- Put an event trace.
          File : Ada.Text_IO.File_Type;
     begin
          if not Generate_Event_Trace_File then
               return; -- Nothing to do, shouldn't get here.
          end if;
          begin
               Ada.Text_IO.Open (File, Name => Event_Trace_File_Name,
                    Mode => Ada.Text_IO.Append_File);
          exception
               when Ada.Text_IO.Name_Error =>
                    -- The file doesn't exist, create it.
                    Ada.Text_IO.Create (File, Name => Event_Trace_File_Name,
                        Mode => Ada.Text_IO.Out_File);
                    -- Write a header. This is not strictly necessary,
                    -- but we do it as it makes it a lot easier to use
                    -- the .CSV file in an spreadsheet.
                    Ada.Text_IO.Put_Line (File,
                                          "Event,Timestamp,Name," &
                                          "Line,Position,Message");
          end;
          Ada.Text_IO.Put (File, Event & ",""" &
                           Inner_Time_Stamp(Full => True) & """,""" &
                           Test_Name (1..Test_Name_Len) & """,,,""");
          declare
               Msg_Copy : String := Msg;
          begin
               for I in Msg_Copy'range loop
                    if Msg_Copy(I) = '"' then -- Can't have any double
                                                -- quotes in this string.
                           Msg_Copy(I) := ''';
                    end if;
               end loop;
               if Msg_Copy'Length <= Max_Event_Message_Len then
                    Ada.Text_IO.Put_Line (File, Msg_Copy & """");
               else
                    -- Find a space near the end:
                    for I in reverse Msg_Copy'First +
                       Max_Event_Message_Len-20 .. Msg_Copy'First +
                       Natural'Min(Max_Event_Message_Len+1,Msg_Copy'Length-1)
                          loop
                       if Msg_Copy(I) = ' ' then
                          Ada.Text_IO.Put_Line (File,
                             Msg_Copy (Msg_Copy'First .. I - 1) & """");
                          Ada.Text_IO.Close (File);
                          return; -- Done.
                       -- else continue looking.
                       end if;
                    end loop;
                    -- No space obvious, so truncate it.
                    Ada.Text_IO.Put_Line (File,
                        Msg_Copy (Msg_Copy'First ..
                          Msg_Copy'First + Natural'Min(
                            Max_Event_Message_Len+1, Msg_Copy'Length)) & """");
               end if;
          end;
          Ada.Text_IO.Close (File);
     end Put_Event_Trace;

     procedure Test (Name : String; Descr : String) is
     begin
          Test_Status := Pass;
          if Name'Length <= Max_Name_Len then
               Test_Name_Len := Name'Length;
          else Test_Name_Len := Max_Name_Len;
          end if;
          Test_Name (1..Test_Name_Len) :=
                    Name (Name'First .. Name'First+Test_Name_Len-1);

          Put_Msg ("");
          Put_Msg (",.,. " & Test_Name (1..Test_Name_Len) & " " &
                   "ACATS " & ACATS_Version & " " & Time_Stamp);
          Put_Msg ("---- " & Test_Name (1..Test_Name_Len) & " " &
                   Descr & ".");
          if Generate_Event_Trace_File then
               Put_Event_Trace ("EXSTART", Descr);
          end if;
     end Test;

     procedure Comment (Descr : String) is
     begin
          Put_Msg ("   - " & Test_Name (1..Test_Name_Len) & " " &
                   Descr & ".");
     end Comment;

     procedure Failed (Descr : String) is
     begin
          Test_Status := Fail;
          Put_Msg ("   * " & Test_Name (1..Test_Name_Len) & " " &
                   Descr & ".");
          if Generate_Event_Trace_File then
               Put_Event_Trace ("EXFAIL", Descr);
          end if;
     end Failed;

     procedure Not_Applicable (Descr : String) is
     begin
          if Test_Status = Pass or Test_Status = Action_Required then
               Test_Status := Does_Not_Apply;
          end if;
          Put_Msg ("   + " & Test_Name (1..Test_Name_Len) & " " &
                   Descr & ".");
          if Generate_Event_Trace_File then
               Put_Event_Trace ("EXNA", Descr);
          end if;
     end Not_Applicable;

     procedure Special_Action (Descr : String) is
     begin
          if Test_Status = Pass then
               Test_Status := Action_Required;
          end if;
          Put_Msg ("   ! " & Test_Name (1..Test_Name_Len) & " " &
                   Descr & ".");
          if Generate_Event_Trace_File then
               Put_Event_Trace ("EXSACT", Descr);
          end if;
     end Special_Action;

     procedure Result is
     begin
          case Test_Status is
          when Pass =>
               Put_Msg ("==== " & Test_Name (1..Test_Name_Len) &
                        " PASSED ============================.");
               if Generate_Event_Trace_File then
                    Put_Event_Trace ("EXEND", "Passed");
               end if;
          when Does_Not_Apply =>
               Put_Msg ("++++ " & Test_Name (1..Test_Name_Len) &
                        " NOT-APPLICABLE ++++++++++++++++++++.");
               if Generate_Event_Trace_File then
                    Put_Event_Trace ("EXEND", "Not-Applicable");
               end if;
          when Action_Required =>
               Put_Msg ("!!!! " & Test_Name (1..Test_Name_Len) &
                        " TENTATIVELY PASSED !!!!!!!!!!!!!!!!.");
               Put_Msg ("!!!! " & (1..Test_Name_Len => ' ') &
                        " SEE '!' COMMENTS FOR SPECIAL NOTES!!");
               if Generate_Event_Trace_File then
                    Put_Event_Trace ("EXEND", "Tentatively Passed");
               end if;
          when others =>
               Put_Msg ("**** " & Test_Name (1..Test_Name_Len) &
                        " FAILED ****************************.");
               if Generate_Event_Trace_File then
                    Put_Event_Trace ("EXEND", "Failed");
               end if;
          end case;
          Test_Status := Fail;
          Test_Name_Len := No_Name'Length;
          Test_Name (1..Test_Name_Len) := No_Name;
     end Result;

     function Ident_Int (X : Integer) return Integer is
     begin
          if Equal (X, X) then          -- Always equal.
               return X;                -- Always executed.
          end if;
          return 0;                     -- Never executed.
     end Ident_Int;

     function Ident_Char (X : Character) return Character is
     begin
          if Equal (Character'Pos(X), Character'Pos(X)) then  -- Always equal.
               return X;                -- Always executed.
          end if;
          return '0';                   -- Never executed.
     end Ident_Char;

     function Ident_Wide_Char (X : Wide_Character) return Wide_Character is
     begin
          if Equal (Wide_Character'Pos(X), Wide_Character'Pos(X)) then
                                        -- Always equal.
               return X;                -- Always executed.
          end if;
          return '0';                   -- Never executed.
     end Ident_Wide_Char;

     function Ident_Bool (X : Boolean) return Boolean is
     begin
          if Equal (Boolean'Pos(X), Boolean'Pos(X)) then  -- Always equal.
               return X;                -- Always executed.
          end if;
          return False;                 -- Never executed.
     end Ident_Bool;

     function Ident_Str (X : String) return String is
     begin
          if Equal (X'Length, X'Length) then  -- Always equal.
               return X;                -- Always executed.
          end if;
          return "";                    -- Never executed.
     end Ident_Str;

     function Ident_Wide_Str (X : Wide_String) return Wide_String is
     begin
          if Equal (X'Length, X'Length) then  -- Always equal.
               return X;                -- Always executed.
          end if;
          return "";                    -- Never executed.
     end Ident_Wide_Str;

     function Equal (X, Y : Integer) return Boolean is
          Rec_Limit : constant Integer range 1..100 := 3;  -- Recursion limit.
          Z : Boolean;                  -- Result.
     begin
          if X < 0 then
               if Y < 0 then
                    Z := Equal (-X, -Y);
               else Z := False;
               end if;
          elsif X > Rec_Limit then
               Z := Equal (Rec_Limit, Y-X+Rec_Limit);
          elsif X > 0 then
               Z := Equal (X-1, Y-1);
          else Z := Y = 0;
          end if;
          return Z;
     exception
          when others =>
               return X = Y;
     end Equal;

     function Legal_File_Name (X : File_Num := 1;
                               Nam : String := "")
                              return String is
          Suffix : String (2..6);
     begin
          if Nam = "" then
               Suffix := Test_Name(3..7);
          else
               Suffix := Nam(3..7);
          end if;

          case X is
               when 1 => return ('X' & Suffix);
               when 2 => return ('Y' & Suffix);
               when 3 => return ('Z' & Suffix);
               when 4 => return ('V' & Suffix);
               when 5 => return ('W' & Suffix);
          end case;
     end Legal_File_Name;

begin

     Test_Name_Len := No_Name'Length;
     Test_Name (1..Test_Name_Len) := No_Name;

end Report;

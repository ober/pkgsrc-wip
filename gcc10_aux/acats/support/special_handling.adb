
package body Special_Handling is

   -- Unit whose processing is optional:

   MAX_OPT_UNIT : constant := 1_000;
      -- We have to use a constant as there is no reasonable way to find
      -- out how many records are in an optional unit file short of reading
      -- the entire file an extra time.
   type Optional_Unit_Count is range 0 .. MAX_OPT_UNIT;
   subtype Optional_Unit_Index is Optional_Unit_Count range
                                                      1 .. MAX_OPT_UNIT;

   type Optional_Unit_Rec is record
      Source_Name : Trace.Name_Subtype;
      Unit_Name   : Test_Summary.Comp_Unit_Name;
      Unit_Kind   : Test_Summary.Compilation_Unit_Kinds;
   end record;

   type Optional_Unit_Array is array (Optional_Unit_Index range <>) of
      Optional_Unit_Rec;

   Optional_Unit_List : constant Optional_Unit_Array :=
      (   1 => (Source_Name => "BA150031.A  ",
                Unit_Name   => "BA150031" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Package_Body),
          2 => (Source_Name => "BA150038.A  ",
                Unit_Name   => "BA150038" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Package_Body),
          3 => (Source_Name => "BA150039.A  ",
                Unit_Name   => "BA150039" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Package_Body),
          4 => (Source_Name => "BA15003A.A  ",
                Unit_Name   => "BA15003A" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Package_Body),
          5 => (Source_Name => "B611002.A   ",
                Unit_Name   => "SPEC2   " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Subunit),
          6 => (Source_Name => "B611002.A   ",
                Unit_Name   => "SPEC6   " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Subunit),
          7 => (Source_Name => "B611002.A   ",
                Unit_Name   => "B611002 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
          8 => (Source_Name => "B611004.A   ",
                Unit_Name   => "SPEC2   " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Subunit),
          9 => (Source_Name => "B611004.A   ",
                Unit_Name   => "SPEC6   " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Subunit),
         10 => (Source_Name => "B611004.A   ",
                Unit_Name   => "B611004 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         11 => (Source_Name => "BA210057.AM ",
                Unit_Name   => "BA210057" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         12 => (Source_Name => "BA1001D.ADA ",
                Unit_Name   => "BA1001D " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         13 => (Source_Name => "BA1020F2.ADA",
                Unit_Name   => "BA1020F2M" &
                               (10..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         14 => (Source_Name => "BA110134.AM ",
                Unit_Name   => "BA11013 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         15 => (Source_Name => "BA110134.AM ",
                Unit_Name   => "BA11013A" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Package_Body),
         16 => (Source_Name => "BA140016.A  ",
                Unit_Name   => "BA14001H" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         17 => (Source_Name => "BA140018.A  ",
                Unit_Name   => "BA14001A.DAUGHTER" &
                               (18..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Function_Body),
         18 => (Source_Name => "BA140024.A  ",
                Unit_Name   => "BA14002H" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         19 => (Source_Name => "B854001.A   ",
                Unit_Name   => "B854001 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         20 => (Source_Name => "BDD2002.A   ",
                Unit_Name   => "BDD2002 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         21 => (Source_Name => "B370001.A   ",
                Unit_Name   => "B370001 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         22 => (Source_Name => "B7400032.AM ",
                Unit_Name   => "B7400032" &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body),
         23 => (Source_Name => "B854003.A   ",
                Unit_Name   => "B854003 " &
                               (9..Test_Summary.Comp_Unit_Name'Last => ' '),
                Unit_Kind   => Test_Summary.Procedure_Body));

       -- Note: This list is maintained by the ACAA as part of the ACATS.
       -- Please report any units that should be on this list but are not to
       -- the ACAA at agent@ada-auth.org.

   Last_Optional_Unit : Optional_Unit_Count := Optional_Unit_List'Last;
      -- A list of optional units in source files. The grading tool
      -- will not require compilation of such units (these typically are
      -- part of B-Tests). Note that this list is part of the ACATS and is
      -- not created/modified by the user.

   function Optional_Unit_for_Test
               (Source_Name : Trace.Name_Subtype;
                Unit_Name   : Test_Summary.Comp_Unit_Name;
                Unit_Kind   : Test_Summary.Compilation_Unit_Kinds)
      return Boolean is
      -- Returns True if the test in the source file Source_Name
      -- has an optional unit Unit_Name with Unit_Kind according to the
      -- Optional_Unit_List. Returns False otherwise.
      use type Test_Summary.Compilation_Unit_Kinds;
   begin
      for Man in 1 .. Last_Optional_Unit loop
         if Optional_Unit_List(Man).Source_Name = Source_Name and then
            Optional_Unit_List(Man).Unit_Name = Unit_Name and then
            Optional_Unit_List(Man).Unit_Kind = Unit_Kind then
            return True; -- The source/unit/kind is on the optional unit list.
         -- else not this test, continue checking.
         end if;
      end loop;
      return False;
   end Optional_Unit_for_Test;

   Special_Unit_Info : constant array (Positive range <>) of
        Test_Summary.Info_Record :=
      (1 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B53001A.ADA ",
             Start_Line     => 31,
             Start_Position =>  1,
             End_Line       => 58,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B53001A" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       2 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B55A01J.ADA ",
             Start_Line     => 35,
             Start_Position =>  1,
             End_Line       => 46,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B55A01J" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       3 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B55A01K.ADA ",
             Start_Line     => 35,
             Start_Position =>  1,
             End_Line       => 45,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B55A01K" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       4 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B55A01L.ADA ",
             Start_Line     => 35,
             Start_Position =>  1,
             End_Line       => 45,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B55A01L" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       5 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B56001D.ADA ",
             Start_Line     => 29,
             Start_Position =>  1,
             End_Line       => 35,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B56001D" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       6 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B56001H.ADA ",
             Start_Line     => 29,
             Start_Position =>  1,
             End_Line       => 41,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B56001H" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       7 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "BD4003A.ADA ",
             Start_Line     => 42,
             Start_Position =>  1,
             End_Line       => 115,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "BD4003A" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       8 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "BD4003B.ADA ",
             Start_Line     => 35,
             Start_Position =>  1,
             End_Line       => 72,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "BD4003B" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
       9 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B67001H.ADA ",
             Start_Line     => 32,
             Start_Position =>  1,
             End_Line       => 55,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B67001H" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      10 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B67001J.ADA ",
             Start_Line     => 32,
             Start_Position =>  1,
             End_Line       => 53,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B67001J" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      11 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B67001K.ADA ",
             Start_Line     => 34,
             Start_Position =>  1,
             End_Line       => 70,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B67001K" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      12 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B29001A.ADA ",
             Start_Line     => 32,
             Start_Position =>  1,
             End_Line       => 185,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B29001A" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      13 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B91001B.ADA ",
             Start_Line     => 31,
             Start_Position =>  1,
             End_Line       => 42,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B91001B" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      14 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B91001D.ADA ",
             Start_Line     => 31,
             Start_Position =>  1,
             End_Line       => 33,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body, -- Really junk.
             Unit_Name      => "B91001D" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      15 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B91001E.ADA ",
             Start_Line     => 31,
             Start_Position =>  1,
             End_Line       => 33,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body, -- Really junk.
             Unit_Name      => "B91001E" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      16 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B91002F.ADA ",
             Start_Line     => 33,
             Start_Position =>  1,
             End_Line       => 53,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B91002F" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      17 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B95006D.ADA ",
             Start_Line     => 32,
             Start_Position =>  1,
             End_Line       => 50,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B95006D" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      18 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B952002.A   ",
             Start_Line     => 46,
             Start_Position =>  1,
             End_Line       => 91,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B952002" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      19 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B952003.A   ",
             Start_Line     => 40,
             Start_Position =>  1,
             End_Line       => 84,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B952003" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      20 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B97103E.ADA ",
             Start_Line     => 33,
             Start_Position =>  1,
             End_Line       => 72,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B97103E" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      21 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "B91001C.ADA ",
             Start_Line     => 32,
             Start_Position =>  1,
             End_Line       => 39,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "B91001C" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False),
      22 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "C250002.AU  ",
             Start_Line     => 48,
             Start_Position =>  1,
             End_Line       => 61,
             End_Position   => 15,
             Unit_Kind      => Test_Summary.Package_Specification,
             Unit_Name      => "C250002_0" &
                               (10..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => False,
             Optional       => False),
      23 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "C250002.AU  ",
             Start_Line     => 61,
             Start_Position =>  1,
             End_Line       => 81,
             End_Position   => 15,
             Unit_Kind      => Test_Summary.Package_Specification,
             Unit_Name      => "C250002_" & Character'Val(193) &
                               (10..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => False,
             Optional       => False),
      24 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "C250002.AU  ",
             Start_Line     => 85,
             Start_Position =>  1,
             End_Line       => 92,
             End_Position   => 15,
             Unit_Kind      => Test_Summary.Package_Body,
             Unit_Name      => "C250002_" & Character'Val(193) &
                               (10..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => False,
             Optional       => False),
      25 => (Kind           => Test_Summary.Compilation_Unit,
             Source_Name    => "C250002.AU  ",
             Start_Line     => 96,
             Start_Position =>  1,
             End_Line       => 174,
             End_Position   => 13,
             Unit_Kind      => Test_Summary.Procedure_Body,
             Unit_Name      => "C250002" &
                               (8..Test_Summary.Comp_Unit_Name'Last => ' '),
             Is_Main        => True,
             Optional       => False));

   function Do_Special_for_Test_File
               (Source_Name  : Trace.Name_Subtype;
                Summary_File : Ada.Text_IO.File_Type)
      return Special_Kind is
      -- Checks if Source_Name needs special handling; if so, uses
      -- uses Write_Rec to write the needed records and returns the appropriate
      -- Kind.
      -- If this routine returns Not_Special, the unit should be parsed
      -- normally. If this routine returns No_Parse, the unit should not be
      -- parsed, but it should be split into tokens (so the error tags are
      -- processed). This is used for tests which are lexically fine, but have
      -- severe parse errors that the summary tool cannot handle. This routine
      -- will have written the compilation unit records for the test file.
      -- If this routine returns Fully_Manual, no processing should be done on
      -- the unit. This is used for tests with lexical errors that the summary
      -- tool cannot handle. This routine will have written the entire summary
      -- for the test file.
   begin
      if Source_Name = "B53001A.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(1));
         return No_Parse;
      elsif Source_Name = "B55A01J.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(2));
         return No_Parse;
      elsif Source_Name = "B55A01K.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(3));
         return No_Parse;
      elsif Source_Name = "B55A01L.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(4));
         return No_Parse;
      elsif Source_Name = "B56001D.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(5));
         return No_Parse;
      elsif Source_Name = "B56001H.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(6));
         return No_Parse;
      elsif Source_Name = "BD4003A.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(7));
         return No_Parse;
      elsif Source_Name = "BD4003B.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(8));
         return No_Parse;
      elsif Source_Name = "B67001H.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File, Special_Unit_Info(9));
         return No_Parse;
      elsif Source_Name = "B67001J.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(10));
         return No_Parse;
      elsif Source_Name = "B67001K.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(11));
         return No_Parse;
      elsif Source_Name = "B29001A.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(12));
         return No_Parse;
      elsif Source_Name = "B91001B.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(13));
         return No_Parse;
      elsif Source_Name = "B91001D.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(14));
         return No_Parse;
      elsif Source_Name = "B91001E.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(15));
         return No_Parse;
      elsif Source_Name = "B91002F.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(16));
         return No_Parse;
      elsif Source_Name = "B95006D.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(17));
         return No_Parse;
      elsif Source_Name = "B952002.A   " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(18));
         return No_Parse;
      elsif Source_Name = "B952003.A   " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(19));
         return No_Parse;
      elsif Source_Name = "B97103E.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(20));
         return No_Parse;
      elsif Source_Name = "B91001C.ADA " then
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(21));
         return No_Parse;
      elsif Source_Name = "C250002.AU  " then
         -- Note: We won't need this one if we implement UTF-8 in this tool.
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(22));
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(23));
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(24));
         Test_Summary.Write_Summary_Record(Summary_File,Special_Unit_Info(25));
         return No_Parse;
      end if;
      return Not_Special;
   end Do_Special_for_Test_File;

end Special_Handling;

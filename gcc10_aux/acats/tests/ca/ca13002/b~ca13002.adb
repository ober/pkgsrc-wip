pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~ca13002.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~ca13002.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E091 : Short_Integer; pragma Import (Ada, E091, "system__os_lib_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "ada__exceptions_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__soft_links_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "system__exception_table_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__containers_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__io_exceptions_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__strings_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "ada__strings__maps_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "ada__strings__maps__constants_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "interfaces__c_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__exceptions_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__object_reader_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "system__dwarf_lines_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "system__soft_links__initialize_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "system__traceback__symbolic_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__tags_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__streams_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__file_control_block_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__finalization_root_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__finalization_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__file_io_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "ada__calendar_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ca13002_0_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ca13002_0__ca13002_1_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ca13002_0__ca13002_1__ca13002_5_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ca13002_0__ca13002_2_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "ca13002_0__ca13002_2__ca13002_5_E");
   E016 : Short_Integer; pragma Import (Ada, E016, "ca13002_0__ca13002_3_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "ca13002_0__ca13002_4_E");
   E020 : Short_Integer; pragma Import (Ada, E020, "report_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E123 := E123 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__file_io__finalize_body");
      begin
         E129 := E129 - 1;
         F2;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E042 := E042 + 1;
      Ada.Containers'Elab_Spec;
      E057 := E057 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E084 := E084 + 1;
      Ada.Strings'Elab_Spec;
      E069 := E069 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E071 := E071 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E075 := E075 + 1;
      Interfaces.C'Elab_Spec;
      E089 := E089 + 1;
      System.Exceptions'Elab_Spec;
      E044 := E044 + 1;
      System.Object_Reader'Elab_Spec;
      E097 := E097 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E064 := E064 + 1;
      System.Os_Lib'Elab_Body;
      E091 := E091 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E038 := E038 + 1;
      E030 := E030 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E056 := E056 + 1;
      E025 := E025 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E117 := E117 + 1;
      Ada.Streams'Elab_Spec;
      E125 := E125 + 1;
      System.File_Control_Block'Elab_Spec;
      E133 := E133 + 1;
      System.Finalization_Root'Elab_Spec;
      E132 := E132 + 1;
      Ada.Finalization'Elab_Spec;
      E130 := E130 + 1;
      System.File_Io'Elab_Body;
      E129 := E129 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E023 := E023 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E123 := E123 + 1;
      E005 := E005 + 1;
      E008 := E008 + 1;
      E010 := E010 + 1;
      E012 := E012 + 1;
      E014 := E014 + 1;
      E016 := E016 + 1;
      E018 := E018 + 1;
      Report'Elab_Body;
      E020 := E020 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_ca13002");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   ./ca13002_0.o
   --   ./ca13002_0-ca13002_1.o
   --   ./ca13002_0-ca13002_1-ca13002_5.o
   --   ./ca13002_0-ca13002_2.o
   --   ./ca13002_0-ca13002_2-ca13002_5.o
   --   ./ca13002_0-ca13002_3.o
   --   ./ca13002_0-ca13002_4.o
   --   /home/fernando/mysandboxfolder/tmp/acats/support/report.o
   --   ./ca13002.o
   --   -L./
   --   -L/home/fernando/mysandboxfolder/tmp/acats/support/
   --   -L/home/fernando/mysandboxfolder/usr/pkg/gcc10/lib/gcc/x86_64--netbsd/10.3.0/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;

pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~c94004c.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~c94004c.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E080 : Short_Integer; pragma Import (Ada, E080, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "ada__exceptions_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__exception_table_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "ada__containers_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "ada__io_exceptions_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__strings_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__strings__maps__constants_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__exceptions_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__object_reader_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "system__dwarf_lines_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__soft_links__initialize_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__traceback__symbolic_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__tags_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__streams_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__file_control_block_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__finalization_root_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "ada__finalization_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__file_io_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__calendar_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar__delays_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "ada__real_time_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__text_io_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "system__tasking__initialization_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__tasking__protected_objects_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "system__tasking__protected_objects__entries_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__tasking__queuing_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__tasking__stages_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "report_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "impdef_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "c94004c_pkg_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "c94004c_task_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E186 := E186 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E114 := E114 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E120 := E120 - 1;
         F3;
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
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, False, True, False, True, False, True, 
           True, False, False, True, False, False, False, False, 
           False, False, False, True, True, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, False, True, True, 
           True, False, False, False),
         Count => (0, 0, 0, 0, 2, 1, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, False, False, False, False));
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
      E030 := E030 + 1;
      Ada.Containers'Elab_Spec;
      E045 := E045 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E073 := E073 + 1;
      Ada.Strings'Elab_Spec;
      E057 := E057 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E059 := E059 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E063 := E063 + 1;
      Interfaces.C'Elab_Spec;
      E078 := E078 + 1;
      System.Exceptions'Elab_Spec;
      E032 := E032 + 1;
      System.Object_Reader'Elab_Spec;
      E086 := E086 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E052 := E052 + 1;
      System.Os_Lib'Elab_Body;
      E080 := E080 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E026 := E026 + 1;
      E018 := E018 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E044 := E044 + 1;
      E013 := E013 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E106 := E106 + 1;
      Ada.Streams'Elab_Spec;
      E116 := E116 + 1;
      System.File_Control_Block'Elab_Spec;
      E124 := E124 + 1;
      System.Finalization_Root'Elab_Spec;
      E123 := E123 + 1;
      Ada.Finalization'Elab_Spec;
      E121 := E121 + 1;
      System.File_Io'Elab_Body;
      E120 := E120 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E010 := E010 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E008 := E008 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E196 := E196 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E114 := E114 + 1;
      System.Tasking.Initialization'Elab_Body;
      E176 := E176 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E184 := E184 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E186 := E186 + 1;
      System.Tasking.Queuing'Elab_Body;
      E190 := E190 + 1;
      System.Tasking.Stages'Elab_Body;
      E194 := E194 + 1;
      Report'Elab_Body;
      E142 := E142 + 1;
      E112 := E112 + 1;
      C94004C_PKG'ELAB_BODY;
      E006 := E006 + 1;
      C94004C_TASK'ELAB_SPEC;
      E004 := E004 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_c94004c");

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
   --   /home/fernando/mysandboxfolder/tmp/acats/support/report.o
   --   /home/fernando/mysandboxfolder/tmp/acats/support/impdef.o
   --   ./c94004c_pkg.o
   --   ./c94004c_task.o
   --   ./c94004c.o
   --   -L./
   --   -L/home/fernando/mysandboxfolder/tmp/acats/support/
   --   -L/home/fernando/mysandboxfolder/usr/pkg/gcc10/lib/gcc/x86_64--netbsd/10.3.0/adalib/
   --   -static
   --   /home/fernando/mysandboxfolder/tmp/acats/support/cd300051.o
   --   -lgnarl
   --   -lgnat
   --   -pthread
--  END Object file/option list   

end ada_main;

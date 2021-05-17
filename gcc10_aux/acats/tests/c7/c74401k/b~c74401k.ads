pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 10.3.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_c74401k" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#9aa93bd8#;
   pragma Export (C, u00001, "c74401kB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#a1710c38#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#e932e590#;
   pragma Export (C, u00004, "ada__real_timeB");
   u00005 : constant Version_32 := 16#69ea8064#;
   pragma Export (C, u00005, "ada__real_timeS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#f832ebf4#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#363575b8#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#cfec26ee#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#a6571217#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#6d5d6a61#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#1349bf20#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#e3c3ea0e#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#eebb463c#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#8b945813#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00020, "system__soft_links__initializeB");
   u00021 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00021, "system__soft_links__initializeS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#28e879ff#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#fbf97b55#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#ce347fe1#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#5c74e542#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#d8ddebd3#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#a48cf2d5#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#f875ccd3#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#a60ce467#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#1df29216#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#46491211#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00040, "ada__containersS");
   u00041 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00041, "ada__exceptions__tracebackB");
   u00042 : constant Version_32 := 16#ae2d2db5#;
   pragma Export (C, u00042, "ada__exceptions__tracebackS");
   u00043 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00043, "system__bounded_stringsB");
   u00044 : constant Version_32 := 16#d1aa330e#;
   pragma Export (C, u00044, "system__bounded_stringsS");
   u00045 : constant Version_32 := 16#e0009d4d#;
   pragma Export (C, u00045, "system__crtlS");
   u00046 : constant Version_32 := 16#5bc565d8#;
   pragma Export (C, u00046, "system__dwarf_linesB");
   u00047 : constant Version_32 := 16#7a1a2f92#;
   pragma Export (C, u00047, "system__dwarf_linesS");
   u00048 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00048, "ada__charactersS");
   u00049 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00049, "ada__characters__handlingB");
   u00050 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00050, "ada__characters__handlingS");
   u00051 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00051, "ada__characters__latin_1S");
   u00052 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00052, "ada__stringsS");
   u00053 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00053, "ada__strings__mapsB");
   u00054 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00054, "ada__strings__mapsS");
   u00055 : constant Version_32 := 16#b8e43522#;
   pragma Export (C, u00055, "system__bit_opsB");
   u00056 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00056, "system__bit_opsS");
   u00057 : constant Version_32 := 16#92d16e94#;
   pragma Export (C, u00057, "system__unsigned_typesS");
   u00058 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00058, "ada__strings__maps__constantsS");
   u00059 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00059, "interfacesS");
   u00060 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00060, "system__address_imageB");
   u00061 : constant Version_32 := 16#07bb8f2d#;
   pragma Export (C, u00061, "system__address_imageS");
   u00062 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00062, "system__img_unsB");
   u00063 : constant Version_32 := 16#0d255263#;
   pragma Export (C, u00063, "system__img_unsS");
   u00064 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00064, "system__ioB");
   u00065 : constant Version_32 := 16#3815e558#;
   pragma Export (C, u00065, "system__ioS");
   u00066 : constant Version_32 := 16#f790d1ef#;
   pragma Export (C, u00066, "system__mmapB");
   u00067 : constant Version_32 := 16#9c26ad70#;
   pragma Export (C, u00067, "system__mmapS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#7188343d#;
   pragma Export (C, u00069, "system__mmap__os_interfaceB");
   u00070 : constant Version_32 := 16#1fc2f713#;
   pragma Export (C, u00070, "system__mmap__os_interfaceS");
   u00071 : constant Version_32 := 16#1e7d913a#;
   pragma Export (C, u00071, "system__mmap__unixS");
   u00072 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00072, "interfaces__cB");
   u00073 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00073, "interfaces__cS");
   u00074 : constant Version_32 := 16#b420f573#;
   pragma Export (C, u00074, "system__os_libB");
   u00075 : constant Version_32 := 16#d872da39#;
   pragma Export (C, u00075, "system__os_libS");
   u00076 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00076, "system__case_utilB");
   u00077 : constant Version_32 := 16#9982a443#;
   pragma Export (C, u00077, "system__case_utilS");
   u00078 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#c6413e82#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#6223cf16#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00082, "system__val_lliB");
   u00083 : constant Version_32 := 16#ca3980e7#;
   pragma Export (C, u00083, "system__val_lliS");
   u00084 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00084, "system__val_lluB");
   u00085 : constant Version_32 := 16#ff1fe376#;
   pragma Export (C, u00085, "system__val_lluS");
   u00086 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00086, "system__val_utilB");
   u00087 : constant Version_32 := 16#0af7a4e9#;
   pragma Export (C, u00087, "system__val_utilS");
   u00088 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00088, "system__exception_tracesB");
   u00089 : constant Version_32 := 16#8288328d#;
   pragma Export (C, u00089, "system__exception_tracesS");
   u00090 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00090, "system__wch_conB");
   u00091 : constant Version_32 := 16#bd2a30c5#;
   pragma Export (C, u00091, "system__wch_conS");
   u00092 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00092, "system__wch_stwB");
   u00093 : constant Version_32 := 16#903b1cc4#;
   pragma Export (C, u00093, "system__wch_stwS");
   u00094 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00094, "system__wch_cnvB");
   u00095 : constant Version_32 := 16#b29d8a36#;
   pragma Export (C, u00095, "system__wch_cnvS");
   u00096 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00096, "system__wch_jisB");
   u00097 : constant Version_32 := 16#32ed9317#;
   pragma Export (C, u00097, "system__wch_jisS");
   u00098 : constant Version_32 := 16#c2216981#;
   pragma Export (C, u00098, "system__taskingB");
   u00099 : constant Version_32 := 16#141170cc#;
   pragma Export (C, u00099, "system__taskingS");
   u00100 : constant Version_32 := 16#d51a3e48#;
   pragma Export (C, u00100, "system__task_primitivesS");
   u00101 : constant Version_32 := 16#bfbf116d#;
   pragma Export (C, u00101, "system__os_interfaceB");
   u00102 : constant Version_32 := 16#7baac831#;
   pragma Export (C, u00102, "system__os_interfaceS");
   u00103 : constant Version_32 := 16#7017a763#;
   pragma Export (C, u00103, "system__task_primitives__operationsB");
   u00104 : constant Version_32 := 16#9fa58b20#;
   pragma Export (C, u00104, "system__task_primitives__operationsS");
   u00105 : constant Version_32 := 16#71c5de81#;
   pragma Export (C, u00105, "system__interrupt_managementB");
   u00106 : constant Version_32 := 16#328bf158#;
   pragma Export (C, u00106, "system__interrupt_managementS");
   u00107 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00107, "system__multiprocessorsB");
   u00108 : constant Version_32 := 16#9efb8d64#;
   pragma Export (C, u00108, "system__multiprocessorsS");
   u00109 : constant Version_32 := 16#7d4d4c1d#;
   pragma Export (C, u00109, "system__os_constantsS");
   u00110 : constant Version_32 := 16#51f2d040#;
   pragma Export (C, u00110, "system__os_primitivesB");
   u00111 : constant Version_32 := 16#a1aa77e1#;
   pragma Export (C, u00111, "system__os_primitivesS");
   u00112 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00112, "system__task_infoB");
   u00113 : constant Version_32 := 16#264daf16#;
   pragma Export (C, u00113, "system__task_infoS");
   u00114 : constant Version_32 := 16#f0965c7b#;
   pragma Export (C, u00114, "system__tasking__debugB");
   u00115 : constant Version_32 := 16#58ee8924#;
   pragma Export (C, u00115, "system__tasking__debugS");
   u00116 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00116, "system__concat_2B");
   u00117 : constant Version_32 := 16#a4f7c5c7#;
   pragma Export (C, u00117, "system__concat_2S");
   u00118 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00118, "system__concat_3B");
   u00119 : constant Version_32 := 16#ad274eb2#;
   pragma Export (C, u00119, "system__concat_3S");
   u00120 : constant Version_32 := 16#b31a5821#;
   pragma Export (C, u00120, "system__img_enum_newB");
   u00121 : constant Version_32 := 16#c71b14d7#;
   pragma Export (C, u00121, "system__img_enum_newS");
   u00122 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00122, "system__img_lliB");
   u00123 : constant Version_32 := 16#b71847c6#;
   pragma Export (C, u00123, "system__img_lliS");
   u00124 : constant Version_32 := 16#6ec3c867#;
   pragma Export (C, u00124, "system__stack_usageB");
   u00125 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00125, "system__stack_usageS");
   u00126 : constant Version_32 := 16#5d91da9f#;
   pragma Export (C, u00126, "ada__tagsB");
   u00127 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00127, "ada__tagsS");
   u00128 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00128, "system__htableB");
   u00129 : constant Version_32 := 16#2295a1fd#;
   pragma Export (C, u00129, "system__htableS");
   u00130 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00130, "system__string_hashB");
   u00131 : constant Version_32 := 16#80cbca83#;
   pragma Export (C, u00131, "system__string_hashS");
   u00132 : constant Version_32 := 16#92f3335b#;
   pragma Export (C, u00132, "reportB");
   u00133 : constant Version_32 := 16#df19fbea#;
   pragma Export (C, u00133, "reportS");
   u00134 : constant Version_32 := 16#fc54e290#;
   pragma Export (C, u00134, "ada__calendarB");
   u00135 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00135, "ada__calendarS");
   u00136 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00136, "ada__text_ioB");
   u00137 : constant Version_32 := 16#971fad3a#;
   pragma Export (C, u00137, "ada__text_ioS");
   u00138 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00138, "ada__streamsB");
   u00139 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00139, "ada__streamsS");
   u00140 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00140, "interfaces__c_streamsB");
   u00141 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00141, "interfaces__c_streamsS");
   u00142 : constant Version_32 := 16#ec9c64c3#;
   pragma Export (C, u00142, "system__file_ioB");
   u00143 : constant Version_32 := 16#0126f372#;
   pragma Export (C, u00143, "system__file_ioS");
   u00144 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00144, "ada__finalizationS");
   u00145 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00145, "system__finalization_rootB");
   u00146 : constant Version_32 := 16#e9a56187#;
   pragma Export (C, u00146, "system__finalization_rootS");
   u00147 : constant Version_32 := 16#5bc888bf#;
   pragma Export (C, u00147, "system__file_control_blockS");
   u00148 : constant Version_32 := 16#9322406a#;
   pragma Export (C, u00148, "system__tasking__rendezvousB");
   u00149 : constant Version_32 := 16#d811d710#;
   pragma Export (C, u00149, "system__tasking__rendezvousS");
   u00150 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00150, "system__restrictionsB");
   u00151 : constant Version_32 := 16#ed25cb46#;
   pragma Export (C, u00151, "system__restrictionsS");
   u00152 : constant Version_32 := 16#69bd1289#;
   pragma Export (C, u00152, "system__tasking__entry_callsB");
   u00153 : constant Version_32 := 16#6342024e#;
   pragma Export (C, u00153, "system__tasking__entry_callsS");
   u00154 : constant Version_32 := 16#4e315ff7#;
   pragma Export (C, u00154, "system__tasking__initializationB");
   u00155 : constant Version_32 := 16#fc2303e6#;
   pragma Export (C, u00155, "system__tasking__initializationS");
   u00156 : constant Version_32 := 16#55e88911#;
   pragma Export (C, u00156, "system__soft_links__taskingB");
   u00157 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00157, "system__soft_links__taskingS");
   u00158 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00158, "ada__exceptions__is_null_occurrenceB");
   u00159 : constant Version_32 := 16#6fde25af#;
   pragma Export (C, u00159, "ada__exceptions__is_null_occurrenceS");
   u00160 : constant Version_32 := 16#263e126a#;
   pragma Export (C, u00160, "system__tasking__task_attributesB");
   u00161 : constant Version_32 := 16#4c97674c#;
   pragma Export (C, u00161, "system__tasking__task_attributesS");
   u00162 : constant Version_32 := 16#7f6ff536#;
   pragma Export (C, u00162, "system__tasking__protected_objectsB");
   u00163 : constant Version_32 := 16#15001baf#;
   pragma Export (C, u00163, "system__tasking__protected_objectsS");
   u00164 : constant Version_32 := 16#726dd94b#;
   pragma Export (C, u00164, "system__tasking__protected_objects__entriesB");
   u00165 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00165, "system__tasking__protected_objects__entriesS");
   u00166 : constant Version_32 := 16#83c8fb63#;
   pragma Export (C, u00166, "system__tasking__protected_objects__operationsB");
   u00167 : constant Version_32 := 16#343fde45#;
   pragma Export (C, u00167, "system__tasking__protected_objects__operationsS");
   u00168 : constant Version_32 := 16#cee82bbd#;
   pragma Export (C, u00168, "system__tasking__queuingB");
   u00169 : constant Version_32 := 16#6dba2805#;
   pragma Export (C, u00169, "system__tasking__queuingS");
   u00170 : constant Version_32 := 16#eb894f1f#;
   pragma Export (C, u00170, "system__tasking__utilitiesB");
   u00171 : constant Version_32 := 16#0f670827#;
   pragma Export (C, u00171, "system__tasking__utilitiesS");
   u00172 : constant Version_32 := 16#0780a76b#;
   pragma Export (C, u00172, "system__tasking__stagesB");
   u00173 : constant Version_32 := 16#bfc55b2f#;
   pragma Export (C, u00173, "system__tasking__stagesS");
   u00174 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00174, "system__memoryB");
   u00175 : constant Version_32 := 16#ff2a7423#;
   pragma Export (C, u00175, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.task_primitives%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  report%s
   --  report%b
   --  c74401k%b
   --  END ELABORATION ORDER

end ada_main;

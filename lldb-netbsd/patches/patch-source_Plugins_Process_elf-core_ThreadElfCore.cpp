$NetBSD$

--- source/Plugins/Process/elf-core/ThreadElfCore.cpp.orig	2018-02-02 18:39:12.000000000 +0000
+++ source/Plugins/Process/elf-core/ThreadElfCore.cpp
@@ -118,6 +118,9 @@ ThreadElfCore::CreateRegisterContextForF
 
     case llvm::Triple::NetBSD: {
       switch (arch.GetMachine()) {
+      case llvm::Triple::aarch64:
+        reg_interface = new RegisterInfoPOSIX_arm64(arch);
+        break;
       case llvm::Triple::x86_64:
         reg_interface = new RegisterContextNetBSD_x86_64(arch);
         break;

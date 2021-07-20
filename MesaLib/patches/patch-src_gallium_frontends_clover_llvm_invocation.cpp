$NetBSD$

Patch from FreeBSD ports graphics/mesa-dri 17.1.0

# fix errors like the following
#
# llvm/invocation.cpp:(.text+0x1275): undefined reference to `std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::c_str()
 const'
# /usr/bin/ld: ../../../../src/gallium/state_trackers/clover/.libs/libclover.a(libclllvm_la-invocation.o): relocation R_X86_64_PC32 against `_ZNKSt3__112bas
ic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strEv' can not be used when making a shared object; recompile with -fPIC
# /usr/bin/ld: final link failed: Bad value
#

--- src/gallium/frontends/clover/llvm/invocation.cpp.orig	2021-07-14 20:04:53.702990300 +0000
+++ src/gallium/frontends/clover/llvm/invocation.cpp
@@ -212,6 +212,10 @@ namespace {
       return get_lang_standard_from_version(device_version);
    }
 
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+   const char* cstr(const std::string& str) { return str.c_str(); }
+#endif
+
    std::unique_ptr<clang::CompilerInstance>
    create_compiler_instance(const device &dev, const std::string& ir_target,
                             const std::vector<std::string> &opts,
@@ -224,9 +228,13 @@ namespace {
       // Parse the compiler options.  A file name should be present at the end
       // and must have the .cl extension in order for the CompilerInvocation
       // class to recognize it as an OpenCL source file.
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+      std::vector<const char *> copts(opts.size());
+      std::transform(opts.begin(), opts.end(), copts.begin(), cstr);
+#else
       const std::vector<const char *> copts =
          map(std::mem_fn(&std::string::c_str), opts);
-
+#endif
       const target &target = ir_target;
       const cl_version device_clc_version = dev.device_clc_version();
 

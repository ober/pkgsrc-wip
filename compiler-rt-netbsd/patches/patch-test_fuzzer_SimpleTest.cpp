$NetBSD$

--- test/fuzzer/SimpleTest.cpp.orig	2017-08-19 18:02:19.287564326 +0000
+++ test/fuzzer/SimpleTest.cpp
@@ -0,0 +1,28 @@
+// This file is distributed under the University of Illinois Open Source
+// License. See LICENSE.TXT for details.
+
+// Simple test for a fuzzer. The fuzzer must find the string "Hi!".
+#include <assert.h>
+#include <cstddef>
+#include <cstdint>
+#include <cstdlib>
+#include <iostream>
+#include <ostream>
+
+static volatile int Sink;
+
+extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {
+  assert(Data);
+  if (Size > 0 && Data[0] == 'H') {
+    Sink = 1;
+    if (Size > 1 && Data[1] == 'i') {
+      Sink = 2;
+      if (Size > 2 && Data[2] == '!') {
+        std::cout << "BINGO; Found the target, exiting\n" << std::flush;
+        exit(0);
+      }
+    }
+  }
+  return 0;
+}
+

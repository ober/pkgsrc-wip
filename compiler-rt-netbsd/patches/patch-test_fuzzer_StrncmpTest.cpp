$NetBSD$

--- test/fuzzer/StrncmpTest.cpp.orig	2017-08-19 18:02:19.288579066 +0000
+++ test/fuzzer/StrncmpTest.cpp
@@ -0,0 +1,28 @@
+// This file is distributed under the University of Illinois Open Source
+// License. See LICENSE.TXT for details.
+
+// Simple test for a fuzzer. The fuzzer must find a particular string.
+#include <cstdint>
+#include <cstdio>
+#include <cstdlib>
+#include <cstring>
+
+static volatile int sink;
+
+extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {
+  // TODO: check other sizes.
+  const char *S = (const char*)Data;
+  if (Size >= 8 && strncmp(S, "123", 8))
+    sink = 1;
+  if (Size >= 8 && strncmp(S, "01234567", 8) == 0) {
+    if (Size >= 12 && strncmp(S + 8, "ABCD", 4) == 0) {
+      if (Size >= 14 && strncmp(S + 12, "XY", 2) == 0) {
+        if (Size >= 17 && strncmp(S + 14, "KLM", 3) == 0) {
+          fprintf(stderr, "BINGO\n");
+          exit(1);
+        }
+      }
+    }
+  }
+  return 0;
+}

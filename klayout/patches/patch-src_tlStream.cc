$NetBSD: patch-src_tlStream.cc,v 1.3 2018/07/24 13:00:10 ryoon Exp $

date: 2017-02-15 06:33:08 +0900;  author: joerg;  state: Exp;  commitid: BDodrFgUrNgNVXFz;
Add missing includes.

--- src/tl/tl/tlStream.cc.orig	2020-09-14 19:27:22.000000000 +0000
+++ src/tl/tl/tlStream.cc
@@ -30,6 +30,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <zlib.h>
+#include <unistd.h>
 #ifdef _WIN32 
 #  include <io.h>
 #endif

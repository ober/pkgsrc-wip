$NetBSD$

Avoid conflicting types for memmove(3).

--- lib/DtMmdb/btree_berkeley/memmove.c.orig	2022-10-01 17:18:27.000000000 +0000
+++ lib/DtMmdb/btree_berkeley/memmove.c
@@ -62,7 +62,7 @@ static char sccsid[] = "@(#)bcopy.c	8.1 
 #endif /* LIBC_SCCS and not lint */
 
 #include "cdefs.h"
-#include <string.h>
+#include <stddef.h>
 
 /*
  * sizeof(word) MUST BE A POWER OF TWO

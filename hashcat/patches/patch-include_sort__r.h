$NetBSD$

Tentatively fix the build for NetBSD

--- include/sort_r.h.orig	2022-01-05 22:11:43.619407583 +0000
+++ include/sort_r.h
@@ -25,7 +25,7 @@ Slightly modified to work with hashcat t
 */
 
 #if (defined __APPLE__ || defined __MACH__ || defined __DARWIN__ || \
-     defined __FreeBSD__ || defined __DragonFly__)
+     defined __FreeBSD__ || defined __DragonFly__ || defined __NetBSD__)
 #  define _SORT_R_BSD
 #  define _SORT_R_INLINE inline
 #elif (defined __linux__) || defined (__CYGWIN__)

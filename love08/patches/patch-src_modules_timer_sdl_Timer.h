$NetBSD$

Match include path for SDL<2

--- src/modules/timer/sdl/Timer.h.orig	2012-04-06 18:15:02.000000000 +0000
+++ src/modules/timer/sdl/Timer.h
@@ -22,7 +22,7 @@
 #define LOVE_TIMER_SDL_TIMER_H
 
 // SDL
-#include <SDL.h>
+#include <SDL/SDL.h>
 
 // LOVE
 #include <timer/Timer.h>

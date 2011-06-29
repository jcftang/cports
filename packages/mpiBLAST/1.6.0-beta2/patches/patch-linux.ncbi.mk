--- ncbi/platform/linux.ncbi.mk.orig	2010-07-12 12:10:28.360866000 +0100
+++ ncbi/platform/linux.ncbi.mk	2010-07-12 12:10:16.384626000 +0100
@@ -23,7 +23,7 @@
 NCBI_VIBLIBS = -lXmu -lXm -lXt -lSM -lICE -lXext -lXp -lX11 -ldl
 #warning! If you have only dynamic version of Motif or Lesstif
 #you should delete -Wl,-Bstatic sentence from the next line:
-NCBI_DISTVIBLIBS = -L/usr/X11R6/lib -lXmu -Wl,-Bstatic -lXm -Wl,-Bdynamic -lXt -lSM -lICE -lXext -lXp -lX11 -ldl
+NCBI_DISTVIBLIBS = -L/usr/X11R6/lib -lXmu -lXm -Wl,-Bdynamic -lXt -lSM -lICE -lXext -lXp -lX11 -ldl
 NCBI_OTHERLIBS = -lm
 NCBI_RANLIB = ranlib
 # Used by makedis.csh

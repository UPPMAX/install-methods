Build 47300, 2013-08-21, wesleys
================================
Used gcc 4.8 (4.7 was the minimum). Also loaded openmpi (built on gcc 4.6) 
and Picard (currently 1.92). Otherwise, performed a rather simple installation:

   ./configure --prefix=//////sw/apps/bioinfo/allpathslg/47300/kalkyl
   make
   make install

The module currently requires picard and gcc/4.8. 
Note that picard may not be needed but the path is needed for some operations.

SBT/1.0
=======

wesleys, 2015-04-15

New github repository: <https://github.com/Kingsford-Group/bloomtree>

LOG
---

1. Get source files since pre-built library won't run here (GLIBC mismatch).
Fetch from http://www.cs.cmu.edu/~ckingsf/software/bloomtree

2. Load recent GCC

     module load gcc/4.9.1 (minimum requirement)

3. Get and build SDSL
Actually used SDSL2 since SDSL is no longer being maintained.
Installed into package/cluster folder:

     git clone https://github.com/simongog/sdsl-lite.git
     cd sdsl-lite
     ./install.sh /sw/apps/bioinfo/SBT/0.1/milou/sdsl2

4. Define paths, assuming CPATH and LIBRARY_PATH were empty (otherwise, prepend)
Instructions claim requirement for SAILFISH. This is a typo for JELLYFISH (cf src files).
CPATH looks weird for Jellyfish but it needs the extra "2.1.4"
Setting LD_LIBRARY_PATH wasn't enough so also set LIBRARY_PATH.

     export LD_LIBRARY_PATH=/sw/apps/bioinfo/jellyfish/2.1.4/milou/lib:$LD_LIBRARY_PATH
     export LIBRARY_PATH=/sw/apps/bioinfo/jellyfish/2.1.4/milou/lib:/sw/apps/bioinfo/SBT/0.1/milou/sdsl2/lib
     export CPATH=/sw/apps/bioinfo/jellyfish/2.1.4/milou/include/jellyfish-2.1.4:/sw/apps/bioinfo/SBT/0.1/milou/sdsl2/include

5. Compile SBT

     cd ../src
     make

Manual install (cp)

Run "make clean" when switching to another cluster and, of course, replace the references to Milou.


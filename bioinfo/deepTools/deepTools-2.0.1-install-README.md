deepTools 2.0.1
===============

<https://deeptools.github.io/>

<https://github.com/fidelram/deepTools>


To facilitate installing on both tintin and milou, I switched to the older
python/2.7.6 module for this install.  This resulted in scipy being out of date
and being built/installed specifically for deepTools, so the pip command below
is easy to issue but takes a while to complete.


Log
---

    TOOLDIR=/sw/apps/bioinfo/deepTools
    VERSION=2.0.1
    CLUSTER=milou
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    mkdir -p mf
    VERSIONDIR=$TOOLDIR/$VERSION
    cd $VERSIONDIR
    mkdir -p $CLUSTER src
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    SRCDIR=$VERSIONDIR/src
    cd $SRCDIR
    wget https://github.com/fidelram/deepTools/archive/$VERSION.tar.gz
    tar xzf $VERSION.tar.gz 
    cd deepTools-$VERSION/
    module load python/2.7.6
    module load gcc/4.9.2
    module load libcurl/7.45.0
    module load bioinfo-tools
    module load ucsc-utilities/v287
    module load samtools/0.1.19

Make sure some needed executables can be found.

    which bigWigInfo
    which bedGraphToBigWig
    which samtools

Install using pip (yippee!).  The deepTools-1.5.11-install-README.md file shows an
older method, this is much easier.  Note we need $CLUSTERDIR set correctly.

    cd $CLUSTERDIR
    PYTHONUSERBASE=$CLUSTERDIR pip install deeptools --user

While the above is running, make sure it is installing the version you mean
(here, 2.0.1).

In the mf, prepend $modroot/lib/python2.7/site-packages to PYTHONPATH and add
$modroot/bin to PATH.  These changes are the same as for the 1.5.11 mf, but
note the switch to the older python is also reflected in the mf.  We also must
set LD_LIBRARY_PATH to find the gcc/4.9.2 libraries, it seems looking for them
from within a .so file (in this case
/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/scipy/special/_ufuncs.so)
does not honour or maybe set something like RPATH, because ldd finds it without LD_LIBRARY_PATH set:

    milou-b: /sw/apps/bioinfo/deepTools/2.0.1/milou/bin $ ldd ../lib/python2.7/site-packages/scipy/special/_ufuncs.so
        linux-vdso.so.1 =>  (0x00007ffd007d2000)
        liblapack.so.3 => /usr/lib64/atlas/liblapack.so.3 (0x00002b734708d000)
        libblas.so.3 => /usr/lib64/libblas.so.3 (0x00002b73478af000)
        libgfortran.so.3 => /sw/comp/gcc/4.9.2_milou/lib64/libgfortran.so.3 (0x00002b7347b06000)
        libm.so.6 => /lib64/libm.so.6 (0x00002b7347e23000)
        libpython2.7.so.1.0 => /sw/comp/python/2.7.6_milou/lib/libpython2.7.so.1.0 (0x00002b73480a8000)
        libgcc_s.so.1 => /sw/comp/gcc/4.9.2_milou/lib64/libgcc_s.so.1 (0x00002b7348488000)
        libquadmath.so.0 => /sw/comp/gcc/4.9.2_milou/lib64/libquadmath.so.0 (0x00002b734869e000)
        libc.so.6 => /lib64/libc.so.6 (0x00002b73488dc000)
        libf77blas.so.3 => /usr/lib64/atlas/libf77blas.so.3 (0x00002b7348c70000)
        libcblas.so.3 => /usr/lib64/atlas/libcblas.so.3 (0x00002b7348e8d000)
        libpthread.so.0 => /lib64/libpthread.so.0 (0x00002b73490ae000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00002b73492cb000)
        libutil.so.1 => /lib64/libutil.so.1 (0x00002b73494cf000)
        /lib64/ld-linux-x86-64.so.2 (0x0000003000000000)
        libatlas.so.3 => /usr/lib64/atlas/libatlas.so.3 (0x00002b73496d3000)

but running the plotPCA tool it ends up examining the system version which is not correct:

    milou-b: /sw/apps/bioinfo/deepTools $ plotPCA
    Traceback (most recent call last):
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/bin/plotPCA", line 4, in <module>
        from deeptools.plotPCA import main
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/deeptools/plotPCA.py", line 8, in <module>
        from deeptools.correlation import Correlation
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/deeptools/correlation.py", line 5, in <module>
        import scipy.stats
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/scipy/stats/__init__.py", line 338, in <module>
        from .stats import *
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/scipy/stats/stats.py", line 180, in <module>
        import scipy.special as special
      File "/sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/scipy/special/__init__.py", line 627, in <module>
        from ._ufuncs import *
    ImportError: /usr/lib64/libgfortran.so.3: version `GFORTRAN_1.4' not found (required by /sw/apps/bioinfo/deepTools/2.0.1/milou/lib/python2.7/site-packages/scipy/special/_ufuncs.so)

For tintin, I built inside src_tintin/ rather than src/.

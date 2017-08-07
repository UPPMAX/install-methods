cufflinks/2.2.1-b55bb21
=======================

Build from source in the github tree (**not** the tagged 2.2.1 release), which includes a
fix for an abberant issue involving data structures, described at
<https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!topic/tuxedo-tools-users/UzLCJhj3lUE>.

Cufflinks' developers bumped the version to 2.2.2 in the source tree's
[`configure.ac`](https://github.com/cole-trapnell-lab/cufflinks/blame/master/configure.ac),
but there's no tagged release with that version and no other indication of the
source tree being that version.  Since cufflinks is a widely used tool and the
build procedure described below fixes the source tree on a specific commit, I
am versioning using the previous official release, suffixed with that commit.

This procedure uses samtools 1.2 for the BAM libraries.


LOG
---

`COMMIT_HASH` holds the full hash for the commit we want.  For versioning, we want the first 7 characters.

    COMMIT_HASH=b55bb214ad4abeb58a1435d8f7a7f0dd8bed8b76
    VERSION=2.2.1-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir /sw/apps/bioinfo/cufflinks/$VERSION
    cd /sw/apps/bioinfo/cufflinks/$VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    SRCDIR=$PWD
    module load git/2.10.2
    module load build-tools
    module load automake/1.14.1
    module load autoconf/2.69
    module load m4/1.4.17

On milou:

    module load gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2

On rackham:

    module load gcc/5.3.0
    module load boost/1.61.0_gcc5.3.0

Clone the repository and make sure the head is reset to this commit
(following guidance from <https://stackoverflow.com/questions/3489173/how-to-clone-git-repository-with-specific-revision-changeset>).

    git clone https://github.com/cole-trapnell-lab/cufflinks
    cd cufflinks
    git reset --hard $COMMIT_HASH

### Eigen

Get the Eigen prerequisite (<http://eigen.tuxfamily.org/>).

    cd ..  # should be in src_$CLUSTER now
    mkdir -p Eigen/install-dir
    cd Eigen/install-dir
    EIGENDIR=$PWD
    cd ..
    wget http://bitbucket.org/eigen/eigen/get/3.3.4.tar.bz2
    tar xjf 3.3.4.tar.bz2
    cd eigen-eigen-5a0156e40feb
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$EIGENDIR -DINCLUDE_INSTALL_DIR=$EIGENDIR/include ..
    make install

Eigen include files are now installed in `$EIGENDIR/include/`.  The above sets
`INCLUDE_INSTALL_DIR` so it doesn't include an intervening `eigen3` directory,
which cufflinks is not expecting.

### Samtools compilation and directory setup

There appears to be no default installation or source samtools configuration
available with a source bundle from samtools that matches the directory
structure that cufflinks expects for its BAM libraries.  Perhaps this is
available with a system-installable package via a package manager for some
Linux releases.  The link cufflinkns provides for help when there are problems
looking for the BAM libraries during configuration (http://randspringer.de/bam)
no longer works.

Here's a procedure that should work.  This is specific to buildling against the
newer htslib-containing samtools 1.x versions.  With some modifications, it
might work with the earlier 0.x versions.

Set up the directories and build samtools following its procedure.  For this
module, I did:

    cd $SRCDIR
    mkdir samtools-1.2
    cd samtools-1.2
    wget https://downloads.sourceforge.net/project/samtools/samtools/1.2/samtools-1.2.tar.bz2
    tar xjf samtools-1.2.tar.bz2
    cd samtools-1.2
    make
    cd ..

Now set up the samtools directory for building.  Installation via `make prefix=... install` does **not** do it.

    mkdir install-dir
    cd install-dir
    mkdir -p include/bam
    cp -av ../samtools-1.2/*.h include/bam/
    cd include/bam
    ln -s version.h version.hpp
    cd ../..
    cp -av ../samtools-1.2/htslib-1.2.1/htslib include/bam/
    mkdir lib
    cp -av ../samtools-1.2/libbam.a lib/
    cp -av ../samtools-1.2/htslib-1.2.1/libhts.a lib/

To double-check, while still standing in `install-dir/` you should get something like this from `ls -R`:

    .:
    include  lib

    ./include:
    bam

    ./include/bam:
    bam.h          bam_plbuf.h  kprobaln.h    samtools.h
    bam2bcf.h      bam_tview.h  sam.h         stats_isize.h
    bam_endian.h   errmod.h     sam_header.h  version.h
    bam_lpileup.h  htslib       sample.h      version.hpp

    ./include/bam/htslib:
    bgzf.h   hts_defs.h       klist.h     kstring.h            tbx.h
    faidx.h  kfunc.h          knetfile.h  regidx.h             vcf.h
    hfile.h  khash.h          kseq.h      sam.h                vcf_sweep.h
    hts.h    khash_str2int.h  ksort.h     synced_bcf_reader.h  vcfutils.h

    ./lib:
    libbam.a  libhts.a

If this looks OK, then still standing in `install-dir/` set a shell variable to this location to use later.

    BAM_ROOT=$PWD

### Cufflinks configuration changes

There are some configuration changes that need to be made so that cufflinks can be built with Eigen and samtools.

    cd $SRCDIR
    cd cufflinks

* So that Eigen can be found correctly, change `configure.ac` following [this pull request](https://github.com/cole-trapnell-lab/cufflinks/pull/76/commits/cdcf9c85468c8ea057f618132675c05dd00f03be).  The pull request contains three changes.  The second change is just the deletion of a commented-out line and not required.  The first and third changes from the pull request are:
    * Following line 6 where `m4_include([ax_check_zlib.m4])` is found, create a new line 7 containing `+m4_include([ax_check_eigen.m4])`
    * Around line 111 to 113, depending on the other changes you've made to `configure.ac`, is a line that begins with `CXXFLAGS=` that includes a reference to a variable `${EIGEN3_CPPFLAGS}`.  Change this to refer to `${EIGEN_CPPFLAGS}`.  The complete line should read `CXXFLAGS="${CXXFLAGS} ${BOOST_CPPFLAGS} ${BAM_CPPFLAGS} ${EIGEN_CPPFLAGS}"`.

* So that newer samtools can be used, modify the script `ax_bam.m4`, which is used to find the files for the BAM library, so that it includes both `libbam.a` and `libhts.a` when linking:
    * Within line 192, which sets `BAM_LIB`, add ` -lhts`.  The complete line should read `BAM_LIB="-lbam -lhts"`.

These configuration changes are persistent, so you can reconfigure and Eigen
and BAM libraries can still be found.  The changes will be required after
unpacking a fresh tarball.

### Generate the ./configure script

Finally, generate the final `./configure` script.  This generates a number of
warnings about files being in subdirectories, but (so far) it has been OK to
ignore these.

    autoreconf --install

### ./configure

Configure cufflinks for buildling.  The variables `PFX`, `EIGENDIR` and
`BAM_ROOT` are set above, and `BOOST_ROOT` is set when loading the `boost`
module.

    ./configure --prefix=$PFX --with-boost=$BOOST_ROOT --with-eigen=$EIGENDIR --with-bam=$BAM_ROOT

### Build and install!

Finally, build cufflinks tools:

    make

It takes a while, and are many warnings during building, but they appear
harmless.

If you forget to make the configuration change which includes `libhts.a` in the
final link, you'll see many errors at link time, the first of which may be
something like

    libcufflinks.a(hits.o): In function `samread':
    /sw/apps/bioinfo/cufflinks/2.2.1-b55bb21/src_milou/samtools-1.2/install-dir/include/bam/sam.h:95: undefined reference to `sam_read1'

... and install:

    make install

To match the directory structure of the modules which use precompiled binaries,
lift the executables up one directory to be immediately under the cluster
directory.

    cd $PFX
    mv bin/* .
    rmdir bin

Check RPATH information in the executables when no modules are loaded to be
sure all shared libraries can be found, including the boost ones.

    module unload boost autoconf automake m4 git build-tools gcc
    ldd *



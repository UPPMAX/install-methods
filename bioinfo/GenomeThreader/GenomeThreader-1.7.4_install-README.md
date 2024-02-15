GenomeThreader/1.7.4
====================

<http://genomethreader.org/>

Used under license:
Custom AS IS
<https://genomethreader.org/download.html>

Structure creating script (makeroom_GenomeThreader_1.7.4.sh) moved to /sw/bioinfo/GenomeThreader/makeroom_1.7.4.sh

To accomplish the installation of this version, I had to build from source. This is difficult.

I previously tried to use the prebuilt 1.7.3 version:

    wget http://genomethreader.org/distributions/gth-${VERSION}-Linux_x86_64-64bit.tar.gz
    tar xf gth-${VERSION}-Linux_x86_64-64bit.tar.gz 
    rmdir $PREFIX && mv gth-${VERSION}-Linux_x86_64-64bit $PREFIX
    cd $PREFIX
    ./gth --version

Uh-oh!!! turns out the prebuilt version 1.7.3 needs a later OS version than we have, by requiring GLIBC_2.27.

    ./gth: /lib64/libc.so.6: version `GLIBC_2.27' not found (required by ./gth)

I've written the developer about it, we'll see what happens.

Got an answer 26 July 2023 19:09

    Everything you need to build GenomeThreader yourself is open-source, but the build process is a bit convoluted.

    In order to build GenomeThreader you first need to build libgenometools and libraries from "vstree".
    All these three directories (genomethreader, genometools, and vstree) need to be in the same parent directory, so they have to be "parallel" to each other.

    Just clone these repos:

    https://github.com/genometools/genometools
    https://github.com/genometools/vstree
    https://github.com/genometools/genomethreader

    This script gives you probably the best pointers on how to compile GenomeThreader:

    https://github.com/genometools/gtmetascripts/blob/master/build_all.sh

    I used it to build GenomeThreader for various platforms on my Linux laptop. But I have since then switched the distribution I am using and don't have the necessary cross compilers available anymore.

    Best,

    Gordon

I followed this, and there were several bits of the tool that needed update.
But in the end I ended up with a 1.7.4 distributable bundle, and installed that.


LOG
---

    makeroom.sh "-f" "-s" "annotation" "-t" "GenomeThreader" "-v" "1.7.4" "-w" "http://genomethreader.org/" "-l" "Custom AS IS" "-L" "https://genomethreader.org/download.html" "-d" "software tool to compute gene structure predictions"
    ./makeroom_GenomeThreader_1.7.4.sh 
    source /sw/bioinfo/GenomeThreader/SOURCEME_GenomeThreader_1.7.4
    cd $SRCDIR

    ml git/2.34.1
    ml gcc/12.3.0

    git clone --recursive https://github.com/genometools/genometools
    git clone --recursive  https://github.com/genometools/vstree
    git clone --recursive   https://github.com/genometools/genomethreader

Following build instructions at https://github.com/genometools/gtmetascripts/blob/master/build_all.sh

Set up temp and dist directories.

    cd $SRCDIR
    TMPFILE=`mktemp`
    export DISTDIR=$PWD/distall
    mkdir -p $DISTDIR


### Build genometools

Final step adds this `bin/` to `PATH`.

    cd genometools/
    make clean
    make wrapmemcpy=yes      CPPFLAGS='-fno-stack-protector -U_FORTIFY_SOURCE -D_GNU_SOURCE'      cairo=no $*
    make wrapmemcpy=yes      CPPFLAGS='-fno-stack-protector -U_FORTIFY_SOURCE -D_GNU_SOURCE'      cairo=no dist > $TMPFILE
    DISTRIBUTION=`tail -n 1 $TMPFILE`
    echo $DISTRIBUTION
    cp -f $DISTRIBUTION $DISTDIR
    cd $SRCDIR

    export PATH="$PWD/genometools/bin:$PATH"


### Build vstree/vmatch

Change to this tree.

    cd vstree/src

We first need to replace a source file, and adjust some compilation and tool
usage. It will not build without this.

#### Replace kurtz-basic/space.c

Here we replace this with a source file from a pull request at vstree.

    cd kurtz-basic
    mv space.c space.c.old
    wget -O space.c https://raw.githubusercontent.com/genometools/vstree/f9057e6ec37637133a4ab010a4361f33db3aca3c/src/kurtz-basic/space.c
    cd ..

#### Remove -Werror

Now we remove some uses of `-Werror` in makefiles since gcc/12.3.0 turns some
previous warnings into errors. It is not clear that adding -m64 is required for
Vmatch/SELECT/makefile, but just for safety I've added it.

    sed -i 's/-Werror//g' Makedef-linux-gcc-64
    sed -i 's/-Werror/-m64/g' Vmatch/SELECT/makefile 

#### Replace 'skproto' with 'gt dev skproto'

Here GenomeTools' `gt` is used to generate prototype wrappers. An older scheme
is used, or perhaps a custom scheme is used. This was noted in the Debian patch
https://sources.debian.org/src/vmatch/2.3.1+dfsg-8/debian/patches/skproto.patch/

double-check that files not already changes

    FILES=$(O
    sed -i 's/skproto /gt dev skproto /' Mkvtree/Filegoals.mf Vmatch/Filegoals.mf Vmengine/Filegoals.mf Vmengine/Makefile bin/mkfilegoals.pl kurtz/Filegoals.mf kurtz/Mkprotodef.sh kurtz/libtest/Filegoals.mf

#### Make utility scripts available

We need to add the `bin/` utility scripts directory and `doc/` to PATH, that's
the PATH adjustment.  The `mklink.sh` usage is a script from the bin directory,
and `findemptyoutfiles.sh` is a script from doc.

    export PATH="$PWD/bin:$PWD/doc:$PATH"
    mklink.sh linux-gcc-64

#### Now build

For the dist step, we must touch a few PDFs in `doc/` to get it to complete.

    make cleanup
    make 64bit=yes      wrapmemcpy=yes      licensemanager=no      $*

    touch doc/{virtman,chain2dim,matchcluster}.pdf
    make 64bit=yes      wrapmemcpy=yes      licensemanager=no      dist > $TMPFILE

    DISTRIBUTION=`tail -n 1 $TMPFILE`
    cp -f $DISTRIBUTION $DISTDIR
    cd $SRCDIR


### Finally build genomethreader

For the dist step, we need to copy over the `bin/bssm/` directory from the 1.7.1 version of the module.

    cd genomethreader/
    make clean
    make 64bit=yes      wrapmemcpy=yes      licensemanager=no      amalgamation=yes $*

Prior to wrapping up the dist package, we need to copy over the `bin/bssm/`
directory from the released 1.7.3 dist package with the executables we can't
run. These are identical to those in the 1.7.1 module, but as it's newer, it's
more safe for future steps.

    pushd .
    cd $SRCDIR
    wget https://genomethreader.org/distributions/gth-1.7.3-Linux_x86_64-64bit.tar.gz
    tar xf gth-1.7.3-Linux_x86_64-64bit.tar.gz
    popd
    cp -av $SRCDIR/gth-1.7.3-Linux_x86_64-64bit/bin/bssm bin/
    pushd .
    cd $SRCDIR
    rm -rf gth-1.7.3-Linux_x86_64-64bit
    popd

    make 64bit=yes      wrapmemcpy=yes      licensemanager=no      amalgamation=yes dist > $TMPFILE

    DISTRIBUTION=`tail -n 1 $TMPFILE`
    cp -f $DISTRIBUTION $DISTDIR
    cd $SRCDIR



## Install genomethreader 1.7.4 from distribution tarball

    cd $SRCDIR
    cd distall
    rmdir $PREFIX
    tar xvf gth-1.7.4-Linux_x86_64-64bit.tar.gz
    mv gth-1.7.4-Linux_x86_64-64bit $PREFIX


## Wrap up

Edit the mf to reflect the nature of this build. Make its own copy, remove the
makeroom-created symlink.

    cd $TOOLDIR/mf
    rm -f 1.7.4 && cp -pv 1.7.1 1.7.4
    vi 1.7.4

    cd $TOOLDIR
    ./GenomeThreader-1.7.4_post-install.sh

Write up this compilicated README.

    history >> GenomeThreader-1.7.4_install-README.md
    vi GenomeThreader-1.7.4_install-README.md


freebayes/1.1.0
===============

<https://github.com/ekg/freebayes>

LOG
---

Build on milou for all clusters.  There are 58 commits to the master branch
since the 1.1.0 release, and an open issue where the developer suggests creating
a new release tag; the master branch builds with gcc6 but not the 1.1.0 release.
We are just cloning the 1.1.0 release, see the `git` command below for how
we did that.

When done building, make sure RPATH is set in the executables.  Also, since there
are subdirectories `python/` and `scripts/` that have utility things users might 
want, move the whole cloned directory as the cluster directory when the build is
done.  Also, define `FREEBAYES_ROOT` in the mf file.

    TOOL=/sw/apps/bioinfo/freebayes
    VERSION=1.1.0
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    module load git/2.10.2
    module load gcc/5.3.0
    git clone -b v${VERSION} --single-branch --depth 1 --recursive https://github.com/ekg/freebayes.git
    cd freebayes/
    make
    ldd bin/bamleftalign 
    ldd bin/freebayes 
    cd ..
    mv freebayes ../$CLUSTER
    for C in rackham irma bianca ; do         ln -s $CLUSTER $C;     done


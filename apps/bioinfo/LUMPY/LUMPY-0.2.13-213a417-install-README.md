LUMPY/0.2.13-213a417
====================

<https://github.com/arq5x/lumpy-sv/>

LOG
---

#I did not install this for milou since it didn't compile correctly.

#On rackham

    TOOL=LUMPY
    VERSION=0.2.13-97cf18c
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_LUMPY_0.2.13-97cf18c.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/arq5x/lumpy-sv.git
    module load gcc/6.3.0
    module load bioinfo-tools
    module load pysam/0.13-python2.7.11
    module load sambamba/0.6.6
    module load samblaster/0.1.24
    module load samtools/1.2
    cd lumpy-sv
    make
    mkdir -p  /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin
    cp -av bin/*  /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin/


For the mf file, we need

    module load pysam/0.13-python2.7.11
    module load sambamba/0.6.6
    module load samblaster/0.1.24
    module load samtools/1.2

####
####
####

Here's my version, for LUMPY on milou, built also for CentOS 7 on irma.  Note I
use the full commit hash, extract a substring of it for the versioning, and
`git clone` followed by `git reset --hard` to that commit hash.  This is a
reproducible approach for fixing installations on specific commits, otherwise
the source tree is reproducible with `git clone` only so long as the desired
commit is the most recent.

I also started out seeing this error after `make`:

    configure.ac:26: error: possibly undefined macro: m4_esyscmd_s
          If this token and others are legitimate, please use m4_pattern_allow.
          See the Autoconf documentation.
    autoreconf: /usr/bin/autoconf failed with exit status: 1

and the build failed with

    configure: creating ./config.status
    config.status: creating config.mk
    config.status: creating htslib.pc.tmp
    config.status: error: cannot find input file: config.h.in
    make: *** [htslib] Error 1

When a tool (in this case the submodule htslib) uses the `./configure`
mechanism to construct makefiles, these kinds of errors are often the result of
autoconf/automake/m4 issues that appear when starting with a source tree that
is a clone of a repository.

In code trees of repositories, a final `./configure` is not necessarily
present.  The skeleton files for buildling a final `./configure` are there, and
a mature makefile will recognise when `./configure` is out of date and thus
needs rebuilding and will do so, using autoconf/automake/m4.  However, the
system versions on milou are quite old.  More up-to-date versions can be loaded
with

    module load build-tools automake/1.14.1 autoconf/2.69 m4/1.4.17

Release tarballs usually have up-to-date `./configure` files and this is
unnecessary.  This is an occasional source of build headaches and these can
often be solved on milou simply by loading the above modules.

If the developer hasn't implemented automatic regeneration of `./configure`,
then some parts of autoconf/autoreconf/automake might need to be run
explicitly.  For example see the Jellyfish or Quorum repositories of
<https://github.com/gmarcais> for tarball-vs-clone distinctions.

I've updated to the latest commit there, which claims to adds CRAM support.

    TOOL=LUMPY
    COMMIT_HASH=213a4171131cc12b20b8fb9f0428886aaead6344
    VERSION=0.2.13-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir -p $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER/bin
    rm -rf $CLUSTER
    case $CLUSTER in
        rackham) for CC in bianca irma    ; do rm -f $CC ; ln -s $CLUSTER $CC ; done ;;
        irma)    for CC in bianca rackham ; do rm -f $CC ; ln -s $CLUSTER $CC ; done ;;
    esac
    mkdir src
    cd src
    [[ -d lumpy-sv ]] && rm -rf lumpy-sv
    module load git/2.16.1
    git clone --recursive https://github.com/arq5x/lumpy-sv.git
    cd lumpy-sv
    git reset --hard $COMMIT_HASH
    module load gcc/6.3.0
    module load build-tools automake/1.14.1 autoconf/2.69 m4/1.4.17
    module load python/2.7.11
    module load bioinfo-tools
    module load pysam/0.13-python2.7.11
    module load sambamba/0.6.6
    module load samblaster/0.1.24
    module load samtools/1.2
    make
    mkdir -p $PFX
    cp -av bin/* $PFX/


Strelka2/2.9.3
===============

<https://github.com/Illumina/strelka>

LOG
---

Downloaded binary and tested it extensivly. It works by using 

    scriptDir=os.path.abspath(os.path.dirname(__file__)) 

which should work with the modpath setting to fetch the correct path on each
cluster. I put `bin/` `lib/` and `libexec/` in CLUSTER. I placed the `shared/`
directory in the modroot, but it might have to move if later versions do not
use the same. I placed a symlink to that directory in CLUSTER.

    VERSION=2.9.3
    mkdir -p /sw/apps/bioinfo/Strelka2/${VERSION}
    cd /sw/apps/bioinfo/Strelka2/${VERSION}
    mkdir rackham
    PFX=$PWD/rackham
    for CL in milou irma bianca ; do ln -s rackham $CL; done
    mkdir src
    cd src
    [[ -f strelka-${VERSION}.centos6_x86_64.tar.bz2 ]] || wget https://github.com/Illumina/strelka/releases/download/v${VERSION}/strelka-${VERSION}.centos6_x86_64.tar.bz2
    UNPACKDIR=strelka-${VERSION}.centos6_x86_64
    [[ -d $UNPACKDIR ]] && rm -rf $UNPACKDIR
    tar xjfv strelka-${VERSION}.centos6_x86_64.tar.bz2
    cp -av $UNPACKDIR/{lib,libexec,bin,share} $PFX/
    rm -rf $UNPACKDIR


Strelka2/2.8.4
===============

<https://github.com/Illumina/strelka>

LOG
---

Downloaded binary and tested it extensivly. It works by using 

    scriptDir=os.path.abspath(os.path.dirname(__file__)) 

which should work with the modpath setting to fetch the correct path on each cluster. I put `bin/` `lib/` and `libexec/` in CLUSTER. I placed the shared/ directory in the modroot, but it might have to move if later versions do not use the same. I placed a symlink to that directory in CLUSTER.

    VERSION=2.8.4
    mkdir -p /sw/apps/bioinfo/Strelka2/${VERSION}
    cd /sw/apps/bioinfo/Strelka2/${VERSION}
    mkdir src; cd src
    wget https://github.com/Illumina/strelka/releases/download/v${VERSION}/strelka-${VERSION}.centos6_x86_64.tar.bz2
    tar xjfv strelka-${VERSION}.centos6_x86_64.tar.bz2
    cp -av src/strelka-${VERSION}.centos6_x86_64/{lib,libexec,bin} milou/
    cp -av src/strelka-${VERSION}.centos6_x86_64/shared ../
    cd milou/
    ln -s ../../share/ .

MELT/2.0.2
==========

Mobile Element Locator Tool

<http://melt.igs.umaryland.edu/>


LOG
---

    cd /sw/apps/bioinfo
    mkdir MELT
    cd MELT
    VERSION=2.0.2
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src

Because of licence, must agree, so download MELT tarball to personal computer then to UPPMAX.

    rsync -Pa douglasscofield@fb166.ebc.uu.se:Downloads/Meltv${VERSION}.tar.gz .
    tar xvzf Meltv${VERSION}.tar.gz 

Create `$CLUSTER` directory from head directory of tarball.

    mv MELTv${VERSION} ../$CLUSTER
    cd ..

Use symlinks for the other cluster directories, since it's java.

In the mf file, load a java 8 and bowtie2/2.3.2.

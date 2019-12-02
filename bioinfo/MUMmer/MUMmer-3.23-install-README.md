MUMmer/3.23
===========

    http://mummer.sourceforge.net/


LOG
---

    TOOL=MUMmer
    VERSION=3.23
    cd /sw/
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSION
    mkdir src
    cd src
    wget http://downloads.sourceforge.net/project/mummer/mummer/3.23/MUMmer3.23.tar.gz
    tar xvzf MUMmer3.23.tar.gz
    cd MUMmer3.23
    make CXXFLAGS="-O3 -DSIXTYFOURBITS" CFLAGS="-O3 -DSIXTYFOURBITS"
    mv * ../../milou/
    cd ..
    rmdir MUMmer3.23

Do the same for tintin.

Copy the mf from /sw/mf/common/bioinfo-tools/alignment/MUMmer/3.22.  No changes necessary.

Update
------

Needed to come in later and have the perl scripts use `#!/usr/bin/env perl`.
It tries to be dynamic by assigning the perl path at installation time but
doesn't use the `env` mechanism.  Hopefully MUMmer4 does better.


MUMmer/3.23
===========

Picked up 3.23 from <http://mummer.sourceforge.net/>


LOG
---

    TOOL=MUMmer
    VERSION=3.23
    cd /sw/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    PREFIX=$PWD/$CLUSTER
    #  do not make $CLUSTER directory, that will be the unpacked tarball
    for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    mkdir src
    cd src
    module load perl/5.18.4
    module load gcc/6.3.0
    wget https://downloads.sourceforge.net/project/mummer/mummer/${VERSION}/MUMmer${VERSION}.tar.gz
    tar xzf MUMmer${VERSION}.tar.gz
    mv MUMmer${VERSION} $PREFIX
    cd $PREFIX
    make clean
    make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"

Finally, change perl #! lines to use env mechanism.

    sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)

MUMmer/3.22
===========

Picked up 3.22 from <http://mummer.sourceforge.net/>


LOG
---

    TOOL=MUMmer
    VERSION=3.22
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

----
From Agback's earlier build notes:

    make

kopiera hela directoryt till //////sw/apps/bioinfo/MUMmer/3.22/kalkyl

Jag har tester i: /bubo/home/staff/agback/kalkyl/mummer-test

Kör:

    mummer -mum -b -c H_pylori26695_Eslice.fasta H_pyloriJ99_Eslice.fasta > mummer.mums
    mummerplot -x "[0,275287]" -y "[0,265111]" -postscript -p mummer mummer.mums
    run-mummer3 H_pylori26695_Eslice.fasta H_pyloriJ99_Eslice.fasta mummer3

Ska inte ge några fel, men skapa ett antal mummer.* filer.


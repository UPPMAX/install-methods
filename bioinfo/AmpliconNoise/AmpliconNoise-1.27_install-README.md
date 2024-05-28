AmpliconNoise/1.27
==================

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=1.27
    TOOL=/sw/apps/bioinfo/AmpliconNoise

    mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
    cd $TOOL/src
    wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ampliconnoise/AmpliconNoiseV$VERSION.tar.gz
    tar xf AmpliconNoiseV$VERSION.tar.gz
    cd AmpliconNoiseV$VERSION
    module load gcc
    module load openmpi
    module load bioinfo-tools
    module load gsl/2.3
    module load MAFFT/7.407
    make clean
    make
    make install
    mv bin ../../$VERSION/$CLUSTER/
    mv Scripts ../../$VERSION/$CLUSTER/
    mv data ../../$VERSION/$CLUSTER/
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod -R g+rwx $TOOL/$VERSION

    # Test installation by running Run.sh C005.dat in the Test directory

    # Remember to set AMPLICON_NOISE_HOME PYRO_LOOKUP_FILE SEQ_LOOKUP_FILE in the module file

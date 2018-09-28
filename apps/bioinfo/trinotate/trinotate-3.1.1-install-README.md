trinotate/3.0.2
===============

# Ensure ALL prerequisites and recommended packages and changes are available/made

    VERSION=3.1.1
    CLUSTER=rackham
    TOOL=/sw/apps/bioinfo/trinotate
    mkdir -p $TOOL/src $TOOL/$VERSION
    cd $TOOL/src
    wget https://github.com/Trinotate/Trinotate/archive/Trinotate-v3.1.1.tar.gz
    tar xf Trinotate-v3.1.1.tar.gz
    mv Trinotate-Trinotate-v3.1.1 ../$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for C in irma bianca ; do ln -s $CLUSTER $C; done

# Look into the admin/util directory for scripts that use #!/usr/bin/perl - change that into #!/usr/bin/env perl

# Make sure everything that will go in the mf file can be loaded.

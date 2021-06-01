trinotate/3.2.2
========================

<https://github.com/Trinotate/Trinotate.github.io/wiki>

Used under license:
Custom open-source \'AS IS\'
<https://github.com/Trinotate/Trinotate/blob/master/LICENSE.txt>

Structure creating script (makeroom_trinotate_3.2.2.sh) moved to /sw/bioinfo/trinotate/makeroom_3.2.2.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "trinotate" -v "3.2.2" -w "https://github.com/Trinotate/Trinotate.github.io/wiki" -l "Custom open-source \\'AS IS\\'" -L "https://github.com/Trinotate/Trinotate/blob/master/LICENSE.txt" -d "comprehensive annotation suite designed for automatic functional annotation of transcriptomes\\, particularly de novo assembled transcriptomes\\, from model or non-model organisms"
    ./makeroom_trinotate_3.2.2.sh
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

fineSTRUCTURE/4.1.1
========================

<https://people.maths.bris.ac.uk/~madjl/finestructure/finestructure.html>

Used under license:
Free for noncommercial use
<>

Structure creating script (makeroom_fineSTRUCTURE_4.1.1.sh) moved to /sw/bioinfo/fineSTRUCTURE/makeroom_4.1.1.sh

LOG
---

    TOOL=fineSTRUCTURE
    VERSION=4.1.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/fineSTRUCTURE/4.1.1/src
    /home/douglas/bin/makeroom.sh -f" -t "fineSTRUCTURE" -v "4.1.1" -w "https://people.maths.bris.ac.uk/~madjl/finestructure/finestructure.html" -d "perform population assignment using large numbers of densely sampled genomes\, including both SNP chips and sequence data" -l "Free for noncommercial use"
    ./makeroom_fineSTRUCTURE_4.1.1.sh
fineSTRUCTURE/4.0.1
===================


<https://people.maths.bris.ac.uk/~madjl/finestructure/finestructure.html>


LOG
---

    VERSION=4.0.1
    cd /sw/bioinfo/
    mkdir fineSTRUCTURE
    cd fineSTRUCTURE/
    mkdir $VERSION
    cd $VERSION
    #  mkdir $CLUSTER  don't make the $CLUSTER directory, we will move the unpacked directory to that name
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src/
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/fs_${VERSION}.zip
    unzip fs_4.0.1.zip 
    cd fs_4.0.1
    ldd fs_linux_glibc2.3 
    ln -s fs_linux_glibc2.3 fs

Change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.

    vi  *.pl

In the mf file define `FINESTRUCTURE_ROOT` and make sure module help directs
people to use it to access example directories and manual.

Also, load perl_modules/5.26.2 for the fineSTRUCTURE/Chromopainter perl
scripts, and note the need to load an R_packages module to load the
fineSTRUCTURE R library-ish file.

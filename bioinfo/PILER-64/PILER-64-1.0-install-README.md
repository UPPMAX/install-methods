PILER-64 1.0
============

<https://github.com/eernst/piler-64>

A 64-bit version of Robert Edgar and Gene Myers' PILER (<http://drive5.com/piler/>).
I've downloaded the source of both, and a diff is available at 

    /sw/bioinfo/PILER-64/1.0/src/diffs.txt

See below for how the comparison was done.


LOG
---

    cd /sw/bioinfo
    mkdir PILER-64
    cd PILER-64/
    VERSION=1.0
    mkdir $VERSION
    mkdir mf
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    cd src
    module load git
    module load gcc/7.4.0
    git clone https://github.com/eernst/piler-64

Get the original piler for comparison.  Edgar's tarball includes DOS-format files and unpacks to the current directory.  Give them a home and convert before comparison.

    wget http://www.drive5.com/piler/piler_source.tar.gz
    mkdir piler
    cd piler
    tar xzf ../piler_source.tar.gz 
    chmod -x *
    dos2unix *
    cd ..

Now compare the source trees.  Seems to be all memory alloc stuff.

    diff -y -w -W $COLUMNS --suppress-common-lines piler piler-64 > diffs.txt

Get the utility scripts.  Add `#!` line and execute permission, and move to `$PFX`.

    wget http://www.drive5.com/piler/pilerpy.tz
    tar xvzf pilerpy.tz
    for F in rm2gff.py trs_report.py ; do
        sed -i -r -e '1i#!/usr/bin/env python\n' $F
        chmod +x $F
        mv -v $F $PFX/
    done

Build piler-64.  This creates the `piler-64` executable.  Copy this to `$PFX`
and create a symlink there for `piler`, which is how most users will probably
want to use it.

    cd piler-64
    make
    cp -av piler-64 $PFX
    cd $PFX
    ln -s piler-64 piler

The mf file only needs to add `$modroot` to path.  The system python, or
whichever python2 is loaded, should be sufficient.

    fixup /sw/bioinfo/PILER-64


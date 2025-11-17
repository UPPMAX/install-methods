deepTools/3.5.6
===============

<https://github.com/deeptools/deepTools>

Used under license:
mixed open-source
<https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt>

Structure creating script (makeroom_deepTools_3.5.6.sh) moved to /sw/bioinfo/deepTools/makeroom_3.5.6.sh

FOR THIS VERSION: the most recent pysam==0.23.0 doesn't build -- problems in simd.c -- so force pysam==0.22.1

LOG
---

    TOOL=deepTools
    VERSION=3.5.6
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -d "Tools to process and analyze deep sequencing data" -w https://github.com/deeptools/deepTools -l "mixed open-source" -L https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt
    ./makeroom_deepTools_3.5.6.sh 
    source /sw/bioinfo/deepTools/SOURCEME_deepTools_3.5.6
    cd $SRCDIR

Check available versions.

    ml python/3.11.8
    pip3 install --user deeptools==

Confirmed latest is 3.5.6. Install that into a venv after loading more recent gcc and installing an older pysam to get around build problems.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    which pip3
    which python3
    ml -python

    ml gcc/12.3.0

    pip3 install --upgrade pip
    pip3 install pysam==0.22.1
    pip3 install deeptools==3.5.6

Now lift out what we need to lift out. Everything installed 14:51 seems to be a
good set, except for the sphinx- and -docstrings scripts.

    cd $PREFIX
    mkdir bin
    cd bin

The list of things to install.

    ls -ltr ../venv/bin/ | grep '14:51' | cut -c43- | grep -vP '(sphinx-|numpydoc)'

    for L in $(ls -ltr ../venv/bin/ | grep -F '14:51' | cut -c43- | grep -vP '(sphinx-|numpydoc)'); do
        ln -sf $PREFIX/venv/bin/$L .
    done

Can we run this directly?

    ./deeptools 


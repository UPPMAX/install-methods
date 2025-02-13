deepTools/3.5.6
========================

<https://github.com/deeptools/deepTools>

Used under license:
mixed open-source
<https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt>

Structure creating script (makeroom_deepTools_3.5.6.sh) moved to /sw/bioinfo/deepTools/makeroom_3.5.6.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "deepTools" "-v" "3.5.6" "-s" "misc" "-d" "Tools to process and analyze deep sequencing data" "-w" "https://github.com/deeptools/deepTools" "-l" "mixed open-source" "-L" "https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt"
    ./makeroom_deepTools_3.5.6.sh
deepTools/3.5.5
===============

<https://github.com/deeptools/deepTools>

Used under license:
mixed open-source
<https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt>

Structure creating script (makeroom_deepTools_3.5.5.sh) moved to /sw/bioinfo/deepTools/makeroom_3.5.5.sh

LOG
---

    TOOL=deepTools
    VERSION=3.5.5
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -d "Tools to process and analyze deep sequencing data" -w https://github.com/deeptools/deepTools -l "mixed open-source" -L https://raw.githubusercontent.com/deeptools/deepTools/master/LICENSE.txt
    ./makeroom_deepTools_3.5.5.sh 
    source /sw/bioinfo/deepTools/SOURCEME_deepTools_3.5.5
    cd $SRCDIR

Check available versions.

    ml python/3.11.8
    pip3 install --user deeptools==

Confirmed latest is 3.5.5. Install that into a venv.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    which pip3
    which python3
    ml -python

    pip3 install deeptools==3.5.5

Now lift out what we need to lift out. Everything installed 14:39 seems to be a
good set, except for the sphinx- and -docstrings scripts.

    cd $PREFIX
    mkdir bin
    cd bin

The list of things to install.

    ls -ltr ../venv/bin/ | grep '14:39' | cut -c43- | grep -vP '(sphinx-|validate-docstrings)'

    for L in $(ls -ltr ../venv/bin/ | grep '14:39' | cut -c43- | grep -vP '(sphinx-|validate-docstrings)'); do
        ln -sf $PREFIX/venv/bin/$L .
    done

Can we run this directly?

    ./deeptools 

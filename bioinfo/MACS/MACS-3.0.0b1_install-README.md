MACS/3.0.0b1
========================

<https://macs3-project.github.io/MACS/>

Used under license:
BSD 3-clause


LOG
---

Install into a venv.

    VERSION=3.0.0b1
    makeroom.sh -f -t "MACS" -v "${VERSION}" -s "misc" -d "Model-based Analysis of ChIP-Seq" -w "https://macs3-project.github.io/MACS/" -l "BSD 3-clause"
    ./makeroom_MACS_${VERSION}.sh

    source SOURCEME_MACS_${VERSION}

    cd $PREFIX
    
    module load python/3.8.7
    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install MACS3==$VERSION

    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/macs3 .

    ./macs3 --version

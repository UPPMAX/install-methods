pyega3/5.1.0
========================

<https://github.com/EGA-archive/ega-download-client>

Used under license:



Structure creating script (makeroom_pyega3_5.1.0.sh) moved to /sw/bioinfo/pyega3/makeroom_5.1.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "pyega3" "-v" "5.1.0" "-d" "A Python-based EGA download client" "-w" "https://github.com/EGA-archive/ega-download-client" "-s" "misc"
    ./makeroom_pyega3_5.1.0.sh

    module load python/3.12.1

    # Create a virtualenv and install
    cd $PREFIX
    python3 -m virtualenv -p python3.12 venv
    source venv/bin/activate
    pip3 install pyega3==${VERSION}

    # lift out pyega3
    mkdir $PREFIX/bin
    cp $PREFIX/venv/bin/pyega3 $PREFIX/bin







nanopolish/0.14.0
========================

<https://github.com/jts/nanopolish>

Used under license:
MIT


Structure creating script (makeroom_nanopolish_0.14.0.sh) moved to /sw/bioinfo/nanopolish/makeroom_0.14.0.sh

LOG
---

    /home/jonass/uppmax/makeroom.sh "-t" "nanopolish" "-w" "https://github.com/jts/nanopolish" "-d" "Software package for signal-level analysis of Oxford Nanopore sequencing data." "-v" "0.14.0" "-s" "misc" "-l" "MIT" "-k" "nanopore sequence" "-f"
    ./makeroom_nanopolish_0.14.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/jts/nanopolish.git
    cd nanopolish
    make
    cd ..
    cp -avr nanopolish/* ../rackham/
    cd ../rackham
    PYTHONUSERBASE=$PREFIX pip install -r scripts/requirements.txt --user

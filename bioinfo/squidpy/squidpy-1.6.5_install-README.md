squidpy/1.6.5
========================

<https://squidpy.readthedocs.io/en/stable/index.html>

Used under license:
BSD-3


Structure creating script (makeroom_squidpy_1.6.5.sh) moved to /sw/bioinfo/squidpy/makeroom_1.6.5.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "squidpy" "-v" "1.6.5" "-w" "https://squidpy.readthedocs.io/en/stable/index.html" "-c" "bioinfo" "-s" "misc" "-l" "BSD-3" "-d" "Spatial Single Cell Analysis in Python ."
    ./makeroom_squidpy_1.6.5.sh

    source /sw/bioinfo/squidpy/SOURCEME_squidpy_1.6.5 && cd $TOOLDIR
    
    ml python/3.12.7
    // sorry my lazyness, perhaps ven in future... /Björn C
    PYTHONUSERBASE=$PREFIX pip install --user 'quidpy[interactive]'

mf file
    set PYTHONPATH to 3.12
    depends-on python/3.12.7 //may change if venv instead


scanpy/1.11.0
========================

<https://scanpy.readthedocs.io/en/stable/index.html>

Used under license:
BSD-3


Structure creating script (makeroom_scanpy_1.11.0.sh) moved to /sw/bioinfo/scanpy/makeroom_1.11.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "scanpy" "-v" "1.11.0" "-w" "https://scanpy.readthedocs.io/en/stable/index.html" "-c" "bioinfo" "-s" "misc" "-l" "BSD-3" "-d" "Single-cell analysis in Python. Scales to >100M cells."
    ./makeroom_scanpy_1.11.0.sh
    source /sw/bioinfo/scanpy/SOURCEME_scanpy_1.11.0 && cd $TOOLDIR

    ml python/3.12.7

    // sorry my lazyness, perhaps ven in future... /Björn C
    PYTHONUSERBASE=$PREFIX pip install --user 'scanpy[leiden]'

mf file
    set PYTHONPATH to 3.12
    depends-on python/3.12.7 //may change if venv instead

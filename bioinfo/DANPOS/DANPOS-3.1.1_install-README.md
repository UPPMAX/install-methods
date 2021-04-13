DANPOS/3.1.1
========================

<https://sites.google.com/site/danposdoc/>

Used under license:

<>

Structure creating script (makeroom_DANPOS_3.1.1.sh) moved to /sw/bioinfo/DANPOS/makeroom_3.1.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "DANPOS" -v "3.1.1" -w "https://sites.google.com/site/danposdoc/" -c "bioinfo" -l "''" -d "A toolkit for Dynamic Analysis of Nucleosome and Protein Occupancy by Sequencing" -s "misc" -x "INSTALL"
    ./makeroom_DANPOS_3.1.1.sh
    cd $SRCDIR
    git clone https://github.com/sklasfeld/DANPOS3.git
    cd DANPOS3/
    cp * $PREFIX
    cd $PREFIX
    PYTHONUSERBASE=$PREFIX pip install --user -r requirements.txt
    chmod +x *.py
#   modify headings of these files to .#!/usr/bin/env python3


DANPOS/2.2.2
============

<https://sites.google.com/site/danposdoc/>

Used under license:
''

Structure creating script (makeroom_DANPOS_2.2.2.sh) moved to /sw/bioinfo/DANPOS/makeroom_2.2.2.sh

LOG
---

    TOOL=DANPOS
    VERSION=2.2.2
    cd /sw/bioinfo
    makeroom.sh -t "DANPOS" -v "2.2.2" -w "https://sites.google.com/site/danposdoc/" -c "bioinfo" -l "\'\'" -d "A toolkit for Dynamic Analysis of Nucleosome and Protein Occupancy by Sequencing" -s "misc" -x "$'INSTALL\n'"
    ./makeroom_DANPOS_2.2.2.sh
    cd DANPOS
    source SOURCEME_DANPOS_2.2.2

    cd $SRCDIR
    wget http://lilab.research.bcm.edu/dldcc-web/lilab/kaifuc/danpos/release/danpos-2.2.2.tgz
    tar xf danpos-2.2.2.tgz 
    rm -rf $PREFIX
    mv danpos-2.2.2 $PREFIX
    cd $PREFIX
    module load python/2.7.9
    module load R/3.2.3
    PYTHONUSERBASE=$PREFIX pip install --user rpy2==2.6.0

Now follow the instructions for installation of this version.

    python danpos.py -h

Make sure `#!/usr/bin/env python` is the first line of python scripts, and make them executable.

    head -n 1 *.py
    chmod +x *.py

The mf file should add $modroot to PATH and $modroot/lib/python2.7/site-packages to PYTHONPATH.

Once the chmod is done, then the module can be tested by loading and then running

    danpos.py command input-data

There is no need to do the `python danpos.py ...` thing.

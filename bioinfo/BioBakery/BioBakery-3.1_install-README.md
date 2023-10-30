BioBakery/3.1
========================

<https://github.com/biobakery>

Used under license:
MIT license


Structure creating script (makeroom_BioBakery_3.1.sh) moved to /sw/bioinfo/BioBakery/makeroom_3.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "BioBakery" "-v" "3.1" "-w" "https://github.com/biobakery" "-c" "bioinfo" "-l" "MIT license" "-d" "microbial community profiling" "-s" "misc" "-x" "INSTALL" "-f"
    ./makeroom_BioBakery_3.1.sh
    source /sw/bioinfo/BioBakery/SOURCEME_BioBakery_3.1 && cd $TOOLDIR

## install biobakery_workflows
    ml python/3.10.8
    PYTHONUSERBASE=$PREFIX pip install biobakery_workflows --user

#This is also a collecting module that loads Metaphlan4/4.0.X, PhyloPhlAn/3.0.X, KneadData/0.12.X + database in BioBakery_data, and HUMAnN/3.8

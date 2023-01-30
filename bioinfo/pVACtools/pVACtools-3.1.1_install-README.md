pVACtools/3.1.1
========================

<https://github.com/griffithlab/pVACtools>

Used under license:
BSD3


Structure creating script (makeroom_pVACtools_3.1.1.sh) moved to /sw/bioinfo/pVACtools/makeroom_3.1.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "pVACtools" "-v" "3.1.1" "-d" "pVACtools is a cancer immunotherapy suite" "-l" "BSD3" "-w" "https://github.com/griffithlab/pVACtools" "-s" "annotation"
    ./makeroom_pVACtools_3.1.1.sh
    
# Install
    cd $PREFIX
    module load python/3.8.7
    PYTHONUSERBASE=$PREFIX pip install --user pvactools==3.1.1


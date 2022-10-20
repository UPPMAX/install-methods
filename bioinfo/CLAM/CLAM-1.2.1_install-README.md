CLAM/1.2.1
========================

<https://github.com/Xinglab/CLAM#section2>

Used under license:
GNU3


Structure creating script (makeroom_CLAM_1.2.1.sh) moved to /sw/bioinfo/CLAM/makeroom_1.2.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "CLAM" "-v" "1.2.1" "-w" "https://github.com/Xinglab/CLAM#section2" "-d" "CLAM is a general toolkit for re-aligning multi-mapped reads in CLIP/RIP-seq data and calling peaks." "-l" "GNU3" "-s" "annotation"
    ./makeroom_CLAM_1.2.1.sh

    TOOL=CLAM
    VERSION=1.2.1

# Download and extract
    cd $SRCDIR
    wget https://github.com/Xinglab/CLAM/archive/refs/tags/v${VERSION}.tar.gz
    tar xfvz v1.2.1.tar.gz --strip-components 1 

# Install
    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX python setup.py install --user
    
    # Remove multiprocessing from requirements.txt, it is already included in python3
    sed -i.bak '/multiprocessing/d' requirements.txt
    PYTHONUSERBASE=$PREFIX python -m pip install --user -r requirements.txt

# Edit the shebang to /usr/bin/env python
    cd $PREFIX/bin
    sed -i.bak 's/^\#!\/sw\/comp\/python\/3.9.5\/rackham\/bin\/python/\#!\/usr\/bin\/env python/' *


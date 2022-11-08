DeepLoc/2.0
========================

<https://services.healthtech.dtu.dk/service.php?DeepLoc-2.0>

Used under license:



Structure creating script (makeroom_DeepLoc_2.0.sh) moved to /sw/bioinfo/DeepLoc/makeroom_2.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "DeepLoc" "-v" "2.0" "-w" "https://services.healthtech.dtu.dk/service.php?DeepLoc-2.0" "-d" "DeepLoc 2.0 predicts the subcellular localization(s) of eukaryotic proteins." "-s" "annotation"
    ./makeroom_DeepLoc_2.0.sh

    TOOL=DeepLoc
    VERSION=2.0

# Download and extract. Temporary url.
    cd $SRCDIR
    wget https://services.healthtech.dtu.dk/download/29180c88-e2a0-4fae-ba43-142990596136/deeploc-2.0.All.tar.gz

# Install
    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX python -m pip install --user deeploc-2.0.All.tar.gz

# Edit shebang in bin/    
    cd $PREFIX/bin
    sed -r -i 's/\#\!\/sw\/comp.*/\#\!\/usr\/bin\/env python/' *

# Add cache directory
    mkdir -p $TOOLDIR/cache

# Test
    mkdir $PREFIX/test
    cd $PREFIX test

    tar xfvz $SRCDIR/deeploc-2.0.All.tar.gz deeploc2_package/test.fasta -C $PREFIX/test --strip-components=1
    deeploc2 -f test.fasta

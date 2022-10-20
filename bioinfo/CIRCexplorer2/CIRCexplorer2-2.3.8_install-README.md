CIRCexplorer2/2.3.8
========================

<https://github.com/YangLab/CIRCexplorer2>

Used under license:
C


Structure creating script (makeroom_CIRCexplorer2_2.3.8.sh) moved to /sw/bioinfo/CIRCexplorer2/makeroom_2.3.8.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "CIRCexplorer2" "-v" "2.3.8" "-w" "https://github.com/YangLab/CIRCexplorer2" "-l" "C" "-d" "CIRCexplorer2 is the successor of CIRCexplorer with plenty of new features to facilitate circular RNA identification and characterization." "-s" "annotation"
    ./makeroom_CIRCexplorer2_2.3.8.sh

    TOOL=CIRCexplorer2
    VERSION=2.3.8


# Download and extract
    cd $SRCDIR
    wget https://github.com/YangLab/CIRCexplorer2/archive/refs/tags/${VERSION}.tar.gz
    tar xfvz 2.3.8.tar.gz --strip-components 1

# Install
    module load python/2.7.15
    python2 -m pip install --prefix=$PREFIX -r requirements.txt
    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages/:$PYTHONPATH
    python2 setup.py install --prefix=$PREFIX

# Edit shebang to /usr/bin/env
    cd $PREFIX/bin
    sed -i "s/\#\!\/sw\/comp\/python\/2.7.15_rackham\/bin\/python2/\#\!\/usr\/bin\/env python2/" *.py CIRCexplorer2



    



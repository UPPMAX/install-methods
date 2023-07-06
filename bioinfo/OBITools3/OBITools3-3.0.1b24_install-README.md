OBITools3/3.0.1b24
========================

<https://git.metabarcoding.org/obitools/obitools3>

Used under license:
CeCILL


Structure creating script (makeroom_OBITools3_3.0.1b24.sh) moved to /sw/bioinfo/OBITools3/makeroom_3.0.1b24.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "OBITools3" "-v" "3.0.1b24" "-l" "CeCILL" "-w" "https://git.metabarcoding.org/obitools/obitools3" "-d" "A package for the management of analyses and data in DNA metabarcoding" "-s" "annotation"
    ./makeroom_OBITools3_3.0.1b24.sh
    source /sw/bioinfo/OBITools3/SOURCEME_OBITools3_3.0.1b24 && cd $TOOLDIR

    # Load modules
    module load cmake/3.26.3
    module load python/3.8.7
    module load gcc/9.3.0


    # Download
    cd $SRCDIR
    git clone https://git.metabarcoding.org/obitools/obitools3.git .
    git checkout tags/v3.0.1b24


    # Modify prefix in setup.py to replace the path from python to \$PREFIX
    sed -ri "s#(:STRING=).*#\1$PREFIX\"#" setup.py
    #"

    # Pip
    export LIBRARY_PATH=/sw/bioinfo/OBITools3/3.0.1b24/rackham:$LIBRARY_PATH
    PYTHONUSERBASE=$PREFIX python setup.py install --prefix=$PREFIX

    # Change shebang in $PREFIX/bin/obi
    sed -ri "s@(\#\!).*@\1/usr/bin/env python@" $PREFIX/bin/obi


    # Test
    export PYTHONPATH=$PREFIX/lib/python3.8/site-packages/:$PYTHONPATH
    export LD_LIBRARY_PATH=/sw/bioinfo/OBITools3/3.0.1b24/rackham:$LD_LIBRARY_PATH
    $PREFIX/bin/obi test




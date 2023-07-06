OBITools/1.2.13
========================

<https://pythonhosted.org/OBITools/welcome.html#installing-the-obitools>

Used under license:
CeCILL


Structure creating script (makeroom_OBITools_1.2.13.sh) moved to /sw/bioinfo/OBITools/makeroom_1.2.13.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "OBITools" "-v" "1.2.13" "-l" "CeCILL" "-w" "https://pythonhosted.org/OBITools/welcome.html#installing-the-obitools" "-d" "A package for the management of analyses and data in DNA metabarcoding" "-s" "annotation"
    ./makeroom_OBITools_1.2.13.sh
    source /sw/bioinfo/OBITools/SOURCEME_OBITools_1.2.13 && cd $TOOLDIR

    # Load modules
    module load python/2.7.15
    module load gcc/4.9.4

    # Git clone and checkout 1.2.13
    git clone https://git.metabarcoding.org/obitools/obitools.git .
    git checkout c198e7d8bfad3ee41c6724a382b6031d9901b0df

    $ Install
    pip install -r requirements.txt --prefix=$PREFIX
    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages:$PYTHONPATH
    export PATH=$PREFIX/bin:$PATH

    python setup.py install --prefix=$PREFIX

    # Change shebang to /usr/bin/env python
    cd $PREFIX/bin
    sed -r -i.bak "s@(\#\!)/sw/comp/python/.*@\1/usr/bin/env python@" *
    rm *.bak
    

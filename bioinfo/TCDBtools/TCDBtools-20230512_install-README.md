TCDBtools/20230512
========================

<https://github.com/SaierLaboratory/TCDBtools>

Used under license:
BSD 3


Structure creating script (makeroom_TCDBtools_20230512.sh) moved to /sw/bioinfo/TCDBtools/makeroom_20230512.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "TCDBtools" "-v" "20230512" "-w" "https://github.com/SaierLaboratory/TCDBtools" "-s" "annotation" "-l" "BSD 3"
    ./makeroom_TCDBtools_20230512.sh
    source /sw/bioinfo/TCDBtools/SOURCEME_TCDBtools_20230512

    # Clone repo
    cd $PREFIX
    git clone https://github.com/SaierLaboratory/TCDBtools .
    git reset --hard c371b2c

    #python 2.7
    #cd $SRCDIR
    #wget http://biopython.org/DIST/biopython-1.76.tar.gz
    #pip install --prefix=$PREFIX  biopython-1.76.tar.gz


    # pip3 install
    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX pip install biopython

    # export path and pythonpath
    export PYTHONPATH=$PREFIX/lib/python3.9/site-packages/:$PREFIX/bin/:$PYTHONPATH
    export PATH=$PREFIX/bin:$PATH

    # modify the shebang from anaconda to /usr/bin/env 
    cd bin
    sed -i "s/\#\!\/usr\/local\/anaconda3\/bin\/python3/\#\!\/usr\/bin\/env python/" *.py
    

# Figure out if python 2 or 3. Try and compile and write to file
    for name in *.py; do python2 -m py_compile $name && echo $name python 2 >> versions.txt ; python3 -m py_compile $name && echo $name python 3 >> versions.txt; done


    # Mail to user
    Hi Grace,

    TCDBtools is not a finished set of tools or programs. It is just a combined repository with various python (version 2 and 3) and perl scripts.

    It is not suitable as a module but I can help you set it up in your project directory. 
    Which tools are you interested in? Since all might not work.

    Regards,
    Björn







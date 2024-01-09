BUSCO/5.3.1
===========

<https://busco.ezlab.org/>

Used under license:



Structure creating script (makeroom_BUSCO_5.3.1.sh) moved to /sw/bioinfo/BUSCO/makeroom_5.3.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "BUSCO" "-v" "5.3.1" "-f"
    ./makeroom_BUSCO_5.3.1.sh

    TOOL=BUSCO
    VERSION=5.3.1
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${VERSION}

Get BUSCO

    cd $SRCDIR
    git clone --depth 1 --branch ${VERSION} https://gitlab.com/ezlab/busco.git 
    cd busco

    module load bioinfo-tools
    module load blast/2.12.0+
    module load augustus/3.4.0
    module load prodigal/2.6.3
    module load metaeuk/4-a0f584d
    module load hmmer/3.2.1
    module load sepp/4.3.10
    module load biopython/1.78
    
    python3 -m pip install  --ignore-installed --prefix=$PREFIX attrs==19.2.0 nbclient==0.5.1 pandas==1.2.3 jupyter-client==6.1.5 nbformat==5.0.2

Modify the config.ini. If the path is commented out, it will look in the $PATH variable instead.

    cp $SRCDIR/busco/config/config.ini $PREFIX
    sed -i 's/^\(path\)/\;\1/g' $PREFIX/config.ini
    sed -i 's/\;\(offline\)/\1/' $PREFIX/config.ini
    sed -i 's/\;\(datasets_version\)/\1/' $PREFIX/config.ini

    export PYTHONPATH=${PREFIX}/lib/python3.8/site-packages/:${PYTHONPATH}
    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v5_lineage_sets/lineages
    PATH=$PREFIX/bin:$PATH
    python3 setup.py install --prefix=$PREFIX

Add /usr/bin/env python to run_BUSCO.py

    mv $PREFIX/bin/busco $PREFIX/bin/run_BUSCO.py
    sed -i '1c\#\!\/usr\/bin\/env python' $PREFIX/bin/run_BUSCO.py

Test with 

    run_BUSCO.py  \
        -i $SRCDIR/busco/test_data/eukaryota/genome.fna \
        -o eukaryota.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f

    source $AUGUSTUS_CONFIG_COPY
    run_BUSCO.py  \
        -i $SRCDIR/busco/test_data/eukaryota/genome.fna \
        -o eukaryota.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f \
        --augustus



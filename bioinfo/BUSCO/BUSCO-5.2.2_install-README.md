BUSCO/5.2.2
========================

<https://busco.ezlab.org/>

Used under license:
MIT


Structure creating script (makeroom_BUSCO_5.2.2.sh) moved to /sw/bioinfo/BUSCO/makeroom_5.2.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "BUSCO" -v "5.2.2" -w "https://busco.ezlab.org/" -l "MIT" -d "Based on evolutionarily-informed expectations of gene content of near-universal single-copy orthologs\\, BUSCO metric is complementary to technical metrics like N50." -f
    ./makeroom_BUSCO_5.2.2.sh
    TOOL=BUSCO
    VERSION=5.2.2
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${VERSION}
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

Modify the config.ini with the paths further down in this file.

    export PYTHONPATH=${PREFIX}/lib/python3.8/site-packages/:${PYTHONPATH}
    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v5_lineage_sets/lineages
    python3 setup.py install --prefix=$PREFIX


    mv $PREFIX/bin/busco $PREFIX/bin/run_BUSCO.py


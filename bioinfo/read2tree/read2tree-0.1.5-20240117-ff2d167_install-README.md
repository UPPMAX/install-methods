read2tree/0.1.5-20240117-ff2d167
========================

<https://github.com/DessimozLab/read2tree>

Used under license:
MIT


Structure creating script (makeroom_read2tree_0.1.5-20240117-ff2d167.sh) moved to /sw/bioinfo/read2tree/makeroom_0.1.5-20240117-ff2d167.sh

Install needed python packages in virtualenv, load the modules for other requirements.

It needs iqtree 1.

LOG
---

    makeroom.sh -t read2tree -v 0.1.5-20240117-ff2d167 -c bioinfo -s phylogeny -w https://github.com/DessimozLab/read2tree -d "a tool for inferring species tree from sequencing reads" -l MIT 
    ./makeroom_read2tree_0.1.5-20240117-ff2d167.sh 
    source /sw/bioinfo/read2tree/SOURCEME_read2tree_0.1.5-20240117-ff2d167 && cd $SRCDIR

    ml git/2.34.1
    git clone --recursive https://github.com/DessimozLab/read2tree
    cd read2tree/
    git reset --hard ff2d167

    cd $PREFIX
    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate
    ml -python -git
    which pip3
    pip3 install biopython numpy Cython ete3 lxml tqdm scipy pyparsing requests natsort pyyaml filelock dendropy pysam

    ml bioinfo-tools
    ml MAFFT/7.407 
    ml samtools/1.19
    ml NextGenMap/0.5.5
    ml ngmlr/0.2.7-20210816-a2a31fb
    ml iqtree/1.6.12-omp-mpi

    cd $SRCDIR
    cd read2tree/
    pip3 install .

    Lift out read2tree.

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/read2tree .
    deactivate

    ./read2tree

Now test.

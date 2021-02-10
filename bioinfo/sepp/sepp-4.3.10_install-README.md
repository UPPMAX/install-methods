sepp/4.3.10
========================

<https://github.com/smirarab/sepp/>

Used under license:
GNU3
<>

Structure creating script (makeroom_sepp_4.3.10.sh) moved to /sw/bioinfo/sepp/makeroom_4.3.10.sh

LOG
---

    TOOL=sepp
    VERSION=4.3.10
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/sepp/4.3.10/src
    /home/bjornv/git/install-methods/makeroom.sh -t "sepp" -v "4.3.10" -w "https://github.com/smirarab/sepp/" -l "GNU3" -d "SEPP stands for SATe-enabled Phylogenetic Placement\, and addresses the problem of phylogenetic placement of short reads into reference alignments and trees." -s "annotation"
    ./makeroom_sepp_4.3.10.sh

    cd $SRCDIR
    wget https://github.com/smirarab/sepp/archive/4.3.10.tar.gz
    tar xfvz 4.3.10.tar.gz --strip 1
    rm 4.3.10.tar.gz

    module load python3/3.7.2
    export PYTHONPATH=${PREFIX}/lib/python3.7/site-packages/:${PYTHONPATH}
    python3 setup.py config -c
    python3 setup.py install --prefix $PREFIX

    


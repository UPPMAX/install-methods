ngsplot/2.63
============

<https://github.com/shenlab-sinai/ngsplot>

Used under license:
GPL v2

Structure creating script (makeroom_ngsplot_2.63.sh) moved to /sw/bioinfo/ngsplot/makeroom_2.63.sh

LOG
---

    TOOL=ngsplot
    VERSION=2.63
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/shenlab-sinai/ngsplot -l "GPL v2" -d "visualize your next-generation sequencing (NGS) samples at functional genomic regions"
    ./makeroom_ngsplot_2.63.sh 
    source SOURCEME_ngsplot_2.63 
    cd $SRCDIR
    tar xf 2.63.tar.gz 
    rmdir $PREFIX
    mv ngsplot-2.63 $PREFIX
    module load python/2.7.15
    module load R_packages/3.6.1

    mkdir ngsplotdb
    cd ngsplotdb/

Prebuilt databases are available at
https://drive.google.com/drive/u/0/folders/0B1PVLadG_dCKNEsybkh5TE9XZ1E so
download them individually and then pull them over to Uppmax in this directory.
Once they are here, install them with

    yes | for F in *.gz ; do ngsplotdb.py install $F; done

alphafold_dataset/2.0.0
========================

<https://github.com/deepmind/alphafold/archive/refs/tags/v2.0.0.tar.gz>

Used under license:
Apache License 2.0


Structure creating script (makeroom_alphafold_dataset_2.0.0.sh) moved to /sw/data/alphafold_dataset/makeroom_2.0.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "alphafold_dataset" -c "data" -v "2.0.0" -w "https://github.com/deepmind/alphafold/archive/refs/tags/v2.0.0.tar.gz" -l "Apache License 2.0"
    ./makeroom_alphafold_dataset_2.0.0.sh
    cd $SRCDIR

    wget https://github.com/deepmind/alphafold/archive/refs/tags/v2.0.0.tar.gz
    tar xvf v2.0.0.tar.gz
    cd alphafold-2.0.0

    #copy the aria2c binary signulairty file and set the path accordingly.
    export PATH=/sw/bioinfo/alphafold/2.0.0/src/aria2c:$PATH

    DOWNLOAD_DIR=/sw/data/alphafold_dataset/20210922_132333
    
    scripts/download_all_data.sh DOWNLOAD_DIR 

    ln -s /sw/data/alphafold_dataset/20210922_132333 $PREFIX

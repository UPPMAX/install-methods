alphafold_dataset/3.0.1
========================

<https://github.com/google-deepmind/alphafold3>

Used under license:
Creative Commons


Structure creating script (makeroom_alphafold_dataset_3.0.1.sh) moved to /sw/data/alphafold_dataset/makeroom_3.0.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphafold_dataset" "-v" "3.0.1" "-l" "Creative Commons" "-w" "https://github.com/google-deepmind/alphafold3" "-d" "AlphaFold 3 inference pipeline." "-c" "data" "-f"
    ./makeroom_alphafold_dataset_3.0.1.sh
    
    cd $SRCDIR
    git clone https://github.com/google-deepmind/alphafold3.git
    cd alphafold3
    bash fetch_databases.sh $PREFIX













alphafold_dataset/2.3.1
========================

<http://>

Used under license:



Structure creating script (makeroom_alphafold_dataset_2.3.1.sh) moved to /sw/data/alphafold_dataset/makeroom_2.3.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphafold_dataset" "-v" "2.3.1" "-c" "data" "-f"
    ./makeroom_alphafold_dataset_2.3.1.sh
alphafold_dataset/2.1.1
========================

<https://github.com/deepmind/alphafold>

Used under license:
Apache License 2.0


Structure creating script (makeroom_alphafold_dataset_2.1.1.sh) moved to /sw/data/alphafold_dataset/makeroom_2.1.1.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "alphafold_dataset" -c "data" -v "2.1.1" -w "https://github.com/deepmind/alphafold" -l "Apache License 2.0"
    ./makeroom_alphafold_dataset_2.1.1.sh
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
    
    scripts/download_all_data.sh $DOWNLOAD_DIR 
    scripts/download_small_bfd.sh $DOWNLOAD_DIR

    #ln -s /sw/data/alphafold_dataset/20210922_132333 $PREFIX

NCBI-datasets/16.35.0
========================

<https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/>

Used under license:
Public Domain, US Government


Structure creating script (makeroom_NCBI-datasets_16.35.0.sh) moved to /sw/bioinfo/NCBI-datasets/makeroom_16.35.0.sh


LOG
---

    makeroom.sh -f -c bioinfo -s misc -t NCBI-datasets -v 16.35.0 -l "Public Domain, US Government" -w https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/ -d "Use datasets to download biological sequence data across all domains of life from NCBI, use dataformat to convert metadata from JSON Lines format to other formats"
    ./makeroom_NCBI-datasets_16.35.0.sh 
    source /sw/bioinfo/NCBI-datasets/SOURCEME_NCBI-datasets_16.35.0 && cd $SRCDIR
    wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets
    wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/dataformat
    chmod +x data*
    mv data* $PREFIX

Make mf file symlink to the one for 15.29.0 and simplify it a bit.

    rm -f 16.35.0 && ln -s 15.29.0 16.35.0 
    vi 15.29.0 

Wrap up.

    cd $TOOLDIR
    ./NCBI-datasets-16.35.0_post-install.sh 

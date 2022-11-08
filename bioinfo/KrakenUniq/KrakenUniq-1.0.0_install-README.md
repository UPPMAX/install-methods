KrakenUniq/1.0.0
================

<https://github.com/fbreitwieser/KrakenUniq>

Used under license:
GPLv3, MIT


Structure creating script (makeroom_KrakenUniq_1.0.0.sh) moved to /sw/bioinfo/KrakenUniq/makeroom_1.0.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "KrakenUniq" "-v" "1.0.0" "-w" "https://github.com/fbreitwieser/KrakenUniq" "-l" "GPLv3, MIT" "-d" "confident and fast metagenomics classification using unique k-mer counts"
    ./makeroom_KrakenUniq_1.0.0.sh

    source /sw/bioinfo/KrakenUniq/SOURCEME_KrakenUniq_1.0.0 && cd $SRCDIR
    wget https://github.com/fbreitwieser/krakenuniq/archive/refs/tags/v1.0.0.tar.gz
    tar xf v1.0.0.tar.gz 
    cd krakenuniq-1.0.0/
    ml gcc/10.3.0

    ./install_krakenuniq.sh -j $PREFIX

In /sw/data, download the prebuilt databases at https://benlangmead.github.io/aws-indexes/k2


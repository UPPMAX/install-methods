KrakenUniq/0.6
========================

<https://github.com/fbreitwieser/KrakenUniq>

Used under license:
GPLv3, MIT


Structure creating script (makeroom_KrakenUniq_0.6.sh) moved to /sw/bioinfo/KrakenUniq/makeroom_0.6.sh

LOG
---

    makeroom.sh "-f" "-t" "KrakenUniq" "-v" "0.6" "-s" "misc" "-w" "https://github.com/fbreitwieser/KrakenUniq" "-l" "GPLv3, MIT" "-d" "confident and fast metagenomics classification using unique k-mer counts"
    ./makeroom_KrakenUniq_0.6.sh

    source /sw/bioinfo/KrakenUniq/SOURCEME_KrakenUniq_0.6 && cd $SRCDIR
    wget https://github.com/fbreitwieser/krakenuniq/archive/refs/tags/v0.6.tar.gz
    tar xf v0.6.tar.gz 
    cd krakenuniq-0.6/
    ml gcc/9.3.0
    ml zlib/1.2.11
    ml bioinfo-tools
    mv jellyfish/1.1.12

    ./install_krakenuniq.sh $PREFIX


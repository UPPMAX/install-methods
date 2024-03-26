snphylo/20180901
========================

<https://github.com/thlee/SNPhylo/tree/20180901>

Used under license:



Structure creating script (makeroom_snphylo_20180901.sh) moved to /sw/bioinfo/snphylo/makeroom_20180901.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "snphylo" "-v" "20180901" "-w" "https://github.com/thlee/SNPhylo/tree/20180901" "-d" "A pipeline to generate a phylogenetic tree from huge SNP data" "-s" "phylogeny"
    ./makeroom_snphylo_20180901.sh
    
    
    module load bioinfo-tools
    module load python/3.8.7
    module load R_packages/4.3.1
    module load muscle/5.1
    module load phylip/3.697


    # Download
    cd $PREFIX
    wget https://github.com/thlee/SNPhylo/archive/refs/tags/20180901.tar.gz
    tar xfvz 20180901.tar.gz --strip-components=1

    # setup
    bash setup.sh # Answer yes to all 4 paths

    #  Test
    cd $PREFIX/samples
    bzip2 -d  soybean.partial.hapmap.bz2
    $PREFIX/snphylo.sh -H $PREFIX/samples/soybean.partial.hapmap


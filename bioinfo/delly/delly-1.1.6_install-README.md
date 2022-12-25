delly/1.1.6
========================

<https://github.com/dellytools/delly>

Used under license:
BSD


Structure creating script (makeroom_delly_1.1.6.sh) moved to /sw/bioinfo/delly/makeroom_1.1.6.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "delly" "-v" "1.1.6" "-w" "https://github.com/dellytools/delly" "-c" "bioinfo" "-l" "BSD" "-d" "An integrated structural variant (SV) prediction method that can discover, genotype and visualize deletions, tandem duplications, inversions and translocations at single-nucleotide resolution in short-read and long-read massively parallel sequencing data." "-x" "INSTALL" "-f"
    ./makeroom_delly_1.1.6.sh

    source /sw/bioinfo/delly/SOURCEME_delly_1.1.6 && cd $TOOLDIR
    cd $PREFIX
    wget https://github.com/dellytools/delly/releases/download/v1.1.6/delly_v1.1.6_linux_x86_64bit
    ln -s delly_v1.1.6_linux_x86_64bit delly
    chmod +x delly_v1.1.6_linux_x86_64bit
    
    cd ../src/
  #To get example files
    ml git/2.34.1
    git clone --recursive https://github.com/dellytools/delly.git
    cd delly/
    cp -r example $PREFIX/





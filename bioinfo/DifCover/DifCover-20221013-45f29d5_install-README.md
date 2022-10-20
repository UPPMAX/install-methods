DifCover/20221013-45f29d5
========================

<https://github.com/timnat/DifCover>

Used under license:
MIT


Structure creating script (makeroom_DifCover_20221013-45f29d5.sh) moved to /sw/bioinfo/DifCover/makeroom_20221013-45f29d5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "DifCover" "-v" "20221013-45f29d5" "-d" "The DifCover pipeline aims to identify regions in a reference genome for which the read coverage of one sample (sample1) is significantly different from the read coverage of another sample (sample2) when aligned to a common reference genome." "-l" "MIT" "-w" "https://github.com/timnat/DifCover" "-s" "annotation"
    ./makeroom_DifCover_20221013-45f29d5.sh


    TOOL=DifCover
    VERSION=20221013-45f29d5


# Download 
    cd $PREFIX
    git clone https://github.com/timnat/DifCover.git .

# Install
    cd $PREFIX/dif_cover_scripts
    make

# Make bash scripts executable
    


alfred/0.3.2
============

<https://www.gear-genomics.com/alfred/>

Used under license:
BSD 3-clause
<https://raw.githubusercontent.com/tobiasrausch/alfred/refs/heads/main/LICENSE>

Structure creating script (makeroom_alfred_0.3.2.sh) moved to /sw/bioinfo/alfred/makeroom_0.3.2.sh

LOG
---

    makeroom.sh -t alfred -v 0.3.2 -w "https://www.gear-genomics.com/alfred/" -l "BSD 3-clause" -L "https://raw.githubusercontent.com/tobiasrausch/alfred/refs/heads/main/LICENSE" -d "BAM Statistics, Feature Counting and Annotation" -c bioinfo -s misc
    ./makeroom_alfred_0.3.2.sh 
    source /sw/bioinfo/alfred/SOURCEME_alfred_0.3.2 && cd $SRCDIR
    wget https://github.com/tobiasrausch/alfred/releases/download/v0.3.2/alfred_v0.3.2_linux_x86_64bit
    ldd alfred_v0.3.2_linux_x86_64bit 
    chmod +x alfred_v0.3.2_linux_x86_64bit 
    ./alfred_v0.3.2_linux_x86_64bit 

Copy to PREFIX.

    mkdir $PREFIX/bin
    cp -av alfred_v0.3.2_linux_x86_64bit $PREFIX/bin
    cd $PREFIX/bin
    ln -s alfred_v0.3.2_linux_x86_64bit alfred

Add $modroot/bin to PATH.

    cd ../../../mf
    vi 0.3.2 

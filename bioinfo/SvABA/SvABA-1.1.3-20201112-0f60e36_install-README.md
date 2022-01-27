SvABA/1.1.3-20201112-0f60e36
========================

<https://github.com/walaj/svaba>

Used under license:
GPL v3


Structure creating script (makeroom_SvABA_1.1.3-20201112-0f60e36.sh) moved to /sw/bioinfo/SvABA/makeroom_1.1.3-20201112-0f60e36.sh

LOG
---

Its `./configure` script doesn't take `--prefix` or at least doesn't do
anything with it. The scripts and executable are installed in the local `bin/`
so just copy this to `PREFIX` and add `$modroot/bin` to PATH.


    makeroom.sh -f -t "SvABA" -v "1.1.3-20201112-0f60e36" -c "bioinfo" -s misc -w "https://github.com/walaj/svaba" -d "Structural variation and indel detection by local assembly" -l "GPL v3"
    ./makeroom_SvABA_1.1.3-20201112-0f60e36.sh 
    source /sw/bioinfo/SvABA/SOURCEME_SvABA_1.1.3-20201112-0f60e36 && cd $SRCDIR
    module load git/2.34.1
    module load gcc/9.3.0
    git clone --recursive https://github.com/walaj/svaba
    cd svaba
    ./configure 
    make -j20
    make install
    cp -av bin $PREFIX/


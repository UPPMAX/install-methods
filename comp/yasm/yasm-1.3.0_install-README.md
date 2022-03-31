yasm/1.3.0
========================

<https://yasm.tortall.net/>

Used under license:
'new' BSD
<https://github.com/yasm/yasm/blob/master/BSD.txt>

Structure creating script (makeroom_yasm_1.3.0.sh) moved to /sw/comp/yasm/makeroom_1.3.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -c "comp" -t "yasm" -v "1.3.0" -w "https://yasm.tortall.net/" -d "$'Yasm "is "a "complete "rewrite "of "the "NASM "assembler "under "the "\342\200\'new\'\200\235 "BSD "License'" -l "\'new\' BSD" -L "https://github.com/yasm/yasm/blob/master/BSD.txt"
    ./makeroom_yasm_1.3.0.sh
    cd $SRCDIR

    wget https://github.com/yasm/yasm/archive/refs/tags/v1.3.0.tar.gz
    tar xf yasm-1.3.0.tar.gz 
    cd yasm-1.3.0/
    ./configure --prefix $PREFIX
    make
    make install
    rm -rf yasm-1.3.0

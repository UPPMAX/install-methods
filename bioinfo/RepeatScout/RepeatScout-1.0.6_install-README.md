RepeatScout/1.0.6
=================

<https://github.com/mmcco/RepeatScout>

Used under license:
open source

Structure creating script (makeroom_RepeatScout_1.0.6.sh) moved to /sw/bioinfo/RepeatScout/makeroom_1.0.6.sh

LOG
---

    TOOL=RepeatScout
    VERSION=1.0.5
    cd /sw/bioinfo/$TOOL

    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/mmcco/RepeatScout -l "open source" -d "tool to discover repetitive substrings in DNA" 

    ./makeroom_RepeatScout_1.0.6.sh 
    source SOURCEME_RepeatScout_1.0.6 
    cd 1.0.6/src/
    wget http://www.repeatmasker.org/RepeatScout-1.0.6.tar.gz
    tar xzf RepeatScout-1.0.6.tar.gz 
    cd RepeatScout-1.0.6/
    make
    cd ..
    rmdir $PREFIX
    mv RepeatScout-1.0.6 $PREFIX


TransDecoder/5.5.0
========================

<https://github.com/TransDecoder/TransDecoder/wiki>

Used under license:
Custom open-source 'AS IS'
<https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt>

Structure creating script (makeroom_TransDecoder_5.5.0.sh) moved to /sw/bioinfo/TransDecoder/makeroom_5.5.0.sh

LOG
---

    TOOL=TransDecoder
    VERSION=5.5.0
    TOOLDIR=/sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/TransDecoder/TransDecoder/wiki -l "Custom open-source 'AS IS'" -L https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt -d "identifies candidate coding regions within transcript sequences"
    ./makeroom_TransDecoder_5.5.0.sh 
    source SOURCEME_TransDecoder_5.5.0 
    cat TransDecoder-5.3.0-install-README.md
    cd $SRCDIR
    wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.5.0.tar.gz
    tar xzf TransDecoder-v5.5.0.tar.gz 
    rmdir $PREFIX
    mv TransDecoder-TransDecoder-v5.5.0 $PREFIX
    cd $PREFIX

Load a blast and hmmer module, and make sure that $modroot/util and $modroot/util/misc are added to PATH.

Also, expand the module help to reflect better understanding of how to use the tool.

mafTools/20170914-82077ac
========================

<https://github.com/dentearl/mafTools/>

Used under license:
Custom As Is
<https://github.com/dentearl/mafTools/blob/master/LICENSE>

Structure creating script (makeroom_mafTools_20170914-82077ac.sh) moved to /sw/bioinfo/mafTools/makeroom_20170914-82077ac.sh

LOG
---

Use the system python2.7.  Ensure that you can import numpy with it.

    TOOL=mafTools
    VERSION=20170914-82077ac
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://github.com/dentearl/mafTools/ -l "Custom As Is" -L https://github.com/dentearl/mafTools/blob/master/LICENSE  -d "collection of tools that operate on Multiple Alignment Format (maf) files"
    ./makeroom_mafTools_20170914-82077ac.sh 
    cd mafTools/
    source SOURCEME_mafTools_20170914-82077ac 
    vi mafTools-20170914-82077ac_post-install.sh
    ml git/2.28.0
    ml gcc/5.5.0
    cd $SRCDIR
    git clone https://github.com/benedictpaten/pinchesAndCacti
    git clone https://github.com/benedictpaten/sonLib/
    git clone https://github.com/dentearl/mafTools/
    cd sonLib/
    make && make test
    cd ..
    cd pinchesAndCacti/
    make && make test
    cd ..
    cd mafTools/

Add -lm to the ends of the mafExtractor build lines and the test lines.

    vi mafExtractor/Makefile 

Now make, and install.

    make && make test
    cp -av bin $PREFIX

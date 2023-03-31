mafTools/20220617-4e5b5de
=========================

<https://github.com/dentearl/mafTools/>

Used under license:
Custom As Is
<https://github.com/dentearl/mafTools/blob/master/LICENSE>

Structure creating script (makeroom_mafTools_20220617-4e5b5de.sh) moved to /sw/bioinfo/mafTools/makeroom_20220617-4e5b5de.sh

LOG
---

Use system python2.7 (2.7.5), which contains a numpy.  On miarka it's 2.7.18 so
maybe it won't work there.  It definitely won't work since there's no numpy
package installed for the system python2.7.

    TOOL=mafTools
    VERSION=20220617-4e5b5de
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://github.com/dentearl/mafTools/ -l "Custom As Is" -L https://github.com/dentearl/mafTools/blob/master/LICENSE  -d "collection of tools that operate on Multiple Alignment Format (maf) files"
    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/bioinfo/$TOOL/SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR
    ml git/2.34.1 gcc/5.5.0
    git clone https://github.com/benedictpaten/pinchesAndCacti
    git clone https://github.com/benedictpaten/sonLib/
    git clone https://github.com/dentearl/mafTools/
    cd sonLib/
    git reset --hard 5cbc1583797e567900b53ccd50f0b8e72b973d44
    make && make test
    cd ..
    cd pinchesAndCacti/
    git reset --hard 85b67f3795d55b5e0f812a9a4d0c82a49243c607
    make && make test
    cd ..
    cd mafTools/
    git reset --hard 4e5b5de
    make 
    make 

You might need to do a 'make' again. There should be 15 tools under `bin/`.

    make test

A couple tests fail because they can't find a log10 function. That's fine.

    cp -av $SRCDIR/mafTools/bin $PREFIX/

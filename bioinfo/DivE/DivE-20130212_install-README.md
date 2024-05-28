DivE/20130212
=============

<https://ccb.jhu.edu/software/dive/index.shtml>

Used under license:
OSI Certified Open Source
<http://www.opensource.org/docs/definition.php>

Structure creating script (makeroom_DivE_20130212.sh) moved to /sw/bioinfo/DivE/makeroom_20130212.sh

LOG
---

Took a bit of work. First installed clapack/3.2.1 and that was also interesting.  But, once that was in place, this was easy with a bit of fiddling.

The "most clever" bit is that since it is unversioned, I downloaded the tarball using `wget --timestamping` to find out its modification and used that to version the module.

    makeroom.sh -t DivE -v 20130212 -c bioinfo -s phylogeny -w https://ccb.jhu.edu/software/dive/index.shtml -l "OSI Certified Open Source" -L http://www.opensource.org/docs/definition.php -d "DivE: Divergence by Evolution, specifically designed to find regions that evolve at a slower or faster rate than the neutral evolution rate in any clade of a phylogeny of a set of very closely related species."
    ./makeroom_DivE_20130212.sh 
    source /sw/bioinfo/DivE/SOURCEME_DivE_20130212

    cd $SRCDIR
    wget --timestamping ftp://ftp.ccb.jhu.edu/pub/software/dive/DivE.tgz
    tar xf DivE.tgz 
    ml gcc/6.4.0
    ml clapack/3.2.1

    cd DivE/
    cd src/

Modify the makefile to not include -lF77 -lI77 and to include -lf2c which is from clapack/3.2.1.

    sed -i 's/-lF77 -lI77/-lf2c/' Makefile 

Now make with CLAPACKPATH defined.

    make CLAPACKPATH=$CLAPACKPATH

Lift out the executable.

    cd ..
    ll bin
    cp -av bin $PREFIX/
    cd $PREFIX/bin
    ./DivE 


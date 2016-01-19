SpeedSeq 0.1.0-20151112
=======================



Log
---

    mkdir -p /sw/apps/bioinfo/SpeedSeq
    cd /sw/apps/bioinfo/SpeedSeq
    mkdir -p 0.1.0-20151121 mf

Adding the date because I am cloning the repository, not the 0.1.0 release.

    cd 0.1.0-20151121
    git clone --recursive https://github.com/hall-lab/speedseq

    mv speedseq milou
    cd milou/
    export SPEEDSEQ_DIR=$PWD
    module load git/2.5.0
    module load gcc/4.9.2
    module load python/2.7.6
    make

In the process, I learned that scipy for python/2.7.6 (together with a few
other modules that were removed because of me) was wesley:wesley and I could
not access it.  Moved it to another name, reinstalled it, and made sure the
rest was group sw.

I originally thought that the CNVnator module would be fine to use, but they
have a custom multithreaded CNVnator and did not mention that specifically.
We also need to make some changes to the CNVnator Makefile to allow for 
compilation and ROOT v.6.  These include adding `-std=c++11` to the C++ flags
and changing `-lCint` to `-lCling`.  These need to be completed before the above
make will work.

    milou-b: /sw/apps/bioinfo/SpeedSeq/0.1.0-20151121/milou/src/cnvnator $ diff Makefile.orig Makefile
    5c5,9
    < ROOTLIBS  = -L$(ROOTSYS)/lib -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d \
    ---
    > ##UPPMAX
    > #ROOTLIBS  = -L$(ROOTSYS)/lib -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d \
    >       -lGpad -lTree -lRint -lMatrix -lPhysics \
    >       -lMathCore -lThread -lGui
    > ROOTLIBS  = -L$(ROOTSYS)/lib -lCore -lCling -lRIO -lNet -lHist -lGraf -lGraf3d \
    11c15,16
    < CXX    = g++ $(ROOTFLAGS) -DCNVNATOR_VERSION=\"$(VERSION)\"
    ---
    > #CXX    = g++ $(ROOTFLAGS) -DCNVNATOR_VERSION=\"$(VERSION)\" ##UPPMAX
    > CXX    = g++ $(ROOTFLAGS) -DCNVNATOR_VERSION=\"$(VERSION)\" -std=c++11

Now load ROOT and continue, if necessary.

    module load ROOT/6.04.08
    make cnvnator-multi

This terminates with copying cnvnator-multi and several scripts to `bin/`, so these
should be good to go.

Now modify speedseq.config to point to the variant_effect_predictor.pl script
from vep/82 and the VEP cache from /sw/data/uppnex/vep/82, and make sure it refers
to its own cnvnator-multi and not the CNVnator/0.3.2 module... that was my mistake.

    vi bin/speedseq.config

Now test out the install.

    cd example
    ./run_speedseq.sh 


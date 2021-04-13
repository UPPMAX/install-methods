OpenBUGS/3.2.3
========================

<http://www.openbugs.net>

Used under license:
GPL v2

Structure creating script (makeroom_OpenBUGS_3.2.3.sh) moved to /sw/apps/OpenBUGS/makeroom_3.2.3.sh

LOG
---

We had an old installation of 3.2.3 for milou and tintin.  This hasn't updated
for some time, and this is still the most recent version, so just install there
for the new clusters.


    cd /sw/apps
    TOOL=OpenBUGS
    VERSION=3.2.3
    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w http://www.openbugs.net -d "software package for performing Bayesian inference Using Gibbs Sampling" -l "GPL v2"
    ./makeroom_OpenBUGS_3.2.3.sh 
    cd $TOOL
    source SOURCEME_OpenBUGS_3.2.3 
    cd $VERSIONDIR
    rm -rf milou tintin
    cd $SRCDIR

    wget https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2018/04/OpenBUGS-3.2.3.tar.gz
    tar xf OpenBUGS-3.2.3.tar.gz 
    cd OpenBUGS-3.2.3/
    module load autoconf/2.69
    module load automake/1.16.1
    module load m4/1.4.17
    module load libtool/2.4.6
    module load gcc/9.3.0
    ./configure --prefix=$PREFIX
    make && make install


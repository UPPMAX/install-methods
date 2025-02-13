PBSIM3/3.0.4
========================

<https://github.com/yukiteruono/pbsim3/>

Used under license:
GPL v2


Structure creating script (makeroom_PBSIM3_3.0.4.sh) moved to /sw/bioinfo/PBSIM3/makeroom_3.0.4.sh

LOG
---

    makeroom.sh -t PBSIM3 -v 3.0.4 -c bioinfo -s assembly -w https://github.com/yukiteruono/pbsim3/ -l "GPL v2" -d "PBSIM3: a simulator for all types of PacBio and ONT long reads" -k long-reads,pacbio,nanopore,simulation
    ./makeroom_PBSIM3_3.0.4.sh 
    source /sw/bioinfo/PBSIM3/SOURCEME_PBSIM3_3.0.4
    cd $SRCDIR
    ml gcc/12.3.0
    wget https://github.com/yukiteruono/pbsim3/archive/refs/tags/v3.0.4.tar.gz
    tar xf v3.0.4.tar.gz 
    cd pbsim3-3.0.4/
    ./configure --prefix=$PREFIX
    make
    make install

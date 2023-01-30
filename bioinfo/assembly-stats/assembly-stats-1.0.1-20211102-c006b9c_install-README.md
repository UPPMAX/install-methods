assembly-stats/1.0.1-20211102-c006b9c
========================

<https://github.com/sanger-pathogens/assembly-stats>

Used under license:
GPL v3
<https://github.com/sanger-pathogens/assembly-stats/blob/master/LICENSE>

Structure creating script (makeroom_assembly-stats_1.0.1-20211102-c006b9c.sh) moved to /sw/bioinfo/assembly-stats/makeroom_1.0.1-20211102-c006b9c.sh

LOG
---

Don't use the module versions zlib/1.2.12, xz/5.2.6 or bzip2/1.0.8 since a subordinate dependency is not built with them visible.  Disappointing.


    makeroom.sh -t assembly-stats -v 1.0.1-20211102-c006b9c -c bioinfo -s assembly -w https://github.com/sanger-pathogens/assembly-stats -d "Get assembly statistics from FASTA and FASTQ files" -l "GPL v3" -L https://github.com/sanger-pathogens/assembly-stats/blob/master/LICENSE 
    ./makeroom_assembly-stats_1.0.1-20211102-c006b9c.sh 
    cd /sw/bioinfo/assembly-stats/
    source SOURCEME_assembly-stats_1.0.1-20211102-c006b9c 
    cd $SRCDIR
    ml gcc/10.3.0
    ml git/2.34.1
    ml cmake/3.22.2

    git clone --recursive https://github.com/sanger-pathogens/assembly-stats
    cd assembly-stats/
    mkdir build
    cd build
    cmake -DINSTALL_DIR:PATH=$PREFIX ..
    make
    make install

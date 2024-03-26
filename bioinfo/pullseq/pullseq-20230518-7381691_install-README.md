pullseq/20230518-7381691
========================

<https://github.com/bcthomas/pullseq>

Used under license:



Structure creating script (makeroom_pullseq_20230518-7381691.sh) moved to /sw/bioinfo/pullseq/makeroom_20230518-7381691.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "pullseq" "-v" "20230518-7381691" "-d" "Utility program for extracting sequences from a fasta/fastq file" "-w" "https://github.com/bcthomas/pullseq" "-s" "annotation"
    ./makeroom_pullseq_20230518-7381691.sh

    # Load modules
    module load gcc/4.8.3
    module load zlib/1.3

    # git clone
    cd $SRCDIR
    git clone https://github.com/bcthomas/pullseq.git .
    git checkout ${VERSION##*-}
    git reset --hard

    # Install
    VERSION_OLD=$VERSION && unset VERSION
    ./bootstrap
    VERSION=$VERSION_OLD && unset VERSION_OLD
    ./configure --prefix=$PREFIX
    make -j 4
    make install



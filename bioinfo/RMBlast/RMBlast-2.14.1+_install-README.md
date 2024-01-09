RMBlast/2.14.1+
===============

<https://www.repeatmasker.org/rmblast/>

Used under license:
Public domain


Structure creating script (makeroom_RMBlast_2.14.1+.sh) moved to /sw/bioinfo/RMBlast/makeroom_2.14.1+.sh

LOG
---

    makeroom.sh -f -c bioinfo -s alignment -t RMBlast -v 2.14.1+ -w https://www.repeatmasker.org/rmblast/ -l "Public domain" -d "RMBlast is a RepeatMasker compatible version of the standard NCBI blastn program. The primary difference between this distribution and the NCBI distribution is the addition of a new program "rmblastn" for use with RepeatMasker and RepeatModeler."
    ./makeroom_RMBlast_2.14.1+.sh 
    source /sw/bioinfo/RMBlast/SOURCEME_RMBlast_2.14.1+
    cd $SRCDIR
    wget https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-linux.tar.gz
    tar xf rmblast-2.14.1+-x64-linux.tar.gz 
    rmdir $PREFIX && mv rmblast-2.14.1 $PREFIX

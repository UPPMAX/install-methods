any2fasta/0.4.2
===============

<https://github.com/tseemann/any2fasta>

Used under license:
GPL v3.0


Structure creating script (makeroom_any2fasta_0.4.2.sh) moved to /sw/bioinfo/any2fasta/makeroom_0.4.2.sh

LOG
---

    makeroom.sh -f -t any2fasta -v 0.4.2 -c bioinfo -s misc -w https://github.com/tseemann/any2fasta -l "GPL v3.0" -d "Convert various sequence formats to FASTA"
    ./makeroom_any2fasta_0.4.2.sh 
    source /sw/bioinfo/any2fasta/SOURCEME_any2fasta_0.4.2 && cd $SRCDIR
    wget https://github.com/tseemann/any2fasta/archive/refs/tags/v0.4.2.tar.gz
    tar xf v0.4.2.tar.gz 

Test.

    cd any2fasta-0.4.2/
    ./any2fasta test.clw 
    ./any2fasta test.clw >/dev/null
    cd ..

Replace PREFIX with the git repository.

    rmdir $PREFIX
    mv any2fasta-0.4.2 $PREFIX


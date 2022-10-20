abyss/2.3.5_k128
========================
<https://github.com/bcgsc/abyss>

Used under license:



Structure creating script (makeroom_abyss_2.3.5.sh) moved to /sw/bioinfo/abyss/makeroom_2.3.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "abyss" "-v" "2.3.5" "-w" "https://github.com/bcgsc/abyss" "-d" "ABySS is a de novo sequence assembler intended for short paired-end reads and genomes of all sizes." "-s" "assembly" "-f"
    ./makeroom_abyss_2.3.5_k128.sh

    TOOL=abyss
    VERSION=2.3.5_k128

# Download
    cd $SRCDIR
    wget https://github.com/bcgsc/abyss/archive/refs/tags/2.3.5.tar.gz
    tar xfvz 2.3.5.tar.gz --strip-components=1

# Configure and make
    module load gcc/6.3.0
    module load openmpi/2.1.0
    module load boost/1.63.0_gcc6.3.0
    module load sparsehash/2.0.3
    module load sqlite/3.16.2

    ./autogen.sh
    mkdir build
    cd build

    ../configure --with-mpi=$MPI_ROOT --prefix=$PREFIX --enable-maxk=128
    make -j 10
    make install










abyss/1.3.5
===========

Incomplete.

    ./configure --with-mpi=$MPI_ROOT --prefix=//////sw/apps/bioinfo/abyss/1.3.5/kalkyl
    ./configure --with-mpi=$MPI_ROOT --enable-maxk=96 --prefix=//////sw/apps/bioinfo/abyss/1.3.5-max/kalkyl

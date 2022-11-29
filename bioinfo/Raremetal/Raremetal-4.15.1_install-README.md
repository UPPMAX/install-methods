Raremetal/4.15.1
========================

<https://github.com/statgen/raremetal>

Used under license:



Structure creating script (makeroom_Raremetal_4.15.1.sh) moved to /sw/bioinfo/Raremetal/makeroom_4.15.1.sh

LOG
---

    makeroom.sh "-t" "Raremetal" "-v" "4.15.1" "-d" "Raremetal: A tool for rare variants meta-analysis" "-w" "https://github.com/statgen/raremetal" "-c" "bioinfo" "-s" "misc"
    ./makeroom_Raremetal_4.15.1.sh

    source /sw/bioinfo/Raremetal/SOURCEME_Raremetal_4.15.1 && cd $SRCDIR

    wget https://github.com/statgen/raremetal/archive/refs/tags/v4.15.1.tar.gz

    tar xvf v4.15.1.tar.gz

    module load gcc/10.3.0
    module load cmake/3.22.2
    module load bioinfo-tools
    module load htslib/1.14

    cd raremetal-4.15.1
    cget install zlib,https://zlib.net/fossils/zlib-1.2.11.tar.gz
    cget install -f requirements.txt
    mkdir build && cd build
    export LIB_HTS=/sw/bioinfo/htslib/1.14/rackham/lib
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_TOOLCHAIN_FILE=../cget/cget/cget.cmake -DBUILD_TESTS=1 .. 

    # make links in $PREFIX/bin

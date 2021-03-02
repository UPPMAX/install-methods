snpAD/0.3.4
========================

<https://bioinf.eva.mpg.de/snpAD>

Used under license:
misc open-source

Structure creating script (makeroom_snpAD_0.3.4.sh) moved to /sw/bioinfo/snpAD/makeroom_0.3.4.sh

LOG
---

The tool has some build expectations that are specific.  Also includes its own bamtools so use Uppmax's bamtools.


    TOOL=snpAD
    VERSION=0.3.4
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "snpAD" -v "0.3.4" -w "https://bioinf.eva.mpg.de/snpAD" -l "open-source" -d "an ancient-DNA aware genotyper"
    ./makeroom_snpAD_0.3.4.sh
    source SOURCEME_snpAD_0.3.4

    cd $SRCDIR

    [[ -f ${TOOL}-${VERSION}.tar.gz ]] || wget https://bioinf.eva.mpg.de/$TOOL/${TOOL}-${VERSION}.tar.gz
    [[ -d ${TOOL}-${VERSION} ]] || tar xf ${TOOL}-${VERSION}.tar.gz
    cd ${TOOL}-${VERSION}

    module load gcc/9.3.0
    module load bioinfo-tools
    module load bamtools/2.5.1


### Makefile changes

* Use our installed Bamtools
* Use system nlopt and popt libraries
* Build dynamic not static executables

Changes compared to original snpAD-0.3.4 tree (`<`)and changes required to compile (`>`).

The file Bam2snpAD/Makefile :

    rackham5: /sw/bioinfo/snpAD/0.3.4/src $ diff orig/snpAD-0.3.4/Bam2snpAD/Makefile snpAD-0.3.4/Bam2snpAD/Makefile
    0a1
    > BAMTOOLS_INCLUDE = $(BAMTOOLS)/include/bamtools
    2c3
    < all: Bam2snpAD bamtools snpADJoin
    ---
    > all: Bam2snpAD snpADJoin
    4,14c5,9
    < bamtools/build/src/api/libbamtools.a:
    <     rm -rf bamtools
    <     git clone https://github.com/pezmaster31/bamtools.git
    <     mkdir bamtools/build || true
    <     cd bamtools/build ; cmake .. ; make
    <
    < Bam2snpAD: bamtools/build/src/api/libbamtools.a src/BamAliIt.cpp src/BamTable.cpp src/FastaSlurp.cpp
    <     g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/src -c -o src/BamAliIt.o src/BamAliIt.cpp
    <     g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/src -c -o src/BamTable.o src/BamTable.cpp
    <     g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/src -c -o src/FastaSlurp.o src/FastaSlurp.cpp
    <     g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/src -L bamtools/build/src/api/ -o Bam2snpAD src/BamAliIt.o src/BamTable.o src/FastaSlurp.o -lpopt -lz -static -lbamtools -lstdc++ -lz
    ---
    > Bam2snpAD: src/BamAliIt.cpp src/BamTable.cpp src/FastaSlurp.cpp
    >     g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/BamAliIt.o src/BamAliIt.cpp
    >     g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/BamTable.o src/BamTable.cpp
    >     g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/FastaSlurp.o src/FastaSlurp.cpp
    >     g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -o Bam2snpAD src/BamAliIt.o src/BamTable.o src/FastaSlurp.o -lpopt -lz -lbamtools -lstdc++ -lz
    28,29d22
    < super-clean:
    <     rm -f bamtools/lib/libbamtools.a


The file snpAD/Makefile :


    rackham5: /sw/bioinfo/snpAD/0.3.4/src $ diff orig/snpAD-0.3.4/snpAD/Makefile snpAD-0.3.4/snpAD/Makefile
    17c17
    <     $(CPP) -o snpADll snpADll.o ${OBJS} -lRmath /usr/lib/x86_64-linux-gnu/libnlopt.a -lm -lpthread -Wl,--no-as-needed -lpopt
    ---
    >     $(CPP) -o snpADll snpADll.o ${OBJS} -lRmath -lnlopt_cxx -lm -lpthread -Wl,--no-as-needed -lpopt
    20c20
    <     $(CPP) -o snpADci snpADci.o ${OBJS} -lRmath /usr/lib/x86_64-linux-gnu/libnlopt.a -lm -lpthread -Wl,--no-as-needed -lpopt
    ---
    >     $(CPP) -o snpADci snpADci.o ${OBJS} -lRmath -lnlopt_cxx -lm -lpthread -Wl,--no-as-needed -lpopt
    23c23
    <     $(CPP) -o snpAD snpAD.o ${OBJS} -lRmath /usr/lib/x86_64-linux-gnu/libnlopt.a -lm -lpthread -Wl,--no-as-needed -lpopt
    ---
    >     $(CPP) -o snpAD snpAD.o ${OBJS} -lRmath -lnlopt_cxx -lm -lpthread -Wl,--no-as-needed -lpopt


### Building and installing

Clean out existing static executables included with tool before building.

    make clean
    make
    make PREFIX=$PREFIX install

Check the RPATH info.

    cd $PREFIX/bin
    module unload gcc bamtools
    ldd * | grep -i 'not found'


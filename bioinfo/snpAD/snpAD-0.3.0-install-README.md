snpAD/0.3.0
===========

<https://bioinf.eva.mpg.de/snpAD/>

The tool has some build expectations that are specific.  Also includes its own bamtools so use Uppmax's bamtools.


LOG
---

    TOOL=snpAD
    VERSION=0.3.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL; done
    cd src/
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://bioinf.eva.mpg.de/$TOOL/${TOOL}-${VERSION}.tar.bz2
    [[ -d ${TOOL}-${VERSION} ]] || tar xjf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}

    module load gcc/6.3.0
    module load bioinfo-tools
    module load bamtools/2.5.1

Now the Makefiles require some changes.

### Changes between original snpAD-0.3.0 tree (`<`)and changes required to compile (`>`).

    diff -r orig/snpAD-0.3.0/Bam2snpAD/Makefile snpAD-0.3.0/Bam2snpAD/Makefile
    2c2
    < all: Bam2snpAD bamtools snpADJoin
    ---
    > all: Bam2snpAD snpADJoin
    4,14c4,16
    < bamtools/lib/libbamtools.a: 
    < 	rm -rf bamtools
    < 	git clone https://github.com/pezmaster31/bamtools.git
    < 	mkdir bamtools/build
    < 	cd bamtools/build ; cmake .. ; make
    < 
    < Bam2snpAD: bamtools/lib/libbamtools.a src/BamAliIt.cpp src/BamTable.cpp src/FastaSlurp.cpp 
    < 	g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/include/ -c -o src/BamAliIt.o src/BamAliIt.cpp 
    < 	g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/include/ -c -o src/BamTable.o src/BamTable.cpp 
    < 	g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/include/ -c -o src/FastaSlurp.o src/FastaSlurp.cpp 
    < 	g++ -std=c++11 -O3 -g -I src/ -Wall -I bamtools/include/ -L bamtools/lib -o Bam2snpAD src/BamAliIt.o src/BamTable.o src/FastaSlurp.o -lpopt -lz -static -lbamtools -lstdc++ -lz
    ---
    > BAMTOOLS_INCLUDE = $(BAMTOOLS)/include/bamtools
    > 
    > #bamtools/lib/libbamtools.a: 
    > #	rm -rf bamtools
    > #	git clone https://github.com/pezmaster31/bamtools.git
    > #	mkdir bamtools/build
    > #	cd bamtools/build ; cmake .. ; make
    > 
    > Bam2snpAD: src/BamAliIt.cpp src/BamTable.cpp src/FastaSlurp.cpp 
    > 	g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/BamAliIt.o src/BamAliIt.cpp 
    > 	g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/BamTable.o src/BamTable.cpp 
    > 	g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -c -o src/FastaSlurp.o src/FastaSlurp.cpp 
    > 	g++ -std=c++11 -O3 -g -I src/ -Wall -I $(BAMTOOLS_INCLUDE) -o Bam2snpAD src/BamAliIt.o src/BamTable.o src/FastaSlurp.o -lpopt -lz  -lbamtools -lstdc++ -lz
    diff -r orig/snpAD-0.3.0/snpAD/Makefile snpAD-0.3.0/snpAD/Makefile
    15c15
    < 	$(CPP) -o snpADll snpADll.o ${OBJS} -lRmath /usr/lib/x86_64-linux-gnu/libnlopt.a -lm -lpthread -Wl,--no-as-needed -lpopt
    ---
    > 	$(CPP) -o snpADll snpADll.o ${OBJS} -lRmath -lnlopt_cxx -lm -lpthread -Wl,--no-as-needed -lpopt
    18c18
    < 	$(CPP) -o snpAD snpAD.o ${OBJS} -lRmath /usr/lib/x86_64-linux-gnu/libnlopt.a -lm -lpthread -Wl,--no-as-needed -lpopt
    ---
    > 	$(CPP) -o snpAD snpAD.o ${OBJS} -lRmath -lnlopt_cxx -lm -lpthread -Wl,--no-as-needed -lpopt

Now back to building.  Along the way, found a problem with `LD_RUN_PATH` and `LD_LIBRARY_PATH` definitions in the `bamtools/2.5.1` mf file.

    make
    make PREFIX=$PFX install

Check the RPATH info.

    cd $PFX/bin
    module unload gcc bamtools
    ldd * | grep -i 'not found'


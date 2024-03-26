CHEUI/20230518-c1c9ab6
========================

<https://github.com/comprna/CHEUI>

Used under license:
GPL


Structure creating script (makeroom_CHEUI_20230518-c1c9ab6.sh) moved to /sw/bioinfo/CHEUI/makeroom_20230518-c1c9ab6.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "CHEUI" "-v" "20230518-c1c9ab6" "-w" "https://github.com/comprna/CHEUI" "-c" "bioinfo" "-l" "GPL" "-d" "(Methylation (CH3) Estimation Using Ionic current) is an RNA modification detection software for Oxford Nanopore direct RNA sequencing data. CHEUI can be used to detect m6A and m5C in individual reads at single-nucleotide resolution from any sample (e.g. single condition), or detect differential m6A or m5C between any two conditions." "-s" "misc"
    ./makeroom_CHEUI_20230518-c1c9ab6.sh
    source /sw/bioinfo/CHEUI/SOURCEME_CHEUI_20230518-c1c9ab6 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/comprna/CHEUI.git
    mv CHEUI/* .
    /bin/rm -r CHEUI
    cd scripts/preprocessing_CPP/
We need to change the Makefile to be able to include full paths to PicklingTools/libptools.so
Resulting diff should look like:
  diff Makefile $PREFIX/scripts/preprocessing_CPP/Makefile
  3c3
  < CFLAGS=-Wall -Wextra -O3 -fno-strict-aliasing -DLINUX_ -DOC_NEW_STYLE_INCLUDES -Wno-deprecated -I./PicklingTools/opencontainers_1_8_5/include -I./PicklingTools -pthread -D_REENTRANT
  ---
  > CFLAGS=-Wall -Wextra -O3 -fno-strict-aliasing -DLINUX_ -DOC_NEW_STYLE_INCLUDES -Wno-deprecated -I./PicklingTools/opencontainers_1_8_5/include -I./PicklingTools -pthread -D_REENTRANT -Wl,-rpath,${PWD}/PicklingTools -Wl,-rpath,${LD_LIBRARY_PATH}
  8c8
  <       $(CC) -o $(EXEC) $(CFLAGS) main.cpp kmer.hpp PicklingTools/libptools.so
  ---
  >       $(CC) -o $(EXEC) $(CFLAGS) main.cpp kmer.hpp -L ${PWD}/PicklingTools -lptools

Compile
    ml gcc/11.3.0
    ./build.sh

Check
    cd ..
    ldd preprocessing_CPP/CHEUI
Should give full path similar to: 'libptools.so => /sw/bioinfo/CHEUI/20230518-c1c9ab6/rackham/scripts/preprocessing_CPP/PicklingTools/libptools.so '
 
  
    

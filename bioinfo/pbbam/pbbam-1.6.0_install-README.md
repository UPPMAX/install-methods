pbbam/1.6.0
===========

<https://github.com/PacificBiosciences/pbbam>

Used under license:
PacBio open source license
<https://github.com/PacificBiosciences/pbbam/blob/master/LICENSE.txt>

Structure creating script (makeroom_pbbam_1.6.0.sh) moved to /sw/bioinfo/pbbam/makeroom_1.6.0.sh

LOG
---

    cd /sw/bioinfo
    makeroom.sh -f -c "bioinfo" -s "assembly" -t "pbbam" -v "1.6.0" -w "https://github.com/PacificBiosciences/pbbam" -d "software package provides components to create\, query\, \& edit PacBio BAM files and associated indices\, including a core C++ library\, bindings for additional languages\, and command-line utilities" -l "PacBio open source license" -L "https://github.com/PacificBiosciences/pbbam/blob/master/LICENSE.txt"
    ./makeroom_pbbam_1.6.0.sh
    cd pbbam
    source SOURCEME_pbbam_1.6.0 
    module load gcc/9.3.0
    module load swig/3.0.12
    module load zlib/1.2.11
    module load boost/1.75.0-gcc9.3.0
    module load htslib/1.12
    module load doxygen/1.8.11
    module load bioinfo-tools
    module load SMRT/9.0.0

    module load meson/0.57.2  # also loads ninja/1.10.0
    module load python/3.8.7

    cd $SRCDIR
    git clone https://github.com/PacificBiosciences/pbbam.git
    cd pbbam/
    git checkout v1.6.0
    mkdir build
    cd build
    meson --prefix $PREFIX -Denable-tests=true ..
    ninja
    ninja test
    ninja install

Update RPATH information on libpbbam.so and the executables.  Strangely
libpbcopper.so knows its own RPATHs.


    cd $PREFIX/lib64

    module load patchelf

    patchelf --set-rpath /sw/comp/gcc/9.3.0_rackham/lib64:/sw/libs/zlib/1.2.11/rackham/lib:/sw/bioinfo/htslib/1.12/rackham/lib:/sw/bioinfo/pbbam/1.6.0/rackham/lib64 libpbbam.so
    cd ../bin/
    patchelf --set-rpath /sw/comp/gcc/9.3.0_rackham/lib64:/sw/libs/zlib/1.2.11/rackham/lib:/sw/bioinfo/htslib/1.12/rackham/lib:/sw/bioinfo/pbbam/1.6.0/rackham/lib64 bam2sam ccs-kinetics-bystrandify pbbamify pbindex pbindexdump pbmerge 

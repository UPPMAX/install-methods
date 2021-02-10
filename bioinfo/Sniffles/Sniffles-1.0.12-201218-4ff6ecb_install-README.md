Sniffles/1.0.12-201218-4ff6ecb
========================

<https://github.com/fritzsedlazeck/Sniffles>

Used under license:
MIT license
<>

Structure creating script (makeroom_Sniffles_1.0.12-201218-4ff6ecb.sh) moved to /sw/bioinfo/Sniffles/makeroom_1.0.12-201218-4ff6ecb.sh

LOG
---

    TOOL=Sniffles
    VERSION=1.0.12-201218-4ff6ecb
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Sniffles/1.0.12-201218-4ff6ecb/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "Sniffles" -v "1.0.12-201218-4ff6ecb" -w "https://github.com/fritzsedlazeck/Sniffles" -c "bioinfo" -l "MIT license" -d "Sniffles is a structural variation caller using third generation sequencing \(PacBio or Oxford Nanopore\)" -x "INSTALL" -f
    ./makeroom_Sniffles_1.0.12-201218-4ff6ecb.sh

     cd 1.0.12-201218-4ff6ecb/
     cd src/
     git clone https://github.com/fritzsedlazeck/Sniffles
     cd Sniffles/
     mkdir -p build
     cd build
     cmake ..
     make
     cd ../bin/
     cd sniffles-core-1.0.12/
     cp sniffles* $PREFIX



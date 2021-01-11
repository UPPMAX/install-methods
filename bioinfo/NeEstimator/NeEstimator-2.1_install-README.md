NeEstimator/2.1
========================

<http://www.molecularfisherieslaboratory.com.au/neestimator-software/>

Used under license:
AS IS
<>

Structure creating script (makeroom_NeEstimator_2.1.sh) moved to /sw/bioinfo/NeEstimator/makeroom_2.1.sh

LOG
---

    TOOL=NeEstimator
    VERSION=2.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/NeEstimator/2.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NeEstimator" -v "2.1" -w "http://www.molecularfisherieslaboratory.com.au/neestimator-software/" -c "bioinfo" -l "AS IS" -d "The NeEstimator software estimates genetic effective population sizes \(Ne\) from genotype data." -x "INSTALL" -s "misc"
    ./makeroom_NeEstimator_2.1.sh
    cd $SRCDIR
#   Register at http://www.molecularfisherieslaboratory.com.au/downloadables/#downloads    
#   Then you can download zip file, th binaries and test files, perhaps via PC and then upload to $SRCDIR
#   unzip
#   mandatory: replace space with "_"
    cd Zip_Folder_64_bit_191125/
#   TEST
    java -jar ./NeEstimator2x1.jar
  
    cp NeEstimator2x1.jar $PREFIX
    cp Ne2-1L $PREFIX
    cp -r Help/ $PREFIX
    cp -r Example\ output\ file/ $PREFIX
    cp -r Batch\ Files/ $PREFIX
    cp -r Accessory\ files/ $PREFIX
    cp -r Example\ input\ data/ $PREFIX


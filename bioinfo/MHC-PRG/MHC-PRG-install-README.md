TOOL=MHC-PRG
VERSION=1.00
CLUSTER=${CLUSTER:?CLUSTER must be set}
BASE=/sw/apps/bioinfo
INST=$BASE/$TOOL/$VERSION/$CLUSTER

mkdir $BASE/$TOOL
mkdir $BASE/$TOOL/$VERSION
mkdir $BASE/$TOOL/$VERSION/$CLUSTER
[[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL ; done
mkdir $INST/src
mkdir $INST/obj
mkdir $INST/bin
mkdir $INST/tmp
mkdir $INST/tmp2
mkdir $INST/tmp2/GS_nextGen
mkdir $INST/tmp2/GS_nextGen/hla
cd $INST/src
git clone https://github.com/AlexanderDilthey/MHC-PRG.git
cd MHC-PRG

# The src directory is oddly placed because of specifications from developer
#/sw/apps/bioinfo/MHC-PRG/1.00/$CLUSTER/src/
#Edit the makefile in /sw/apps/bioinfo/MHC-PRG/1.00/rackham/src/MHC-PRG with the folowing lines replacing INCS and LIBS

INCS = -I/sw/apps/bioinfo/bamtools/2.5.1/rackham/include -I/sw/apps/bioinfo/bamtools/2.5.1/src/bamtools-2.5.1/src -Isw/apps/build/boost/1.63.0_gcc6.3.0/rackham/include
LIBS = -L/sw/apps/build/boost/1.63.0_gcc6.3.0/rackham/lib -L/sw/apps/build/boost/1.63.0_gcc6.3.0/rackham/lib/libboost_filesystem.so -L/sw/apps/bioinfo/bamtools/2.5.1/rackham/lib64 -lboost_random -lboost_system -lboost_filesystem -lboost_serialization -lbamtools -lz 

module load boost/1.63_gcc6.3.0
module load bamtools

make all

cd ..
cp bin/* ../bin/
cp obj/* ../obj/	

mkdir /sw/mf/common/bioinfo-tools/misc/MHC-PRG
cp -av mf/$VERSION /sw/mf/common/bioinfo-tools/misc/MHC-PRG/
all_mflink MHC-PRG 1.00



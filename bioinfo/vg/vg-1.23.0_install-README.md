vg/1.23.0
========================

<https://github.com/vgteam/vg>

Used under license:
MIT

Structure creating script (makeroom_vg_1.23.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/vg/makeroom_1.23.0.sh

LOG
---

    TOOL=vg
    VERSION=1.23.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

module load jansson/2.12
module load protobuf/3.11.4
module load gcc/9.3.0
module load cmake/3.13.2
module load lz4/1.9.2
module load git/2.21.0

cd $VERSIONDIR/src
git clone --recursive https://github.com/vgteam/vg.git .
git checkout v1.23.0

#dozeu was missing
cd $VERSIONDIR/src/deps/dozeu
mv .git ../.git_dozeu_old
git clone https://github.com/ocxtal/dozeu.git .
git checkout 29c669f


cd $VERSIONDIR/src
source source_me.sh
make -j 20

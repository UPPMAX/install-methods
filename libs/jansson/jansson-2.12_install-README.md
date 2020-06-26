jansson/2.12
========================

<https://github.com/akheron/jansson>

Used under license:
MIT

Structure creating script (makeroom_jansson_2.12.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/jansson/makeroom_2.12.sh

LOG
---

    TOOL=jansson
    VERSION=2.12
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER
    

   cd $VERSIONDIR/src
   wget https://github.com/akheron/jansson/archive/v2.12.tar.gz
   tar xfvz v2.12.tar.gz --strip 1
   autoreconf -i
   ./configure --prefix=$PREFIX
   make -j 10
   make install



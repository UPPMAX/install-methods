Qhull/2019.1
========================

<http://www.qhull.org/>

Used under license: Custom open-source "as is"


Structure creating script (makeroom_Qhull_2019.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/Qhull/makeroom_2019.1.sh

LOG
---

    TOOL=Qhull
    VERSION=2019.1
    cd /sw/libs
    makeroom.sh -t ${TOOL} -v ${VERSION} -w http://www.qhull.org/ -c libs -d "computes the convex hull, Delaunay triangulation, Voronoi diagram, halfspace intersection about a point, furthest-site Delaunay triangulation, and furthest-site Voronoi diagram" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget http://www.qhull.org/download/qhull-2019-src-7.3.2.tgz
    tar xzf qhull-2019-src-7.3.2.tgz 
    cd qhull-${VERSION}/
    mkdir uppmax_build
    cd uppmax_build/
    module load gcc/6.3.0 cmake/3.13.2
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make
    make install
    ctest

Use mf modified from zlib/1.2.11.

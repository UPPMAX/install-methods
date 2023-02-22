Qhull/2020.2
============

<http://www.qhull.org/>

Used under license: Custom open-source "as is"


Structure creating script (makeroom_Qhull_2020.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/Qhull/makeroom_2020.2.sh

LOG
---

    TOOL=Qhull
    VERSION=2020.2

    cd /sw/libs
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w http://www.qhull.org/ -c libs -d "computes the convex hull, Delaunay triangulation, Voronoi diagram, halfspace intersection about a point, furthest-site Delaunay triangulation, and furthest-site Voronoi diagram" 

    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/libs/Qhull/SOURCEME_Qhull_2020.2

    cd $SRCDIR

    wget http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz
    tar xf qhull-2020-src-8.0.2.tgz

    cd qhull-${VERSION}/
    mkdir uppmax_build
    cd uppmax_build/

    module load cmake/3.22.2
    module load gcc/10.3.0

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make
    make install

    ctest


netcdf-fortran/4.5.2
====================

    TOOL=netcdf-fortran
    VERSION=4.5.2
    cd /sw/libs
    mkdir $TOOL
    cd $TOOL
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir rackham
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src/
    wget https://github.com/Unidata/${TOOL}/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/

1525  mkdir build
1526  ml
1527  ml -netcdf
1528  ml -gcc
1529  ml gcc/5.4.0
1530  ml
1531  mkdir build
1532  cd build
1533  ll
1534  echo $PREFIX
1535  cd ../..
1536  cd ..
1537  cd rackham/
1538  PREFIX=$PWD
1539  cd ../src/netcdf-fortran-4.5.1/build/
1540  ml netcdf/4.7.1
1541  pushd .
1542  cd
1543  cd /sw/libs/netcdf/mf
1544  ll
1545  vi *
1546  mfshow -l netcdf
1547  rsync -Pa * /sw/mf/common/libraries/netcdf/
1548  ml
1549  ml -netcdf
1550  dirs
1551  popd
1552  ml netcdf/4.7.1
1553  ml
1554  ll
1555  cd ..
1556  rmdir build
1557  ll
1558  NFDIR=$PREFIX CPPFLAGS=-I$NCDIR/include LDFLAGS=-L$NCDIR/lib ./configure --prefix=$NFDIR
1559  make check
1560  NFDIR=$PREFIX  ./configure --prefix=$NFDIR
1561  make clean
1562  make distclean
1563  ll
1564  ./configure --prefix=$PREFIX
1565  make
1566  make install
1567  make check
1568  ./configure --help
1569  cd ..
1570  ll
1571  rm -rf netcdf-fortran-4.5.1/
1572  cd ../../..
1573  ll
1574  cd netcdf
1575  ll
1576  cd ..
1577  fixup netcdf-fortran
1578  ll
1579  cd netcdf
1580  ll
1581  cd 4.7.1
1582  ll
1583  cd ..
1584  cd netcdf
1585  cd ../netcdf-fortran
1586  ll
1587  cd 4.5.1/
1588  ll
1589  cd ../..
1590  ll
1591  mv glpk_old ../apps/doug-dumping-ground/
1592  cd dlib/
1593  ll
1594  cat dlib-19-15-install-README.md 
1595  mfshow -l dlib
1596  ll
1597  cd ..
1598  cd netcdf-fortran/
1599  ll
1600  history > netcdf-fortran-4.5.1_install-README.md

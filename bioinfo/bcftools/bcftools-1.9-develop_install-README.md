bcftools/1.9-develop
============

<http://www.htslib.org/doc/bcftools.html>

Used under license:
GPL v3, because GSL is used.
Using the `gsl/2.3` module means that we must compile with `gcc/6.3.0`.

Structure creating script (makeroom_bcftools_1.9-develop.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bcftools/makeroom_1.9-develop.sh


Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Development version which includes a new plugin +split-vep requested by a user.
As with others, built with system compiler and the development version of
htslib as well.  HTSlib was built with extra capabilities.


LOG
---

    TOOL=bcftools
    VERSION=1.9-develop
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files"
    ./makeroom_bcftools_1.9-develop.sh 

    source SOURCEME_bcftools_1.9-develop 
    cd $VERSION/src

    module load git/2.21.0

    git clone --branch=develop https://github.com/samtools/htslib.git
    git clone --branch=develop https://github.com/samtools/bcftools.git

    module load m4/1.4.17
    module load autoconf/2.69
    module load automake 1.16.1
    module load gcc/6.3.0
    module load gsl/2.3
    module load zlib/1.2.11
    module load libcurl/7.45.0

    cd htslib

Must build `./configure` script. Ignore errors here.

    autoheader
    autoconf

This enables Amazon S3 and Google Cloud Services and plugins support in htslib.

    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make
    make test
    make install

Now build development bcftools with this HTSlib.

    cd ../bcftools/
    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl

Edit the makefile so that GSL libraries are found correctly.

    vi +140 Makefile

and change this line to read:

    GSL_LIBS = -lgsl -lgslcblas

Now build with the `USE_GPL` flag set:

    make USE_GPL=1

Set PATH and LD_LIBRARY_PATH for tests.

    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make test

    make install

Previously, some of these tests failed, but all of them now work... odd.

    make install


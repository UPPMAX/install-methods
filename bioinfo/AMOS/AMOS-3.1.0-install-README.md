AMOS 3.1.0
==========

This file is small, but the pain was great.

It required MUMmer and blat to be loaded. 

It also wants access to Qt4.  This is simplest by giving it the location of the Qt4 qmake file with:

    --with-qmake-qt4=/usr/lib64/qt4/bin/qmake

It also wants access to Celera Assembler (CA, cabog) internals.  I downloaded the source distribution of cabog 8.1 and built that, giving the option:

    --with-CA-dir=/sw/apps/bioinfo/cabog/8.1/src/wgs-8.1/Linux-amd64

Then it turns out AMOS was expecting the CA header files to end in .h, not .H.  I created links to .h versions for each of the CA header files:

    cd /sw/apps/bioinfo/cabog/8.1/src/wgs-8.1/src
    for F in $(find . -type f -name '*.H') ; do
        D=$(dirname $F);
        F=$(basename $F); FF=${F%.H}.h
        ( cd $D; ln -s $F $FF )
    done

**Then** it died because it was not finding a definition of UINT32_MAX, as a
check for general limit macros in the CA header file `AS_global.H`.  It turns
out that the source file
`/pica/sw/apps/bioinfo/AMOS/3.1.0/src/amos-3.1.0/src/Converters/toAmos_new.cc`
was gathering up system includes prior to including `AS_global.h`, and it had
not set the C99-standard-specified macro to include the limit macros,
`__STDC_LIMIT_MACROS`.  So I added 

    #define __STDC_LIMIT_MACROS

to the top of `toAmos_new.cc` and that finally fixed that.  Compiling with a newer GCC (gcc/4.9.2) seemed to cause problems, but I have been through so many steps with this that I cannot recall exactly what the problem was.  The default GCC on UPPMAX (4.4.7) seems too old (a comment in CA source noted they had tested with 4.6) so I loaded `gcc/4.6` (which comes up at the end of `./configure` as gcc 4.6.4) and built with that.

    module load gcc/4.6
    ./configure --prefix=/sw/apps/bioinfo/AMOS/3.1.0/milou --with-qmake-qt4=/usr/lib64/qt4/bin/qmake --enable-minimus --enable-AMOScmp --with-CA-dir=/sw/apps/bioinfo/cabog/8.1/src/wgs-8.1/Linux-amd64
    make
    make install


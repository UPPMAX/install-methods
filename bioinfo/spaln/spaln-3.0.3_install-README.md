spaln/3.0.3
=============

<https://github.com/ogotoh/spaln>

Used under license:
GPL v2 and custom

Link to custom license:


Structure creating script (makeroom_spaln_3.0.3.sh) moved to /sw/bioinfo/spaln/makeroom_3.0.3.sh


LOG
---

    makeroom.sh "-f" "-t" "spaln" "-v" "3.0.3" "-w" "https://github.com/ogotoh/spaln" "-l" "GPL v2 and custom" -L "https://github.com/ogotoh/spaln/blob/master/COPYING" "-d" "stand-alone program that maps and aligns a set of cDNA or protein sequences onto a whole genomic sequence in a single job"
    ./makeroom_spaln_3.0.3.sh

    source /sw/bioinfo/spaln/SOURCEME_spaln_3.0.3
    cd $SRCDIR

    wget https://github.com/ogotoh/spaln/archive/refs/tags/ver.3.0.3.tar.gz
    tar xf ver.3.0.3.tar.gz
    module load gcc/12.3.0
    cd spaln-ver.3.0.3/
    cd src/
    CXX=g++ ./configure --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make

Note there will be warnings like

    fwd2s1.cc:1698:51: warning: ignoring attributes on template argument '__m256i' [-Wignored-attributes]
     1698 |             SimdAln2s1<short, 16, __m256i, __m256i>
          |                                                   ^

This is because of support for SIMD instructions has been added to spaln, and
some of it cannot be compiled into the snowy executable. These warnings will
not appear on miarka which has these instructions.  This means I need to
compile for rackham/bianca/miarka, and then snowy separately.

    make install
    mkdir -p $PREFIX/doc/man/man1
    cd ..
    cp *.1 $PREFIX/doc/man/man1
    cp doc/* $PREFIX/doc/


### snowy

Now on snowy-lr1.

    source /sw/bioinfo/spaln/SOURCEME_spaln_3.0.3
    cd $SRCDIR
    rm -f $PREFIX
    mkdir $PREFIX
    cd $SRCDIR
    rm -rf spaln-ver.3.0.3/
    tar xf ver.3.0.3.tar.gz
    module load gcc/12.3.0
    cd spaln-ver.3.0.3/
    cd src/
    CXX=g++ ./configure --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make

On snowy the warnings are

    fwd2s1.cc: In member function 'VTYPE Aln2s1::trcbkalignS_ng(const WINDOW&, bool, const RANGE*)':
    fwd2s1.cc:1700:50: warning: ignoring attributes on template argument '__m128i' [-Wignored-attributes]
     1700 |             SimdAln2s1<short, 8, __m128i, __m128i>
          |                                                  ^

Again, this is because of support for SIMD instructions has been added to
spaln, and some of it cannot be compiled into the snowy executable. These
warnings will not appear on miarka which has these instructions.  This means I
need to compile for rackham/bianca/miarka, and then snowy separately.


    make install
    mkdir -p $PREFIX/doc/man/man1
    cd ..
    cp *.1 $PREFIX/doc/man/man1
    cp doc/* $PREFIX/doc/


### miarka

Now on miarka3

    source /sw/bioinfo/spaln/SOURCEME_spaln_3.0.3
    cd $SRCDIR
    rm -f $PREFIX
    mkdir $PREFIX
    cd $SRCDIR
    rm -rf spaln-ver.3.0.3/
    tar xf ver.3.0.3.tar.gz
    module load gcc/12.3.0
    cd spaln-ver.3.0.3/
    cd src/
    CXX=g++ ./configure --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make

On miarka3 the warnings are

    fwd2h1.cc: In member function 'VTYPE Aln2h1::lspH_ng(const WINDOW&)':
    fwd2h1.cc:2228:47: warning: ignoring attributes on template argument '__m512i' [-Wignored-attributes]
     2228 |         SimdAln2h1<short, 32, __m512i, __m512i>
          |                                               ^
    fwd2h1.cc:2228:47: warning: ignoring attributes on template argument '__m512i' [-Wignored-attributes]
    fwd2h1_wip_simd.h: In instantiation of 'VTYPE SimdAln2h1<var_t, Nelem, regist_v, regist_m>::forwardH1_wip(Mfile*) [with var_t = short int; int Nelem = 32; regist_v = __vector(8) long long int; regist_m = __vector(8) long long int; VTYPE = int]':
    fwd2h1.cc:2032:43:   required from here
    fwd2h1_simd.h:218:31: error: 'class SimdAln2h1<short int, 32, __vector(8) long long int, __vector(8) long long int>' has no member named 'all_zero'
      218 | #define AllZero(a)      this->all_zero(a)
          |                         ~~~~~~^~~~~~~~
    fwd2h1_wip_simd.h:228:25: note: in expansion of macro 'AllZero'
      228 |                     if (AllZero(ph_v)) continue;
          |                         ^~~~~~~
    fwd2h1_simd.h:218:31: error: 'class SimdAln2h1<short int, 32, __vector(8) long long int, __vector(8) long long int>' has no member named 'all_zero'

So this cannot be compiled as is on miarka... interesting, do not know why. Hopefully keeping the symlink to rackham is fine.

    cd $SRCDIR
    rm -rf spaln-ver.3.0.3/
    cd $VERSIONDIR
    rm -rf miarka
    ln -sf rackham miarka

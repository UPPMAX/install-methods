kallisto
========

Quantifying abundances of transcripts from RNA-Seq data.

<http://pachterlab.github.io/kallisto/>

Install on milou.

    TOOLDIR=/sw/apps/bioinfo/kallisto
    VERSION=0.43.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER

    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    mv kallisto-${VERSION} kallisto-${VERSION}_${CLUSTER}
    cd kallisto-${VERSION}_${CLUSTER}

It requires HDF5 and ZLIB and cmake >= 2.8.12, all standard in SL 6.7.  I
couldn't get it to compile with the HDF5 module library, only the system one,
and I think there remain some inconsistencies.

    Linking CXX executable kallisto
    libkallisto_core.a(H5Writer.cpp.o): In function `int vector_to_h5<int>(std::vector<int, std::allocator<int> > const&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, bool, unsigned int)':
    H5Writer.cpp:(.text._Z12vector_to_h5IiEiRKSt6vectorIT_SaIS1_EEiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEbj[_Z12vector_to_h5IiEiRKSt6vectorIT_SaIS1_EEiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEbj]+0x35): undefined reference to `H5P_CLS_DATASET_CREATE_ID_g'
    libkallisto_core.a(H5Writer.cpp.o): In function `int vector_to_h5<double>(std::vector<double, std::allocator<double> > const&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, bool, unsigned int)':
    H5Writer.cpp:(.text._Z12vector_to_h5IdEiRKSt6vectorIT_SaIS1_EEiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEbj[_Z12vector_to_h5IdEiRKSt6vectorIT_SaIS1_EEiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEbj]+0x35): undefined reference to `H5P_CLS_DATASET_CREATE_ID_g'
    libkallisto_core.a(H5Writer.cpp.o): In function `int vector_to_h5<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, bool, unsigned int)':
    H5Writer.cpp:(.text._Z12vector_to_h5INSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEiRKSt6vectorIT_SaIS7_EEiRKS5_bj[_Z12vector_to_h5INSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEiRKSt6vectorIT_SaIS7_EEiRKS5_bj]+0x35): undefined reference to `H5P_CLS_DATASET_CREATE_ID_g'

By looking at the CMakeCache.txt file, I found that our hdf5 module wasn't
build with C++ support, so I rebuilt it with that, and Fortran/Fortran2003
support.  Still the above problem.  It seems like a header/library
incompatibility, but I can't find it.

    module load gcc/5.3.0
    module load zlib/1.2.8
    mkdir build
    cd build
    cmake -DZLIB_ROOT=$ZLIB_ROOT -DCMAKE_INSTALL_PREFIX:PATH=$CLUSTERDIR -DLINK=static ..
    make
    make install

Can't reuse the 0.42.4 mf because new modules, but start with it.

    cd $TOOLDIR/mf
    cp 0.42.4 $VERSION
    vi $VERSION

Also add $modroot/bin to PATH.

Repeat for tintin.


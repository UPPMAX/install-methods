vcflib/1.0.9
=============

<https://github.com/vcflib/vcflib>

Used under license:
MIT


Structure creating script (makeroom_vcflib_1.0.9.sh) moved to /sw/bioinfo/vcflib/makeroom_1.0.9.sh

LOG
---

We want vcflib/1.0.9 to choose to use its own contrib for tabixpp, though using an external one would be very nice.

We also have to force its RPATH to be reasonable. It unsets RPATH for some executables and leaves others incomplete.

    makeroom.sh -f -t vcflib -v 1.0.9 -w https://github.com/vcflib/vcflib -d "C++ library and cmdline tools for parsing and manipulating VCF files with python and zig bindings" -l MIT 
    ./makeroom_vcflib_1.0.9.sh 
    source /sw/bioinfo/vcflib/SOURCEME_vcflib_1.0.9
    cd $SRCDIR

    ml git/2.34.1

    git clone --recursive https://github.com/vcflib/vcflib

    cd vcflib/
    git reset --hard v1.0.9

    mkdir build
    cd build

    ml cmake/3.26.3
    ml patchelf/0.10
    ml gcc/12.3.0
    ml binutils/2.41
    ml bzip2/1.0.8
    ml libcurl/8.4.0
    ml zlib/1.2.13
    ml xz/5.4.5
    ml python/3.11.4
    ml zig/0.9.1       ## this MUST have zig/0.9.1, the latest zig/0.11.0 does not work
    ml bioinfo-tools
    ml htslib/1.17

It provides its own htslib, but we hope that it will use htslib/1.17 instead.

The RPATH that all executables should have.

    VCFLIB_RPATH="$SRCDIR/vcflib/build/contrib/WFA2-lib:$LD_RUN_PATH"

This RPATH must be converted to cmake-type by replacing ":" with ";". We must set the BUILD_RPATH in addition to the INSTALL_RPATH so that tests pass.

We might also have to set the RPATH for the python pyvcflib in $SRCDIR/vcflib/build/pyvcflib.cpython-311-x86_64-linux-gnu.so

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_RPATH="${VCFLIB_RPATH//:/;}"  -DCMAKE_INSTALL_RPATH="${VCFLIB_RPATH//:/;}" -DOPENMP=ON -DBZIP2_INCLUDE_DIR:PATH=$BZIP2_ROOT/include -DBZIP2_LIBRARY_RELEASE:FILEPATH=$BZIP2_ROOT/lib/libbz2.so -DCURL_INCLUDE_DIR:PATH=$LIBCURL_ROOT/include -DCURL_LIBRARY_RELEASE:FILEPATH=$LIBCURL_ROOT/lib/libcurl.so -DZLIB_INCLUDE_DIR:PATH=$ZLIB_ROOT/include -DZLIB_LIBRARY_RELEASE:FILEPATH=$ZLIB_ROOT/lib/libz.so -DLIBLZMA_INCLUDE_DIR:PATH=$LIBLZMA_ROOT/include -DLIBLZMA_LIBRARY_RELEASE:FILEPATH=$LIBLZMA_ROOT/lib/liblzma.so -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON_ROOT/bin/python -DPYTHON_LIBRARY:FILEPATH=$PYTHON_ROOT/lib/libpython3.so

    ctest

If any failures:

    ctest . --rerun-failed --output-on-failure

We were doing post-hoc updates to RPATH to pass the tests, but the install
would then fail because the RPATH was not what was expected for the ones we
updated. Also, several tools were also getting their RPATHs blanked out
(vcfparsealts, vcfcleancomplex, etc.)  Hence, going the cmake route above by
being explicit about both the BUILD_RPATH and INSTALL_RPATH.


But there were no failures.


Post-install checks and cleanup
-------------------------------

This built a static library, but placed it into $PREFIX/bin. Silly!  Also,
symlink `lib` to `lib64`, verify Perl and Python scripts can find their
imports, figure out what is needed to import pyvcflib, and check to see if any
libraries are not found in the executables.


    ml purge
    cd $PREFIX

    ln -s lib64 lib

    mv bin/libvcflib.a lib64/

It would be nice to have build a shared version of this library, but 1.0.1
didn't include it either.

Make sure the pyvcflib cython library has RPATH set correctly.

    ml patchelf
    cd lib64
    patchelf --print-rpath pyvcflib.cpython-311-x86_64-linux-gnu.so
    ldd pyvcflib.cpython-311-x86_64-linux-gnu.so 

Can we import the pyvcflib, and can we not import it into a python other than
python/3.11.x ?

    export PYTHONPATH=$PREFIX/lib64

    module load python/3.11.4

    python
    import pyvcflib

That should work.

    module load python/3.10.8

    python
    import pyvcflib

That should fail.

    ml purge

Are the Perl or Python scripts doing anything silly, like hard-coding a #! or using exotic modules?

    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
    grep 'use ' $(file * | grep 'Perl script' | cut -f1 -d:)

    head -n 1 $(file * | grep 'Python script' | cut -f1 -d:)
    grep 'import ' $(file * | grep 'Python script' | cut -f1 -d:)

Can the executables find all their libraries?

    ldd $(file * | grep 'ELF 64-bit' | cut -f1 -d:) | grep -i 'not found'

Make sure we're using our loaded htslib.

    ldd $(file * | grep 'ELF 64-bit' | cut -f1 -d:) | grep -i 'htslib'

In the mf file, we really need an update from 1.0.1.

    cd $TOOLDIR/mf
    vi 1.0.9

Add these, and update the help text.

    prepend-path     PATH                  $modroot/bin
    prepend-path     LIBRARY_PATH          $modroot/lib64
    prepend-path     CPATH                 $modroot/include
    prepend-path     CPLUS_INCLUDE_PATH    $modroot/include
    prepend-path     MANPATH               $modroot/man
    prepend-path     PYTHONPATH            $modroot/lib64

    setenv           VCFLIB_ROOT           $modroot

Wrap up.

    cd $TOOLDIR
    ./vcflib-1.0.9_post-install.sh


wfmash/0.12.5
========================

<https://github.com/waveygang/wfmash>

Used under license:
MIT


Structure creating script (makeroom_wfmash_0.12.5.sh) moved to /sw/bioinfo/wfmash/makeroom_0.12.5.sh

I went and installed jemalloc/5.3.0.

LOG
---

    makeroom.sh -t wfmash -v 0.12.5 -w https://github.com/waveygang/wfmash -d "wfmash is an aligner for pangenomes based on sparse homology mapping and wavefront inception. wfmash uses a variant of MashMap to find large-scale sequence homologies. It then obtains base-level alignments using WFA, via the wflign hierarchical wavefront alignment algorithm." -c bioinfo -s alignment -l MIT -k "alignment,assembly"
    ./makeroom_wfmash_0.12.5.sh 
    source /sw/bioinfo/wfmash/SOURCEME_wfmash_0.12.5 && cd $SRCDIR
    wget https://github.com/waveygang/wfmash/releases/download/v0.12.5/wfmash-v0.12.5.tar.gz
    tar xf wfmash-v0.12.5.tar.gz 
    cd wfmash-v0.12.5/

    ml cmake/3.26.3
    ml gcc/12.3.0
    ml gsl/2.7
    ml jemalloc/5.3.0
    ml zlib/1.3

    ml bioinfo-tools
    ml htslib/1.19

    mkdir build
    cd build

    This blanks out the RPATH of the executable and shared libraries, so set it explicitly while configuring.

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCMAKE_INSTALL_RPATH="$PREFIX/lib64;${LD_RUN_PATH//:/;}"
    make -j10
    make install

    Double-check that it finds libraries.

    ml purge
    cd $PREFIX/bin
    ldd wfmash 
    cd ../lib64/
    ldd libwfa2.so
    ldd libwfa2cpp.so

Load samtools/1.19 as a prerequisite, as it provides bgzip and samtools.

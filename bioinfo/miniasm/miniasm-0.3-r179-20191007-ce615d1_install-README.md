miniasm/0.3-r179-20191007-ce615d1
=================================

<https://github.com/lh3/miniasm>

Used under license: MIT



Structure creating script (makeroom_miniasm_0.3-r179-20191007-ce615d1.sh) moved to /sw/bioinfo/miniasm/makeroom_0.3-r179-20191007-ce615d1.sh

LOG
---

    makeroom.sh -f -t miniasm -v 0.3-r179-20191007-ce615d1 -l MIT -w https://github.com/lh3/miniasm -d "Ultrafast de novo assembly for long noisy reads (though having no consensus step)" -k "de-novo-assembly"
    ./makeroom_miniasm_0.3-r179-20191007-ce615d1.sh 
    source /sw/bioinfo/miniasm/SOURCEME_miniasm_0.3-r179-20191007-ce615d1
    cd $SRCDIR

    ml git/2.34.1 gcc/12.3.0 zlib/1.2.12
    git clone --recursive https://github.com/lh3/miniasm
    cd miniasm/
    git reset --hard ce615d1
    make

Test that libraries are correct:

    ml purge
    ldd miniasm minidot
    mkdir -p $PREFIX/{bin,man/man1}
    cp -av miniasm.1 $PREFIX/man/man1/
    cp -av miniasm minidot misc $PREFIX/bin/

Update mf file.

    cd $TOOLDIR/mf
    vi 0.3-r179-20191007-ce615d1 

    cd $TOOLDIR
    miniasm-0.3-r179-20191007-ce615d1_post-install.sh


Test
----

Following the script at <https://github.com/lh3/miniasm#getting-started>.

    cd $VERSIONDIR
    mkdir test
    cd test

Load this miniasm and latest minimap2.

    ml bioinfo-tools minimap2/2.26-r1175 miniasm/0.3-r179-20191007-ce615d1

Fetch data. This doesn't work:

    wget -O- http://www.cbcb.umd.edu/software/PBcR/data/selfSampleData.tar.gz | tar zxf -

but I could find it from the wayback machine:

    wget https://web.archive.org/web/20221227011940/http://www.cbcb.umd.edu/software/PBcR/data/selfSampleData.tar.gz

Unpack and stage data.

    tar xf selfSampleData.tar.gz
    ln -s selfSampleData/pacbio_filtered.fastq reads.fq
    less reads.fq

Wrong filename in minimap2 command line, so correct it and run:

    minimap2 -x ava-pb -t8 reads.fq reads.fq | gzip -1 > reads.paf.gz

Assemble with `miniasm` from the PDF and reads:

    miniasm -f reads.fq reads.paf.gz > reads.gfa

    less reads.gfa

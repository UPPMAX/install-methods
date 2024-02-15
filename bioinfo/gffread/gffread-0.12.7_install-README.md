gffread/0.12.7
==============

<https://github.com/gpertea/gffread>

Used under license:
MIT


Structure creating script (makeroom_gffread_0.12.7.sh) moved to /sw/bioinfo/gffread/makeroom_0.12.7.sh

LOG
---

Use the prebuilt binary.  Otherwise we'd have built a separate library, and this is much simpler.

    makeroom.sh -f -t gffread -v 0.12.7 -s misc -w https://github.com/gpertea/gffread -l "MIT" -d "GFF/GTF utility providing format conversions, filtering, FASTA sequence extraction and more"
    ./makeroom_gffread_0.12.7.sh 
    cd /sw/bioinfo/gffread/
    source SOURCEME_gffread_0.12.7 
    cd $SRCDIR

This bit downloads the prebuilt binary. **DO NOT USE THIS** We'll build from source instead.

    wget https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.Linux_x86_64.tar.gz

    tar xf gffread-0.12.7.Linux_x86_64.tar.gz 
    rmdir $PREFIX
    mv gffread-0.12.7.Linux_x86_64 $PREFIX
    cd $PREFIX
    ldd gffread 
    ./gffread 

Build from source.

    wget https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.tar.gz
    tar xf gffread-0.12.7.tar.gz
    cd gffread-0.12.7
    ml gcc/12.3.0
    make release
    cp -av gffread $PREFIX
    cd $PREFIX
    ml purge
    ldd gffread

Wrap up. Edit the mf from 0.12.6 and make this one a symlink to that.

    cd $TOOLDIR/mf
    vi 0.12.6
    rm -f 0.12.7
    ln -s 0.12.6 0.12.7

    cd $TOOLDIR
    ./gffread-0.12.7_post-install.sh


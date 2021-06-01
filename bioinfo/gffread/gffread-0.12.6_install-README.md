gffread/0.12.6
========================

<https://github.com/gpertea/gffread>

Used under license:
MIT


Structure creating script (makeroom_gffread_0.12.6.sh) moved to /sw/bioinfo/gffread/makeroom_0.12.6.sh

LOG
---

Use the prebuilt binary.  Otherwise we'd have built a separate library, and this is much simpler.

    cd /sw/bioinfo/
    makeroom.sh -f -t gffread -v 0.12.6 -s misc -w https://github.com/gpertea/gffread -l "MIT" -d "GFF/GTF utility providing format conversions, filtering, FASTA sequence extraction and more"
    ./makeroom_gffread_0.12.6.sh 
    cd gffread/
    source SOURCEME_gffread_0.12.6 
    cd $SRCDIR
    wget https://github.com/gpertea/gffread/releases/download/v0.12.6/gffread-0.12.6.Linux_x86_64.tar.gz
    tar xf gffread-0.12.6.Linux_x86_64.tar.gz 
    rmdir $PREFIX
    mv gffread-0.12.6.Linux_x86_64 $PREFIX
    cd $PREFIX
    ldd gffread 
    ./gffread 

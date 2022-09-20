fasta/35.1.5
========================

<https://fasta.bioch.virginia.edu/wrpearson/fasta/>

Used under license:
Apache 2.0


Structure creating script (makeroom_fasta_35.1.5.sh) moved to /sw/bioinfo/fasta/makeroom_35.1.5.sh

LOG
---

        TOOL=fasta
    VERSION=35.1.5
    
 makeroom.sh -t $TOOL -v $VERSION -w https://fasta.bioch.virginia.edu/wrpearson/fasta/ -s alignment -l "Apache 2.0" -d "The FASTA program package" -f 

   ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}


    cd $SRCDIR

    wget https://fasta.bioch.virginia.edu/wrpearson/fasta/fasta33-35/fasta-35.1.5.tar.gz --no-check-certificate
    tar xvzf fasta-${VERSION}.tar.gz
    cd fasta-${VERSION}
    mv * $PREFIX/
    cd $PREFIX

Set perms so others in sw can work on it.

    chmod -R g+w .

Following README instructions to build for linux 64-bit SSE2.

    cd src
    make -f Makefile.linux64_sse2 all

Test following:

./fasta35 -q mgstm1.aa prot_test.lseg


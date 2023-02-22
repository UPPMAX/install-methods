echtvar/0.1.7
========================

<https://github.com/brentp/echtvar>

Used under license:
MIT


Structure creating script (makeroom_echtvar_0.1.7.sh) moved to /sw/bioinfo/echtvar/makeroom_0.1.7.sh

LOG
---

    TOOL=echtvar
    VERSION=0.1.7
    makeroom.sh -t $TOOL -v $VERSION -c bioinfo -s annotation -w https://github.com/brentp/echtvar -d "efficiently encodes variant allele frequency and other information from huge pupulation datasets to enable rapid (1M variants/second) annotation of genetic variants" -l MIT 
    ./makeroom_echtvar_0.1.7.sh 
    source /sw/bioinfo/echtvar/SOURCEME_echtvar_0.1.7 && cd $SRCDIR

    wget https://github.com/brentp/echtvar/releases/download/v0.1.7/echtvar
    chmod +x echtvar 
    ./echtvar -h
    cp -av echtvar $PREFIX

Prebuilt annotation files.

    curl -L -o gnomad.v3.1.2.echtvar.v2.zip https://surfdrive.surf.nl/files/index.php/s/nJPDxM3b9C7hkM2/download
    curl -L -o gnomad.v3.1.2.echtvar.popmax.v2.zip  https://surfdrive.surf.nl/files/index.php/s/LddbAYQAYPqtYu6/download

    mv -v gnomad.v3.1.2.echtvar.* $PREFIX

Let users know about these files in the mf file.

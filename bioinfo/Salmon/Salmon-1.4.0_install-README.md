Salmon/1.4.0
============

<https://salmon.readthedocs.io/en/latest>

Used under license:
GPL v3

Structure creating script (makeroom_Salmon_1.4.0.sh) moved to /sw/bioinfo/Salmon/makeroom_1.4.0.sh

LOG
---

The binary download unpacks its own bin/ and lib/ structure and includes its
own shared libraries.  The RPATH in the salmon executable is relative.

    TOOL=Salmon
    VERSION=1.4.0
    cd /sw/bioinfo/Salmon
    makeroom.sh -f -c bioinfo -s misc -t $TOOL -v $VERSION -w https://salmon.readthedocs.io/en/latest -d "a tool for wicked-fast transcript quantification from RNA-seq data" -l "GPL v3"
    ./makeroom_Salmon_1.4.0.sh 
    source SOURCEME_Salmon_1.4.0 
    cd $SRCDIR
    wget https://github.com/COMBINE-lab/salmon/releases/download/v1.4.0/salmon-1.4.0_linux_x86_64.tar.gz
    tar xf salmon-1.4.0_linux_x86_64.tar.gz 
    rmdir $PREFIX
    mv salmon-latest_linux_x86_64 $PREFIX


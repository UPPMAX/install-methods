OrthoFinder/2.5.2
=================

<https://davidemms.github.io>

Used under license:
GPL v3

Structure creating script (makeroom_OrthoFinder_2.5.2.sh) moved to /sw/bioinfo/OrthoFinder/makeroom_2.5.2.sh

LOG
---

    TOOL=OrthoFinder
    VERSION=2.5.2
    cd /sw/bioinfo
    makeroom.sh -f -t "${TOOL}" -v "${VERSION}" -l "GPL v3" -w "https://davidemms.github.io" -d "phylogenetic orthology inference for comparative genomics"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd $TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    wget https://github.com/davidemms/OrthoFinder/releases/download/${VERSION}/${TOOL}_source.tar.gz
    tar xvf ${TOOL}_source.tar.gz 

Check libraries of included binaries.

    ldd scripts_of/bin/*
    rmdir $PREFIX
    mv ${TOOL}_source $PREFIX

Load python/3.8.7 in the module file.

Check installed module.

    module load bioinfo-tools
    module load OrthoFinder/2.5.2

    cd $HOME/uppmax
    cp -av $ORTHOFINDER_ROOT/ExampleData .
    orthofinder.py -f ExampleData


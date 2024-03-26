ProtHint/2.6.0-20231027-103304c
===============================

<https://github.com/gatech-genemark/ProtHint>

Used under license:
GeneMark license
https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE


Structure creating script (makeroom_ProtHint_2.6.0.sh) moved to /sw/bioinfo/ProtHint/makeroom_2.6.0.sh

LOG
---

    TOOL=ProtHint
    TOOLVERSION=2.6.0
    COMMIT=103304c
    COMMITDATE=20231027
    VERSION=$TOOLVERSION-$COMMITDATE-$COMMIT
    makeroom.sh -f -s "annotation" -t "ProtHint" -v "$VERSION" -w 'https://github.com/gatech-genemark/ProtHint' -l 'GeneMark license' -L 'https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE' -d 'pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences'
    ./makeroom_ProtHint_${VERSION}.sh
    source /sw/bioinfo/ProtHint/SOURCEME_ProtHint_${VERSION}
    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/gatech-genemark/ProtHint
    cd ProtHint
    git reset --hard $COMMIT
    ml -git
    cd ..
    rmdir $PREFIX
    mv ProtHint $PREFIX
    cd $PREFIX

    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    ml -python

    ml perl/5.32.1
    ml perl_modules/5.32.1
    ml bioinfo-tools
    ml GeneMark/4.72-es
    ml diamond/2.1.9
    ml spaln/3.0.3

Disable things we have provided in other modules.

    cd $PREFIX/dependencies
    for F in diamond spaln probuild; do
        mv $F _$F
    done

Make sure the python scripts use the python in this module.

    cd $PREFIX/bin
    sed -i -e '1i#!'"$(which python3)" *.py

The mf file must load perl, perl_modules, GeneMark, diamond, spaln.


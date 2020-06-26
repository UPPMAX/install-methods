ProtHint/2.4.0
==============

<https://github.com/gatech-genemark/ProtHint>

Used under license:
GeneMark license https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE

Structure creating script (makeroom_ProtHint_2.4.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/ProtHint/makeroom_2.4.0.sh

LOG
---

    TOOL=ProtHint
    VERSION=2.4.0
    makeroom.sh -f" -s "annotation" -t "$TOOL" -v "$VERSION" -w "https://github.com/gatech-genemark/ProtHint" -l "GeneMark license https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE" -d "pipeline for predicting and scoring hints \(in the form of introns\, start and stop codons\) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences"
    ./makeroom_ProtHint_2.4.0.sh
    cd /sw/bioinfo/$TOOL/
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION/src

    module load perl_modules/5.26.2
    module load  python/3.7.2

    wget https://github.com/gatech-genemark/$TOOL/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${TOOL}-${VERSION} $PREFIX

This replaces `$PREFIX` with the unpacked tarball (not the github-generated one).

The mf file should load `perl/5.26.2`, `perl_modules/5.26.2`, `python/3.7.2`, and `GeneMark/4.57-es`.

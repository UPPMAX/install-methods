LDpred/1.0.10
========================

<https://github.com/bvilhjal/ldpred>

Used under license:
MIT

Structure creating script (makeroom_LDpred_1.0.10.sh) moved to /sw/bioinfo/LDpred/makeroom_1.0.10.sh

LOG
---

    TOOL=LDpred
    VERSION=1.0.10
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f" -t "${TOOL}" -v "${VERSION}" -s "misc" -w "https://github.com/bvilhjal/ldpred" -d "Python based software package that adjusts GWAS summary statistics for the effects of linkage disequilibrium" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install ldpred==$VERSION --user
    ./${TOOL}-${VERSION}_post-install.sh

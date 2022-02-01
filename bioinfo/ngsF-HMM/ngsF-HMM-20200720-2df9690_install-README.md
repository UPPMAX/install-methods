ngsF-HMM/20200720-2df9690
=========================

<https://github.com/fgvieira/ngsF-HMM>

Used under license:
GPL-3.0


Structure creating script (makeroom_ngsF-HMM_20200720-2df9690.sh) moved to /sw/bioinfo/ngsF-HMM/makeroom_20200720-2df9690.sh

LOG
---


For the mf, add `$modroot` and `$modroot/scripts` to `PATH`.  The auxiliary
scripts need perl modules, so issue a message to the user to load
`perl_modules/5.26.2` and `R_packages/4.1.1` to use them.

This is similar to what is required for ngsLD/1.1.1 by the same developer.


    makeroom.sh -f -c bioinfo -s misc -t ngsF-HMM -v 20200720-2df9690 -w https://github.com/fgvieira/ngsF-HMM -d "Estimation of per-individual inbreeding tracts under a probabilistic framework" -l "GPL-3.0"
    ./makeroom_ngsF-HMM_20200720-2df9690.sh 
    source /sw/bioinfo/ngsF-HMM/SOURCEME_ngsF-HMM_20200720-2df9690 && cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/fgvieira/ngsF-HMM
    ml zlib/1.2.11 gsl/2.6 gcc/9.3.0
    cd ngsF-HMM/
    make

Edit/add first lines for auxiliary scripts.  For the R scripts, add `#!/usr/bin/env Rscript`.

    cd scripts/
    vi *
    cd ..
    cp -av ngsF-HMM ngsF-HMM.sh scripts $PREFIX


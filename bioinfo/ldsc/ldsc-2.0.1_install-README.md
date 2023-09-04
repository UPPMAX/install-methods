ldsc/2.0.1
==========

<https://pypi.org/project/ldsc/>

<https://github.com/bulik/ldsc>

Used under license:
GPL v3


Structure creating script (makeroom_ldsc_2.0.1.sh) moved to /sw/bioinfo/ldsc/makeroom_2.0.1.sh

Odd. The github repository contains no info about a version 2.0.1 (I didn't search exhaustively) but pypi definitely contains both a 2.0.0 and 2.0.1.

So, installing from pypi into a venv and placing links into it within $PREFIX/bin.

LOG
---

    makeroom.sh -f -t "ldsc" -v "2.0.1" -s "misc" -w "https://pypi.org/project/ldsc/" -d "command line tool for estimating heritability and genetic correlation from GWAS summary statistics" -l "GPL v3"
    ./makeroom_ldsc_2.0.1.sh 
    source /sw/bioinfo/ldsc/SOURCEME_ldsc_2.0.1 && cd $PREFIX
    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate

What versions are available? I expect to see at least 2.0.0 and 2.0.1 based on the pypi page.

    pip install ldsc==

2.0.1 is an available version, so install it.

    pip install ldsc==2.0.1

Link executables from the venv to $PREFIX/bin using full paths.

    ll venv/bin/
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/{ldsc.py,make_annot.py,munge_sumstats.py} .

Do the final wrapup. Edit the mf file to add $modroot/bin to PATH. No need to modify PYTHONPATH or load a python module.

    cd $TOOLDIR
    vi mf/2.0.1

Do final permissions fix and installation of mf file and links.

    ./ldsc-2.0.1_post-install.sh


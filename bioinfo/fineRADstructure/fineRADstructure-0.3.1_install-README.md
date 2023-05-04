fineRADstructure/0.3.1
========================

<https://www.milan-malinsky.org/fineradstructure>

Used under license:
Creative Commons 3.0
<https://raw.githubusercontent.com/millanek/fineRADstructure/master/COPYING>

Structure creating script (makeroom_fineRADstructure_0.3.1.sh) moved to /sw/bioinfo/fineRADstructure/makeroom_0.3.1.sh

LOG
---

This is an old repository, with dependencies on old versions of many tools. Build with system tools -- no module loads -- and revisit this choice if the tool is ever updated.

    makeroom.sh -t fineRADstructure -v 0.3.1 -w https://www.milan-malinsky.org/fineradstructure -d "A package for population structure inference from RAD-seq data" -l "Creative Commons 3.0" -L https://raw.githubusercontent.com/millanek/fineRADstructure/master/COPYING -c bioinfo -s misc
    ./makeroom_fineRADstructure_0.3.1.sh
    source /sw/bioinfo/fineRADstructure/SOURCEME_fineRADstructure_0.3.1
    cd $SRCDIR
    git clone https://github.com/millanek/fineRADstructure
    cd fineRADstructure/
    aclocal
    autoconf

The README is missing, causing an error from automake, so symlink README.md to it.

    ln -s README.md README
    automake -a
    ./configure --prefix=$PREFIX
    make
    make install

Keep only $modroot/bin in PATH, and of course the setting of FINERADSTRUCTURE_ROOT.

    cd $TOOLDIR/mf
    vi 0.3.1

Final steps.

    cd $TOOLDIR
    ./fineRADstructure-0.3.1_post-install.sh

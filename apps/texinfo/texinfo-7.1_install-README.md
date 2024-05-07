texinfo/7.1
========================

<https://www.gnu.org/software/texinfo/>

Used under license:
GPL v3+


Structure creating script (makeroom_texinfo_7.1.sh) moved to /sw/apps/texinfo/makeroom_7.1.sh

The HTML and info versions of R package documentation cannot be built without texinfo.  Build this with texlive/2021.


LOG
---

    VERSION=7.1

    TEXLIVE_VERSION=2024-04-24

    makeroom.sh -f -c "apps" -t "texinfo" -v "${VERSION}" -d "the official documentation format of the GNU project. It uses a single source file to produce output in a number of formats\, both online and printed \(DVI\, HTML\, Info\, PDF\, XML\, etc.\)." -w "https://www.gnu.org/software/texinfo/" -l "GPL v3+"
    ./makeroom_texinfo_${VERSION}.sh


    source /sw/apps/texinfo/SOURCEME_texinfo_${VERSION}
    cd $SRCDIR


    wget http://ftp.gnu.org/gnu/texinfo/texinfo-${VERSION}.tar.gz
    tar xzf texinfo-${VERSION}.tar.gz 
    cd texinfo-${VERSION}/
    module load gcc/12.3.0
    module load texlive/$TEXLIVE_VERSION
    ./configure --prefix=$PREFIX
    make
    make install
    cd $SRCDIR
    rm -rf texinfo-${VERSION}

Wrap up.

    cd $TOOLDIR/mf
    rm -f 7.1
    cp 6.0 7.1
    vi 7.1

Include in help that we loaded texinfo/2024-04-24

    cd $TOOLDIR
    ./texinfo-7.1_post-install.sh


texinfo/6.8
========================

<https://www.gnu.org/software/texinfo/>

Used under license:
GPL v3+


Structure creating script (makeroom_texinfo_6.8.sh) moved to /sw/apps/texinfo/makeroom_6.8.sh

The HTML and info versions of R package documentation cannot be built without texinfo.  Build this with texlive/2021.


LOG
---

    makeroom.sh -f" -c "apps" -t "texinfo" -v "6.8" -d "the official documentation format of the GNU project. It uses a single source file to produce output in a number of formats\, both online and printed \(DVI\, HTML\, Info\, PDF\, XML\, etc.\)." -w "https://www.gnu.org/software/texinfo/" -l "GPL v3+"
    ./makeroom_texinfo_6.8.sh


    source /sw/apps/texinfo/SOURCEME_texinfo_6.8
    cd $SRCDIR


    wget http://ftp.gnu.org/gnu/texinfo/texinfo-${VERSION}.tar.gz
    tar xzf texinfo-${VERSION}.tar.gz 
    cd texinfo-${VERSION}/
    module load texlive/2021
    ./configure --prefix=$PREFIX
    make
    make install
    cd ..
    rm -rf texinfo-${VERSION}

Use mf file from 6.6.


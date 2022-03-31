texlive/2021
============

<https://www.tug.org/texlive/>



LOG
---

    makeroom.sh -f -t "texlive" -v "2021" -c "apps" -w "https://www.tug.org/texlive/" -d "a straightforward way to get up and running with the TeX document production system"
    ./makeroom_texlive_2021.sh
    source /sw/apps/texlive/SOURCEME_texlive_2021 && cd $SRCDIR

    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xf install-tl-unx.tar.gz 
    cd install-tl-20210830
    ./install-tl

Choose 'D' then '1' and use $PREFIX for the main directory
Choose 'R' to return to the main menu
Ensure that the installation scheme is 'full'
Choose 'I' to install.


After installation, change the buf_size preset to be larger so some tools can use it.

    vi ./texmf-dist/web2c/texmf.cnf

Search for `buf_size` and replace `200000` with `1000000`.

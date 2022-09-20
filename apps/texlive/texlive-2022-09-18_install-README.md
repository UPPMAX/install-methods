texlive/2022-09-18
========================

<https://www.tug.org/texlive/>

Changing name to reflect date of texlive download.

Used under license:



Structure creating script (makeroom_texlive_2022-09-18.sh) moved to /sw/apps/texlive/makeroom_2022-09-18.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "texlive" "-v" "2022-09-18" "-c" "apps" "-w" "https://www.tug.org/texlive/" "-d" "a straightforward way to get up and running with the TeX document production system"
    ./makeroom_texlive_2022-09-18.sh

    source /sw/apps/texlive/SOURCEME_texlive_2021 && cd $SRCDIR

    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xf install-tl-unx.tar.gz 
    cd install-tl-20220918
    ./install-tl

Choose 'D' then '1' and use $PREFIX for the main directory
Choose 'R' to return to the main menu
Ensure that the installation scheme is 'scheme-full'
Choose 'I' to install.

'scheme-full' selects 40 of 41 packages, the one left out is Windows-only support programs, not needed.


After installation, change the buf_size preset to be larger so some tools can use it.

    cd $PREFIX

    vi ./texmf-dist/web2c/texmf.cnf

Search for `buf_size` and replace `200000` with `1000000`.


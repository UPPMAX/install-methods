emacs/27.2
========================

<https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html>

Used under license:
GNU


Structure creating script (makeroom_emacs_27.2.sh) moved to /sw/apps/emacs/makeroom_27.2.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh -t "emacs" -v "27.2" -w "https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html" -l "GNU" -c "apps" -f
    ./makeroom_emacs_27.2.sh
    source /sw/apps/emacs/SOURCEME_emacs_27.2 && cd $TOOLDIR
    cd $VERSION/$CLUSTER
    wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/emacs/emacs-27.2.tar.gz
    tar xvf emacs-27.2.tar.gz
    cd emacs-27.2

    module load gcc/9.3.0
    module load giflib/5.1.4

    ./configure --prefix=$PREFIX --with-x --with-x-toolkit=yes  --with-modules  --with-gnutls=ifavailable
    make -j 8
    make install

   cp /sw/apps/emacs/mf/27.2 /sw/mf/common/applications/emacs/
   cd /sw/apps/emacs
   ./emacs-27.2_post-install.sh
   
    



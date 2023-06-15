emacs/28.2
========================

<https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html>

Used under license:
GNU


Structure creating script (makeroom_emacs_28.2.sh) moved to /sw/apps/emacs/makeroom_28.2.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "emacs" "-v" "28.2" "-w" "https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html" "-l" "GNU" "-c" "apps" "-f"
    ./makeroom_emacs_28.2.sh
    source /sw/apps/emacs/SOURCEME_emacs_28.2 && cd $TOOLDIR
    cd $VERSION/src
    wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/emacs/emacs-28.2.tar.gz
    tar xvf emacs-28.2.tar.gz
    cd emacs-28.2

    module load gcc/13.1.0
    module load giflib/5.1.4

    ./configure --prefix=$PREFIX --with-x --with-x-toolkit=yes  --with-modules  --with-gnutls=ifavailable --with-mailutils
    make -j 8
    make install


   # ripgrep https://support.naiss.se/Ticket/Display.html?id=275319
   cd $VERSION/src
   wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz


   cp /sw/apps/emacs/mf/28.2 /sw/mf/common/applications/emacs/
   cd /sw/apps/emacs
   ./emacs-28.2_post-install.sh
   
    



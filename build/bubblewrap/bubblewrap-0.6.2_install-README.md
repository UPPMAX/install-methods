bubblewrap/0.6.2
================

<https://github.com/containers/bubblewrap>

Used under license:
LGPL v2+


Structure creating script (makeroom_bubblewrap_0.6.2.sh) moved to /sw/build/bubblewrap/makeroom_0.6.2.sh

LOG
---

    cd /sw/build
    makeroom.sh -t bubblewrap -v 0.6.2 -c build -w https://github.com/containers/bubblewrap -d "Unprivileged sandboxing" -l "LGPL v2+" 
    ./makeroom_bubblewrap_0.6.2.sh 
    source /sw/build/bubblewrap/SOURCEME_bubblewrap_0.6.2 && cd $SRCDIR
    wget https://github.com/containers/bubblewrap/releases/download/v0.6.2/bubblewrap-0.6.2.tar.xz
    tar xf bubblewrap-0.6.2.tar.xz 
    cd bubblewrap-0.6.2/
    ./configure --prefix=$PREFIX --with-bash-completion-dir=no --with-zsh-completion-dir=no
    make
    make check
    make install


In mf, set `PATH` and `MANPATH`.


emacs/25.2
==========

<https://www.gnu.org/software/emacs/>

LOG
---

    VERSION=25.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/emacs
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f emacs-${VERSION}.tar.xz ]] || wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/emacs/emacs-${VERSION}.tar.xz
    tar xJf emacs-${VERSION}.tar.xz 
    mv emacs-${VERSION} emacs-${VERSION}_${CLUSTER}
    cd emacs-${VERSION}_${CLUSTER}
    module load gcc/5.4.0
    module load giflib/5.1.4
    ./configure --prefix=$PFX --with-x --with-x-toolkit=yes  --with-modules 
    make -j8
    make install

The `make install` takes quite a while.

From what I can tell, only the `bin/` directory needs to be set.  That's a
guess for now.  There are some additional executables under the `libexec/`
directory.  Is this encoded within the emacs executable?

    milou-b: /sw/apps/emacs/mf $ strings ../25.2/milou/bin/emacs-25.2 | grep libexec
    /sw/apps/emacs/25.2/milou/libexec/emacs/25.2/x86_64-unknown-linux-gnu

Yes it's there, so that might bode well for the rest of the directories being
there.  The `var/` directory holds some high-score files for games, which won't
be writable.  I think maybe I should remove write permission from this emacs
directory tree like we do for python and perl.

    chmod -R -w $PFX


# vim-7.4-1941-install-README.md

vim/7.4-1941
============

<http://www.vim.org/download.php#unix>

LOG
---

Unless you know the version (includes patch level), then build, find out, and rebuild.

    VERSION=V
    CLUSTER=${CLUSTER?:CLUSTER must be nonempty}
    cd /sw/apps
    mkdir vim
    cd vim
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    module load git/2.5.0
    git clone https://github.com/vim/vim.git
    cd vim
    module load gcc/5.3.0
    cd src
    make -j 8
    ./vim --version

Observe output, determine version and patch level.

    VERSION_TMP=$VERSION
    VERSION=7.4-1941

Remove temp version directory.

    cd ../../../../
    mv $VERSION_TMP $VERSION
    unset VERSION_TMP
    cd $VERSION
    cd $CLUSTER
    PREFIX=$PWD
    cd ..
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    rm -rf vim
    git clone https://github.com/vim/vim.git
    cd vim

Include multibyte support.

    ./configure --with-features=big --prefix=$PREFIX
    make -j 8
    make -j 8 install

Repeat on tintin, but don't use `-j 8`.


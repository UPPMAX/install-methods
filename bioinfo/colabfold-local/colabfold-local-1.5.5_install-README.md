colabfold-local/1.5.5
========================

<https://github.com/YoshitakaMo/localcolabfold>

Used under license:
MIT


Structure creating script (makeroom_colabfold-local_1.5.5.sh) moved to /sw/bioinfo/colabfold-local/makeroom_1.5.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "colabfold-local" "-v" "1.5.5" "-l" "MIT" "-d" "ColabFold on your local PC" "-w" "https://github.com/YoshitakaMo/localcolabfold" "-s" "annotation"
    ./makeroom_colabfold-local_1.5.5.sh

    cd $SRCDIR
    # git clone
    git clone https://github.com/YoshitakaMo/localcolabfold.git .
    git checkout tags/v${VERSION}
    git reset --hard  

    # Install
    ./install_colabbatch_linux.sh

    # Liftout to $PREFIX/bin
    mkdir $PREFIX/bin
    cp $SRCDIR/localcolabfold/colabfold-conda/bin/colabfold_* $PREFIX/bin




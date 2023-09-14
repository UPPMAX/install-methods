SMC++/1.15.5.dev12+g8bdecdf
===========================

<https://github.com/popgenmethods/smcpp>

Used under license:
GPL v3


Structure creating script (makeroom_SMC++_1.15.5.dev12+g8bdecdf.sh) moved to /sw/bioinfo/SMC++/makeroom_1.15.5.dev12+g8bdecdf.sh

LOG
---

    makeroom.sh "-f" "-s" "misc" "-t" "SMC++" "-v" "1.15.5.dev12+g8bdecdf" "-w" "https://github.com/popgenmethods/smcpp" "-d" "infers population history from whole-genome sequence data" "-l" "GPL v3"
    ./makeroom_SMC++_1.15.5.dev12+g8bdecdf.sh

    source /sw/bioinfo/SMC++/SOURCEME_SMC++_1.15.5.dev12+g8bdecdf && cd $SRCDIR

    ml python/3.8.7

First create a virtual env where smcpp is installed and activate it.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate

Install from the github repository. Reset to the slug above, but remove the first character of the commit hash.

    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/popgenmethods/smcpp
    cd smcpp
    git reset --hard 8bdecdf

The remainder is much simpler than the 1.15.4 installation.

Ensure that the pip is the one from the venv:

    which pip

Then, install using this pip.

    pip install .

Create symlink into venv.

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/smc++ .
 

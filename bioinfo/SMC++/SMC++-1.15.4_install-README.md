SMC++/1.15.4
============

<https://github.com/popgenmethods/smcpp>

Used under license:
GPL v3


Structure creating script (makeroom_SMC++_1.15.4.sh) moved to /sw/bioinfo/SMC++/makeroom_1.15.4.sh


LOG
---

Build with system gcc, mpfr, gsl, gmp, and python/3.8.7.


    TOOL=SMC++
    VERSION=1.15.4
    cd /sw/bioinfo
    makeroom.sh -f -s misc -t $TOOL -v $VERSION -w https://github.com/popgenmethods/smcpp -d "infers population history from whole-genome sequence data" -l "GPL v3"
    ./makeroom_SMC++_1.15.4.sh 
    cd SMC++/
    source SOURCEME_SMC++_1.15.4 

    ml python/3.8.7

First create a virtual env where smcpp is installed and activate it.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate

Install from the github repository.

    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/popgenmethods/smcpp
    cd smcpp
    git reset --hard v1.15.4

From Matias' earlier build:

The `SMC++` cannot be installed directly from the clone since versioning is
inferred from the `.git` directory by `setuptools_scm`. Moreover, Numpy is
missing from build dependencies. To fix change the `pyproject.toml` to look like

    # pyproject.toml
    [build-system]
    requires = ["setuptools>=45", "wheel", "oldest-supported-numpy"]

Only these lines: so you are also removing lines that involve setuptools_scm.
We set the version in `setup.py` below.

In `setup.py`, in the `setup` function, add the line

    version="1.15.4",

after the line

    name="smcpp",

Ensure that the pip is the one from the venv:

    which pip

Then, install using this pip.

    pip install .

Create symlink into venv.

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/smc++ .
 

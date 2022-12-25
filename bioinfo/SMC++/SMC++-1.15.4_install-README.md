SMC++/1.15.4
========================

<https://github.com/popgenmethods/smcpp>

Used under license:
GPL v3


Structure creating script (makeroom_SMC++_1.15.4.sh) moved to /sw/bioinfo/SMC++/makeroom_1.15.4.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-s" "misc" "-t" "SMC++" "-v" "1.15.4" "-w" "https://github.com/popgenmethods/smcpp" "-d" "infers population history from whole-genome sequence data" "-l" "GPL v3"
    ./makeroom_SMC++_1.15.4.sh
SMC++/1.15.2
============

<https://github.com/popgenmethods/smcpp>

Used under license:
GPL v3

Structure creating script (makeroom_SMC++_1.15.2.sh) moved to /sw/bioinfo/SMC++/makeroom_1.15.2.sh


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
    

First create a virtual env where smcpp is installed

    cd $PREFIX
    ml python/3.10.8
    python -m virtualenv --sytem-site-packages venv
    source venv/bin/activate

Get source tarball

    wget https://github.com/popgenmethods/smcpp/archive/refs/tags/v1.15.4.tar.gz
    tar xvfz v1.15.4.tar.gz

    cd smcpp-1.15.4

The `SMC++` cannot be installed directly from the tarball since versioning is
inferred from the `.git` directory by `setuptools_scm`. Moreover, Numpy is
missing from build dependencies. To fix change the `pyproject.toml` to look like

   # pyproject.toml
   [build-system]
   requires = ["setuptools>=45", "wheel", "oldest-supported-numpy"]

Also set the version in `setup.py` in the `setup` function
(`version="1.15.4"`). Then install into the environment using pip

   pip install .

Finally symlink the exectuable to bin

   mkdir $PREFIX/bin && cd $PREFIX/bin
   ln -s $PREFIX/venv/bin/smc++ .

and fixup rpath of exectuables by linking to gcc and gsl:

   cd /sw/bioinfo/SMC++/1.15.4/rackham/venv/lib/python3.10/site-packages/smcpp

   patchelf --set-rpath \
   '/sw/comp/gcc/12.2.0_rackham/lib64:/sw/comp/gcc/12.2.0_rackham/lib:/sw/libs/gsl/2.7/rackham/lib' \
   _estimation_tools.cpython-310-x86_64-linux-gnu.so

   patchelf --set-rpath \
   '/sw/comp/gcc/12.2.0_rackham/lib64:/sw/comp/gcc/12.2.0_rackham/lib:/sw/libs/gsl/2.7/rackham/lib' \
   _smcpp.cpython-310-x86_64-linux-gnu.so

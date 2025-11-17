wgbs_tools/0.2.2-20250518-1b067ae
========================

<https://github.com/nloyfer/wgbs_tools>

Used under license:
Custom 'AS IS'
<https://raw.githubusercontent.com/nloyfer/wgbs_tools/refs/heads/master/LICENSE.md>

Structure creating script (makeroom_wgbs_tools_0.2.2-20250518-1b067ae.sh) moved to /sw/bioinfo/wgbs_tools/makeroom_0.2.2-20250518-1b067ae.sh

LOG
---

    makeroom.sh -f -t wgbs_tools -v 0.2.2-20250518-1b067ae -c bioinfo -s alignment -w https://github.com/nloyfer/wgbs_tools -l "Custom 'AS IS'" -L 'https://raw.githubusercontent.com/nloyfer/wgbs_tools/refs/heads/master/LICENSE.md' -d "tools for working with Bisulfite Sequencing data while preserving reads intrinsic dependencies" 
    ./makeroom_wgbs_tools_0.2.2-20250518-1b067ae.sh 
    source /sw/bioinfo/wgbs_tools/SOURCEME_wgbs_tools_0.2.2-20250518-1b067ae && cd $SRCDIR

    ml git/2.44.0
    ml python/3.11.8
    ml gcc/12.3.0

    git clone --recursive https://github.com/nloyfer/wgbs_tools
    cd wgbs_tools/
    git reset --hard 1b067ae

Change version in pyproject.toml and main script.

    vi pyproject.toml wgbstools

Create virtualenv to install dependencies

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate

Install dependencies and build.

    cd $SRCDIR
    cd wgbs_tools/
    pip install numpy==1.24.2 pandas==2.0.0 scipy==1.10.1
    python setup.py 

Change #! line of main script to be the python from the virtualenv.

    sed -i --follow-symlinks '1i#!'"$(which python3)" wgbstools

Install this directory as `$PREFIX/bin/`.

    cd ..
    mv wgbs_tools $PREFIX/bin
    deactivate
    cd $PREFIX/bin
    chmod -x setup.py       # don't inadvertently pollute the path
    ./wgbstools homog -h

Now install UXM_tools.

    source $PREFIX/venv/bin/activate
    which python3
    cd $SRCDIR
    git clone --recursive https://github.com/nloyfer/UXM_deconv
    cd UXM_deconv/
    sed -i --follow-symlinks '1i#!'"$(which python3)" uxm 
    mv UXM_deconv $PREFIX
    cd $PREFIX/bin
    ln -s ../UXM_deconv/uxm .
    ./uxm
    ./uxm deconv -h

OrthoFinder/2.5.5
========================

<https://davidemms.github.io/>

Used under license:
GPL v3


Structure creating script (makeroom_OrthoFinder_2.5.5.sh) moved to /sw/bioinfo/OrthoFinder/makeroom_2.5.5.sh

LOG
---

Create venv containing python/3.10.8 versions of numpy and scipy.  We use the `_source` tarball, not the one with python bundled in a sketchy way.

    makeroom.sh -f -t OrthoFinder -v 2.5.5 -w https://davidemms.github.io/ -l "GPL v3" -d "Phylogenetic orthology inference for comparative genomics"
    ./makeroom_OrthoFinder_2.5.5.sh 
    source /sw/bioinfo/OrthoFinder/SOURCEME_OrthoFinder_2.5.5
    cd $SRCDIR
    wget https://github.com/davidemms/OrthoFinder/releases/download/2.5.5/OrthoFinder_source.tar.gz
    tar xf OrthoFinder_source.tar.gz

    cd $PREFIX
    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate
    ml -python
    which python3
    which pip3
    module help python/3.10.8 2>&1 | grep -P '(numpy|scipy)'
    pip3 install numpy==1.23.4 scipy==1.9.3
    ./orthofinder.py 

It comes bundled with it sown `diamond` `fastme` and `mcl` executables.  I am not happy about that.

Redo the `#!` lines of its python scripts that expect to find a python.

cd $SRCDIR
cd OrthoFinder_source/

Scripts are found in `orthofinder.py` `tools/*.py` and `scripts_of/*.py`.

    head -n 1 scripts_of/*.py tools/*.py orthofinder.py 

Make sure to only change `#!` when that line actually exists.

    sed -i 's,^#!/usr/bin/env python.*$,#!'"$(which python3)"',' scripts_of/*.py tools/*.py orthofinder.py 
    head -n 1 scripts_of/*.py tools/*.py orthofinder.py 

Symlink `orthofinder` to `orthofinder.py`, move the contents over to `$PREFIX`, and post-install.  Test with `ExampleData/` once installed.

    ln -s orthofinder.py orthofinder
    mv * $PREFIX/
    cd ..
    rmdir OrthoFinder_source/
    cd $PREFIX
    deactivate
    cd $TOOLDIR
    vi mf/2.5.5
    ./OrthoFinder-2.5.5_post-install.sh 

Now test.

    ml purge
    ml bioinfo-tools OrthoFinder/2.5.5
    cd /sw/bioinfo/OrthoFinder/2.5.5/src/
    tar xf OrthoFinder_source.tar.gz 
    cd OrthoFinder_source/
    orthofinder -f ExampleData/

Looks good!

    cd ..
    rm -rf OrthoFinder_source

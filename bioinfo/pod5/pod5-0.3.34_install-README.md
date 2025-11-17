pod5/0.3.34
==========

<https://github.com/nanoporetech/pod5-file-format>

Used under license:
Mozilla Public License v 2.0
<https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md>

Structure creating script (makeroom_pod5_0.3.34.sh) moved to /sw/bioinfo/pod5/makeroom_0.3.34.sh

LOG
---

    makeroom.sh -f -c bioinfo -s misc -t pod5 -v 0.3.34 -w https://github.com/nanoporetech/pod5-file-format -d "Pod5: a high performance file format for nanopore reads" -l "Mozilla Public License v 2.0"  -L https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md -k "conversion"
    ./makeroom_pod5_0.3.34.sh 
    source /sw/bioinfo/pod5/SOURCEME_pod5_0.3.34 && cd $PREFIX
    ml python/3.12.7
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    echo $VERSION

We need newer gcc and newer hdf5.

    ml gcc/13.3.0
    ml hdf5/1.14.0
    pip install pod5==$VERSION

Now lift out executable(s) from the venv. Turns out, the only specific executable is `pod5`.

    ll venv/bin
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/pod5 .

Wrap up.

    cd $TOOLDIR
    ./pod5-0.3.34_post-install.sh 

The mf for 0.3.34 is the same as for 0.3.10.

    cd $TOOLDIR/mf
    rm -f 0.3.34
    ln -s 0.3.10 0.3.34
    rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/pod5/
    mfshow pod5

Test.

    deactivate
    ml purge
    ml bioinfo-tools pod5/0.3.34
    pod5 convert

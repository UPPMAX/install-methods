pod5/0.3.10
==========

<https://github.com/nanoporetech/pod5-file-format>

Used under license:
Mozilla Public License v 2.0
<https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md>

Structure creating script (makeroom_pod5_0.3.10.sh) moved to /sw/bioinfo/pod5/makeroom_0.3.10.sh

LOG
---

    makeroom.sh -f -c bioinfo -s misc -t pod5 -v 0.3.10 -w https://github.com/nanoporetech/pod5-file-format -d "Pod5: a high performance file format for nanopore reads" -l "Mozilla Public License v 2.0"  -L https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md -k "conversion"
    ./makeroom_pod5_0.3.10.sh 
    source /sw/bioinfo/pod5/SOURCEME_pod5_0.3.10 && cd $PREFIX
    ml python/3.11.4
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    echo $VERSION
    pip install pod5==$VERSION

Now lift out executable(s) from the venv. Turns out, the only specific executable is `pod5`.

    ll venv/bin
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/pod5 .

Wrap up.

    cd $TOOLDIR
    vi mf/0.3.10
    ./pod5-0.3.10_post-install.sh
pod5/0.3.10
========================

<https://github.com/nanoporetech/pod5-file-format>

Used under license:
Mozilla Public License v 2.0
<https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md>

Structure creating script (makeroom_pod5_0.3.10.sh) moved to /sw/bioinfo/pod5/makeroom_0.3.10.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-c" "bioinfo" "-s" "misc" "-t" "pod5" "-v" "0.3.10" "-w" "https://github.com/nanoporetech/pod5-file-format" "-d" "Pod5: a high performance file format for nanopore reads" "-l" "Mozilla Public License v 2.0" "-L" "https://raw.githubusercontent.com/nanoporetech/pod5-file-format/master/LICENSE.md" "-k" "conversion"
    ./makeroom_pod5_0.3.10.sh

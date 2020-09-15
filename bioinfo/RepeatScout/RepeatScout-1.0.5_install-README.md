RepeatScout/1.0.5
========================

<https://github.com/mmcco/RepeatScout>

Used under license:
open source

Structure creating script (makeroom_RepeatScout_1.0.5.sh) moved to /sw/bioinfo/RepeatScout/makeroom_1.0.5.sh

Source in repository is not versioned, so reset to commit 172e1cc which is said to be the 1.0.5 version.

LOG
---

    TOOL=RepeatScout
    VERSION=1.0.5
    cd /sw/bioinfo

    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/mmcco/RepeatScout -l "open source" -d "tool to discover repetitive substrings in DNA" 
    ./makeroom_RepeatScout_1.0.5.sh 
    cd RepeatScout
    source SOURCEME_RepeatScout_1.0.5 
    cd 1.0.5/
    cd src/
    module load git/2.28.0
    git clone https://github.com/mmcco/RepeatScout
    cd RepeatScout/
    git reset --hard 172e1cc
    make
    cd ..
    rmdir $PREFIX
    mv RepeatScout $PREFIX

`$PREFIX` should be added to `PATH`.  Check the perl files, make sure they use the `#!/usr/bin/env perl` mechanism.

    cd $PREFIX
    view *.prl

They do.

The mf file should load `trf/4.09.1` and `nseg/1.0.1`.

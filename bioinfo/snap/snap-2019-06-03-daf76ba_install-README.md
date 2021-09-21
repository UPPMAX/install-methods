snap/2019-06-03-daf76ba
=======================

<https://github.com/KorfLab/SNAP>

Used under license:
Custom AS-IS
<https://github.com/KorfLab/SNAP/blob/master/LICENSE>

Structure creating script (makeroom_snap_2019-06-03-daf76ba.sh) moved to /sw/bioinfo/snap/makeroom_2019-06-03-daf76ba.sh

Use the most recent SNAP tree from github, rather than the lab website, which makes no mention of the github repository.

LOG
---

    COMMIT=daf76ba
    makeroom.sh -f -t "snap" -v "2019-06-03-$COMMIT" -c "bioinfo" -s "annotation" -w "https://github.com/KorfLab/SNAP" -l "Custom AS-IS" -L "https://github.com/KorfLab/SNAP/blob/master/LICENSE" -d "general purpose gene finding program suitable for both eukaryotic and prokaryotic genomes. SNAP is an acroynm for Semi-HMM-based Nucleic Acid Parser"
    ./makeroom_snap_2019-06-03-$COMMIT.sh

Following the instructions on the last line of the ./makeroom... output:

    source /sw/bioinfo/snap/SOURCEME_snap_2019-06-03-daf76ba && cd $TOOLDIR

Now get build and install the thing.  Note that compilation problems with the 2013-11-29 version do not occur here.

    cd $SRCDIR
    module load git/2.28.0
    module load perl/5.26.2
    module load gcc/9.3.0
    git clone https://github.com/KorfLab/SNAP
    cd SNAP
    git reset --hard $COMMIT
    sed -i 's,^#!/usr/bin/perl$,#!/usr/bin/env perl,' *.pl
    make

Move to $PREFIX.

    cd ..
    rmdir $PREFIX
    mv SNAP $PREFIX

Dfam/3.8
========

<https://dfam.org/home>

Used under license:
Creative Commons Zero CC0
<https://dfam.org/about>

Structure creating script (makeroom_Dfam_3.8.sh) moved to /sw/data/Dfam/makeroom_3.8.sh

LOG
---

    makeroom.sh -f "-t" "Dfam" "-v" "3.8" "-c" "data" "-w" "https://dfam.org/home" "-l" "Creative Commons Zero CC0" "-L" "https://dfam.org/about" "-d" "Dfam is an open database of repetitive DNA elements organized around multiple sequence alignments of TE families"
    ./makeroom_Dfam_3.8.sh
    cd /sw/data/Dfam
    source SOURCEME_Dfam_3.8

    cd $SRCDIR

    echo "mirror -c Dfam_3.8" | lftp https://dfam.org/releases/

Check checksums.

    cd $SRCDIR/Dfam_3.8

    cd families
    for F in *.md5sum ; do md5sum -c $F; done

    Dfam.embl.gz: OK
    Dfam.hmm.gz: OK
    Dfam_curatedonly.embl.gz: OK
    Dfam_curatedonly.hmm.gz: OK

    cd FamDB
    for F in *.md5sum ; do md5sum -c $F; done

    dfam38_full.0.h5.gz: OK
    dfam38_full.1.h5.gz: OK
    dfam38_full.2.h5.gz: OK
    dfam38_full.3.h5.gz: OK
    dfam38_full.4.h5.gz: OK
    dfam38_full.5.h5.gz: OK
    dfam38_full.6.h5.gz: OK
    dfam38_full.7.h5.gz: OK

Unpack all.

    cd $SRCDIR/Dfam_3.8/families
    module load gnuparallel
    parallel -j 6 --verbose gunzip -d -c {} '>' $PREFIX/{.} ::: *.gz

FamDB too.

    cd $SRCDIR/Dfam_3.8/families/FamDB
    mkdir $PREFIX/FamDB

    parallel -j 6 --verbose gunzip -d -c {} '>' $PREFIX/FamDB/{.} ::: *.gz


### dfamscan.pl

The mirror also includes the `dfamscan.pl` script for searching the Dfam.hmm
database as described at <https://www.dfam.org/help/tools>, and several
species-specific HMM databases within `infrastructure/dfamscan/`.  So, add
`dfamscan.pl` to `$PREFIX/bin/`.

    cd $SRCDIR
    cd Dfam_3.8/infrastructure
    mkdir $PREFIX/bin

See if we have to adjust the #! line.

    zcat dfamscan.pl.gz | head

Nope, it's ok. Install.

    gunzip -d -c dfamscan.pl.gz > $PREFIX/bin/dfamscan.pl
    cd $PREFIX/bin/
    chmod +x dfamscan.pl

Adjust `PATH` to add `$modroot/bin` for `dfamscan.pl`.


### Additional data directories

The mirror also includes annotations for several species under `annotations/`
and several species-specific HMM databases within `infrastructure/dfamscan/`.

So, note their availability. See module help for details.


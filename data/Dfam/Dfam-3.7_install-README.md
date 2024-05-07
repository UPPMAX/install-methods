Dfam/3.7
========================

<https://dfam.org/home>

Used under license:
Creative Commons Zero CC0
<https://dfam.org/about>

Structure creating script (makeroom_Dfam_3.7.sh) moved to /sw/data/Dfam/makeroom_3.7.sh

LOG
---

    makeroom.sh "-t" "Dfam" "-v" "3.7" "-c" "data" "-w" "https://dfam.org/home" "-l" "Creative Commons Zero CC0" "-L" "https://dfam.org/about" "-d" "Dfam is an open database of repetitive DNA elements organized around multiple sequence alignments of TE families"
    ./makeroom_Dfam_3.7.sh
    cd /sw/data/Dfam
    source SOURCEME_Dfam_3.7

    cd $SRCDIR

    echo "mirror -c Dfam_3.7" | lftp https://dfam.org/releases/

Check checksums.

    cd $SRCDIR/Dfam_3.7

    cd families
    for F in *.md5sum ; do md5sum -c $F; done

    Dfam.embl.gz: OK
    Dfam.h5.gz: OK
    Dfam.hmm.gz: OK
    Dfam_curatedonly.embl.gz: OK
    Dfam_curatedonly.h5.gz: OK
    Dfam_curatedonly.hmm.gz: OK

Unpack all.

    module load gnuparallel
    parallel -j 6 --verbose gunzip -d -c {} '>' $PREFIX/{.} ::: *.gz


### dfamscan.pl

The mirror also includes the `dfamscan.pl` script for searching the Dfam.hmm
database as described at <https://www.dfam.org/help/tools>, and several
species-specific HMM databases within `infrastructure/dfamscan/`.  So, add
`dfamscan.pl` to `$PREFIX/bin/`.

    cd $SRCDIR
    cd Dfam_3.7/infrastructure
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

DelGet/5.4
==========

<https://github.com/4ureliek/DelGet>

Used under license:


Structure creating script (makeroom_DelGet_5.4.sh) moved to /sw/bioinfo/DelGet/makeroom_5.4.sh

LOG
---

    TOOL=DelGet
    VERSION=5.4
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/4ureliek/DelGet -d "Finds micro- and midsize deletions (using gaps of 1-30 nt and >30 nt respectively) between orthologous regions of 3 or more species"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    vi ${TOOL}-${VERSION}_post-install.sh 

Turns out I need to add `Acme::Tools` to perl_modules, so I did to all current module versions.
Continuing.

There is a tagged version 5.3, but it has a major bug.  Clone the repository to
get version 5.4, resetting to the latest commit as of this install date.  Clone
directly into `$PREFIX`.

    cd $PREFIX
    module load git/2.28.0
    git clone https://github.com/4ureliek/DelGet.git .
    git reset --hard 8fc62ac

Change `#!` to use /usr/bin/env.

    vi DelGet.pl 

In mf, add `$modroot` to `PATH`.  Load `BioPerl/1.7.2_Perl5.26.2`, `blat/36`, `muscle/3.8.1551`, and `Kalign/2.04`.


Phobius/1.01
============

Request binaries from <http://phobius.sbc.su.se/data.html>.  Sent as email
attachment.  Install.

One change: there is a 64-bit executable of `decodeanhmm` shipped in the
tarball.  Make it the default.


LOG
---

    VERSION=1.01
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir -p Phobius
    cd Phobius
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src

Get tarball from my machine after downloading it from the email attachment.  I
don't know if this tmp dir name is particular to my download.  The `phobius.pl`
script uses `FindBin` to locate the other files.

    rsync -Pa xxx@yyy:Downloads/phobius101_linux.tar.gz .
    tar xvzf phobius101_linux.tar.gz
    cd tmp/tmp8z25Xv/phobius/
    mv -v * $PFX/
    cd ../../..
    rm -rf tmp
    cd $PFX

Rename the default 32-bit executable and symlink the default name to the 64-bit
executable.

    mv decodeanhmm decodeanhmm.32bit
    ln -s decodeanhmm.64bit decodeanhmm

The mf file includes `$PFX` (same as standard `$modroot`) in the path.


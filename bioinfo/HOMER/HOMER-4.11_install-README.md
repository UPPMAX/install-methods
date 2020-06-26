HOMER/4.11
========================

<http://homer.ucsd.edu/homer/>

Used under license:
GPL v3

Structure creating script (makeroom_HOMER_4.11.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/HOMER/makeroom_4.11.sh

This line installs everything available with HOMER, once the `configureHomer.pl` script is downloaded.

    perl configureHomer.pl -install homer -all


LOG
---

    TOOL=HOMER
    VERSION=4.11
    makeroom.sh -f" -s "annotation" -t "$TOOL" -v "$VERSION" -w "http://homer.ucsd.edu/homer/" -l "GPL v3" -d "HOMER \(Hypergeometric Optimization of Motif EnRichment\) is a suite of tools for Motif Discovery and ChIP-Seq analysis"
    ./makeroom_HOMER_4.11.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_HOMER_4.11

    cd $VERSION/src

    wget http://homer.ucsd.edu/homer/configureHomer.pl
    cp -av configureHomer.pl $PREFIX/
    cd $PREFIX
    perl configureHomer.pl -install homer -all


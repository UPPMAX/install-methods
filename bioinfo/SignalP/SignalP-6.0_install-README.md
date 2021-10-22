SignalP/6.0
========================

<https://services.healthtech.dtu.dk/cgi-bin/sw_request>

Used under license:
Custom as-is
<https://services.healthtech.dtu.dk/cgi-bin/sw_request>

Structure creating script (makeroom_SignalP_6.0.sh) moved to /sw/bioinfo/SignalP/makeroom_6.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "SignalP" -v "6.0" -w "https://services.healthtech.dtu.dk/cgi-bin/sw_request" -l "Custom as-is" -L "https://services.healthtech.dtu.dk/cgi-bin/sw_request" -d "Signal peptide and cleavage sites in gram+\, gram- and eukaryotic amino acid sequences"
    ./makeroom_SignalP_6.0.sh
SignalP/5.0b
========================

<http://www.cbs.dtu.dk/services/SignalP/>

Used under license:


Structure creating script (makeroom_SignalP_5.0b.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/SignalP/makeroom_5.0b.sh

LOG
---

We need perl > 5.6 and gnuplot > 4.0.

    TOOL=SignalP
    VERSION=5.0b

    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://www.cbs.dtu.dk/services/SignalP/ -s annotation -d "Predicts the presence of signal peptides and the location of their cleavage sites in proteins from Archaea, Gram-positive Bacteria, Gram-negative Bacteria and Eukarya" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION
    cd src/

Remove cluster directory, we will move the unpacked directory to it.
Downloaded SignalP to my desktop after agreeing to licence, so get it and its
licence file from there.

    tar xzf signalp-${VERSION}.Linux.tar.gz 
    rm $PREFIX
    mv signalp-${VERSION} $PREFIX
    cd $PREFIX
    mkdir -p man/man1
    cp signalp.1 man/man1/

There is no longer a Perl script to update, as there was for previous versions.

Updated the mf files, linked everything, and now testing output.

    cd $PREFIX/..
    mkdir test
    cd test
    module load bioinfo-tools SignalP/5.0b
    signalp --help
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format short -prefix euk_10_short
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format long -prefix euk_10_long
    for F in * ; do echo "After test, checking differences between $F and expected output"; diff ../rackham/test/$F $F; done > test_results.txt

The test works fine, the only difference is timestamps.


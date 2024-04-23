SignalP/6.0h
============

<http://www.cbs.dtu.dk/services/SignalP/>

<https://services.healthtech.dtu.dk/services/SignalP-6.0/>

Used under license:

Custom nonprofit AS-IS

<https://services.healthtech.dtu.dk/cgi-bin/sw_request?software=signalp&version=6.0&packageversion=6.0h&platform=fast>

Also at /sw/bioinfo/SignalP/6.0h/src/signalp-6.0_license.txt

Structure creating script (makeroom_SignalP_6.0h.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/SignalP/makeroom_6.0h.sh

LOG
---

We need perl > 5.6 and gnuplot > 4.0.

    TOOL=SignalP
    VERSION=6.0h

    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://www.cbs.dtu.dk/services/SignalP/ -s annotation -d "Predicts the presence of signal peptides and the location of their cleavage sites in proteins from Archaea, Gram-positive Bacteria, Gram-negative Bacteria and Eukarya" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/bioinfo/SignalP/SOURCEME_SignalP_6.0h && cd $SRCDIR

Downloaded SignalP to my desktop after agreeing to licence, so get it and its
licence file from there.

This is now installed as a python package.

    tar xf signalp-${VERSION}.fast.tar.gz 

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
    module load bioinfo-tools SignalP/6.0h
    signalp --help
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format short -prefix euk_10_short
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format long -prefix euk_10_long
    for F in * ; do echo "After test, checking differences between $F and expected output"; diff ../rackham/test/$F $F; done > test_results.txt

The test works fine, the only difference is timestamps.


    TOOL=SignalP
    VERSION=6.0h
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://www.cbs.dtu.dk/services/SignalP/ -s annotation -d "Predicts the presence of signal peptides and the location of their cleavage sites in proteins from Archaea, Gram-positive Bacteria, Gram-negative Bacteria and Eukarya"
    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/bioinfo/SignalP/SOURCEME_SignalP_6.0h
    cd $SRCDIR

Downloaded SignalP to my desktop after agreeing to licence, so get it and its
licence file from there.

This is now installed as a python package.

Set up the venv.

    cd $PREFIX
    ml python/3.9.5
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python

    cd $SRCDIR

    tar xf signalp-${VERSION}.fast.tar.gz 

    cd signalp6_fast/signalp-6-package/

    pip3 install .

    cd $PREFIX

Lift out man page.

    ln -s venv/share .

Prepare bin.

    mkdir bin
    cd bin
    ln -s ../venv/bin/{signalp,torchrun,convert}* .

Modify `signalp6_convert_models` to directly specify the python3 from the virtualenv.

    vi signalp6_convert_models 

Now copy over model files.

    SIGNALP_DIR=$(python3 -c "import signalp; import os; print(os.path.dirname(signalp.__file__))" )
    ll $SIGNALP_DIR/model_weights/
    cd $SRCDIR/
    cd signalp6_fast/
    cp -av signalp-6-package/models/* $SIGNALP_DIR/model_weights/

Include instructions in the mf for converting models to GPU.

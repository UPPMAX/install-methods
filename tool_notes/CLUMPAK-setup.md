To download, set up and run CLUMPAK at UPPMAX
=============================================

Initial setup
-------------

Download and unpack the CLUMPAK.zip zip file and the documentation.

    wget https://web.archive.org/web/20221213041750/http://clumpak.tau.ac.il/download/CLUMPAK.zip
    wget https://web.archive.org/web/20221213041750/http://clumpak.tau.ac.il/download/CLUMPAK_Documentation.pdf
    unzip CLUMPAK.zip
    cd CLUMPAK/

Unzip the CLUMPAK tools themselves and do some further setup to be able to run the tools.

    unzip 26_03_2015_CLUMPAK.zip 
    cd 26_03_2015_CLUMPAK/CLUMPAK/
    sed -i '1i#!/usr/bin/env perl' *.pl
    chmod +x *.pl
    chmod +x CLUMPP/CLUMPP 
    chmod +x mcl/bin/*
    chmod +x distruct/distruct1.1 

Unzip the 'main pipeline' example data, then go back to the CLUMPAK tool directory.

    cd ../../examples/Main_pipeline
    unzip toy_data.zip
    cd ../../26_03_2015_CLUMPAK/CLUMPAK/

Every time you want to run
--------------------------

Now you are in the directory from which you run CLUMPAK.pl and the other
scripts. Every time you run the tools, you need to be in this specific
directory.

    echo "Where am I so I can run CLUMPAK again?   $PWD"

The directory that is printed is the directory to 'cd' to each time you want to
run CLUMPAK.

Once you are in this directory, each time you need to run CLUMPAK, you need to
enter the following lines so that everything is set up to run the tools.

    module load perl_modules/5.26.2
    export PATH=$PWD:$PATH
    export PERL5LIB=$PWD:$PERL5LIB
    TESTDATA=$PWD/../../examples/Main_pipeline

The manual says to prefix the commands with 'perl', as in `perl CLUMPAK.pl
...`. You can do that, but the initial setup and the setup you do each time
means you can run each script directly, as in `CLUMPAK.pl ...`.

To test, run the test data. You don't need to run all of these to verify it works.

    CLUMPAK.pl --id testK2 --dir testK2.output --labels $TESTDATA/toy_data_labels.txt --file $TESTDATA/K2.zip 
    CLUMPAK.pl --id testK3 --dir testK3.output --labels $TESTDATA/toy_data_labels.txt --file $TESTDATA/K3.zip 
    CLUMPAK.pl --id testK4 --dir testK4.output --labels $TESTDATA/toy_data_labels.txt --file $TESTDATA/K4.zip 
    CLUMPAK.pl --id testK5 --dir testK5.output --labels $TESTDATA/toy_data_labels.txt --file $TESTDATA/K5.zip 
    CLUMPAK.pl --id testK6 --dir testK6.output --labels $TESTDATA/toy_data_labels.txt --file $TESTDATA/K6.zip 


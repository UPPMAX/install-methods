TSEBRA/1.1.2.4
==============

<https://github.com/Gaius-Augustus/TSEBRA>

Used under license:
Artistic License 2.0
<https://opensource.org/licenses/Artistic-2.0>


Use python/3.11.8 as that's what is used by the most recent braker/3.0.7


LOG
---

    TOOLVERSION=1.1.2.4
    VERSION=${TOOLVERSION}

    makeroom.sh -f -t TSEBRA -v $VERSION -c bioinfo -s annotation -w https://github.com/Gaius-Augustus/TSEBRA -l "Artistic License 2.0" -L https://opensource.org/licenses/Artistic-2.0 -d "a combiner tool that selects transcripts from gene predictions based on the support by extrisic evidence in form of introns and start/stop codons, developed to combine BRAKER1 and BRAKER2 predicitons to increase their accuracies" 
    ./makeroom_TSEBRA_${VERSION}.sh 
    source /sw/bioinfo/TSEBRA/SOURCEME_TSEBRA_${VERSION} && cd $TOOLDIR
    cd $VERSION
    cd src/
    wget https://github.com/Gaius-Augustus/TSEBRA/archive/refs/tags/v1.1.2.4.tar.gz
    tar xf v1.1.2.4.tar.gz
    rmdir $PREFIX
    mv TSEBRA-1.1.2.4 $PREFIX

Set up virtualenv.

    ml python/3.11.8
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    pip3 install numpy
    deactivate

Load compleasm/0.2.5 in the mf.  We certainly no longer need to load python.
Describe the config files there as well.

We also do not need to install pandas, since that is handled by compleasm
itself, within its own virtualenv. And its other requirements.

    cd $PREFIX/bin
    sed -i -e '1i#!'"$(which python3)" $(grep -l '^#!.*python' *.py)

    cd ../example/
    ./run_tsebra_example.sh 


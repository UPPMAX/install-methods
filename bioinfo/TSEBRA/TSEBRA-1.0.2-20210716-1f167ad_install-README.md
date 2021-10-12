TSEBRA/1.0.2-20210716-1f167ad
=============================

<https://github.com/Gaius-Augustus/TSEBRA>

Used under license:
Artistic License 2.0
<https://opensource.org/licenses/Artistic-2.0>

Structure creating script (makeroom_TSEBRA_1.0.2-20210716-1f167ad.sh) moved to /sw/bioinfo/TSEBRA/makeroom_1.0.2-20210716-1f167ad.sh

A rename script has been added since 1.0.2 was released a couple weeks ago, so clone the repository rather than use the release.

Use python/3.7.2 as that's what is used by the most recent braker/2.1.6.


LOG
---

    TOOLVERSION=1.0.2
    COMMITDATE=20210716
    COMMIT=1f167ad
    VERSION=${TOOLVERSION}-${COMMITDATE}-${COMMIT}

    makeroom.sh -t TSEBRA -v $VERSION -c bioinfo -s annotation -w https://github.com/Gaius-Augustus/TSEBRA -l "Artistic License 2.0" -L https://opensource.org/licenses/Artistic-2.0 -d "a combiner tool that selects transcripts from gene predictions based on the support by extrisic evidence in form of introns and start/stop codons, developed to combine BRAKER1 and BRAKER2 predicitons to increase their accuracies" 
    ./makeroom_TSEBRA_${VERSION}.sh 
    source /sw/bioinfo/TSEBRA/SOURCEME_TSEBRA_${VERSION} && cd $TOOLDIR
    cd $VERSION
    cd src/
    ml git/2.28.0
    git clone https://github.com/Gaius-Augustus/TSEBRA
    cd TSEBRA
    git reset --hard $COMMIT
    cd ..
    ml python/3.7.2
    rmdir $PREFIX && mv TSEBRA $PREFIX
    cd $PREFIX
    cd bin/
    head -n 1 *.py
    cd ../example/
    ./run_tsebra_example.sh 


HESS/0.5.4-beta
===============

<https://huwenboshi.github.io/hess/>

Used under license:
GPL v3

Structure creating script (makeroom_HESS_0.5.4-beta.sh) moved to /sw/bioinfo/HESS/makeroom_0.5.4-beta.sh

LOG
---

    cd /sw/bioinfo
    TOOL=HESS
    VERSION=0.5.4-beta
    makeroom.sh -f -s misc -t $TOOL -v $VERSION -w https://huwenboshi.github.io/hess/ -d "HESS (Heritability Estimation from Summary Statistics) is a software package for estimating and visualizing local SNP-heritability and genetic covariance (correlation) from GWAS summary association data." -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget https://github.com/huwenboshi/hess/archive/v${VERSION}.zip
    unzip v${VERSION}.zip 
    rmdir $PREFIX
    mv hess-${VERSION} $PREFIX
    cd $PREFIX

Uses python 2, so load our latest module of that.  It also requires pysnptools
0.3+, and the latest pysnptools requires a newer version of numpy than is
available for python2, which stops at 1.16.x.  So, use the == trick to figure
out the available versions of pysnptools, and pick the last 0.3.x version
available, crossing our fingers that that requires numpy/scipy versions that
are already available within python/2.7.15.

    ml python/2.7.15

    PYTHONUSERBASE=$PREFIX pip install --user pysnptools==
    PYTHONUSERBASE=$PREFIX pip install --user pysnptools==0.3.14

Every other package is provided by python/2.7.15.  Make the main file
executable and have it find the proper python2.

    vi hess.py 
    chmod +x hess.py 

### Reference panel

    cd $VERSIONDIR
    mkdir data
    cd data

Fetched the filtered Europeans reference panel mentioned by the developers at
https://huwenboshi.github.io/hess/input_format/ and it turns out that is a
gzipped tarball.

    wget -O 1kg_eur_1pct.tar.gz https://ucla.box.com/shared/static/l8cjbl5jsnghhicn0gdej026x017aj9u.gz
    tar xf 1kg_eur_1pct.tar.gz
    mv 1kg_eur_1pct.tar.gz $SRCDIR

This unpacks as a directory `1kg_eur_1pct/`, so mention that in the mf file along with the executability of `hess.py`.

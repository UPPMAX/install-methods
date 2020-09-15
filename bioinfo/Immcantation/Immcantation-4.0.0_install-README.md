Immcantation/4.0.0
========================

<https://immcantation.readthedocs.io/en/stable/index.html>

Used under license:
AGPL-3

Structure creating script (makeroom_Immcantation_4.0.0.sh) moved to /sw/bioinfo/Immcantation/makeroom_4.0.0.sh

LOG
---

    TOOL=Immcantation
    VERSION=4.0.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Immcantation/4.0.0/src
    /home/douglas/bin/makeroom.sh -f" -t "Immcantation" -v "4.0.0" -s "misc" -w "https://immcantation.readthedocs.io/en/stable/index.html" -d "start-to-finish analytical ecosystem for high-throughput AIRR-seq datasets" -l "AGPL-3"
    ./makeroom_Immcantation_4.0.0.sh
    cd /sw/bioinfo/Immcantation/4.0.0/src
    wget http://
    tar xvf 
    make

### prestoR

A bitbucket package, part of Immcantation (https://immcantation.readthedocs.io/).
Probably best installed there.

    devtools::install_bitbucket("kleinstein/prestor", ref = 'master')


    TOOL=Immcantation
    VERSION=4.0.0
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://immcantation.readthedocs.io/en/stable/index.html -d "start-to-finish analytical ecosystem for high-throughput AIRR-seq datasets" -l "AGPL-3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/bioinfo/${TOOL}
    source SOURCEME_${TOOL}_${VERSION} 

module load python/3.7.2
PYTHONUSERBASE=$PREFIX pip install --user presto changeo
cd $PREFIX/lib
mkdir R_packages
export R_LIBS_USER=$PWD/R_packages
module unload python
module load R/4.0.0
module load R_packages/4.0.0
R

Within R, install

* prestoR, not on CRAN, install from BitBucket https://immcantation.readthedocs.io/en/stable/packages/prestor.html
* RDI, on CRAN   https://rdi.readthedocs.io/en/1.0.0/
* RabHIT, on CRAN https://yaarilab.bitbucket.io/RAbHIT/

    library(devtools)
    install_bitbucket("kleinstein/prestor", ref = 'master', force=TRUE)
    install.packages("rdi", force=TRUE)
    install.packages("rabhit", force=TRUE)


1054  ll
1055  ll R_packages/
1056  ll R_packages/prestor/
1057  fg
1058  cd ../../..
1059  ll
1060  vi Immcantation-4.0.0_install-README.md 
1061  history >> Immcantation-4.0.0_install-README.md 

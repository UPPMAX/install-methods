MAGeCK/0.5.9.4
==============

<https://sourceforge.net/p/mageck/wiki/Home/>

Used under license:
BSD

In 0.5.6, I just installed a couple R packages locally.  Here, I just load R_packages/4.0.0.

LOG
---

    TOOL=MAGeCK
    VERSION=0.5.9.4
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w https://sourceforge.net/p/mageck/wiki/Home/ -l "BSD" -d "Model-based Analysis of Genome-wide CRISPR-Cas9 Knockout"
    ./makeroom_MAGeCK_0.5.9.4.sh 
    source SOURCEME_MAGeCK_0.5.9.4 
    cd 0.5.9.4/
    cd src/
    wget https://downloads.sourceforge.net/project/mageck/0.5/mageck-0.5.9.4.tar.gz
    tar xzf mageck-0.5.9.4.tar.gz 
    cd mageck-0.5.9.4/
    ml python/3.7.2
    ml R/4.0.0 R_packages/4.0.0
    ml texlive/2019
    PYTHONUSERBASE=$PREFIX pip install --user .

For the mf file, load the modules

    python/3.7.2
    R/4.0.0
    R_packages/4.0.0
    texlive/2019

and add $modroot/bin to PATH and $modroot/lib/python3.7/site-packages to PYTHONPATH.


MAGeCK/0.5.6
============

<https://sourceforge.net/projects/mageck/>

LOG
---

Needs `pdflatex` and the R packages `xtable` and `gplots`.  Instead of loading
`R_packages`, I will just compile and install with the system R.  They are just
used for generating reports.

    VERSION=0.5.6
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir MAGeCK
    cd MAGeCK
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    mkdir R
    cd R
    RLU=$PWD
    cd ../../src
    [[ -f mageck-${VERSION}.tar.gz ]] || wget https://downloads.sourceforge.net/project/mageck/0.5/mageck-${VERSION}.tar.gz
    tar xvzf mageck-${VERSION}.tar.gz
    mv mageck-${VERSION} mageck-${VERSION}-${CLUSTER}
    cd mageck-${VERSION}-${CLUSTER}
    module load python/2.7.6

Install the R packages with system R.

    export R_LIBS_USER=$RLU
    R

and within R

    install.packages(c('xtable','gplots'))

Now the python code.

    PYTHONUSERBASE=$PFX python setup.py install --user

In the mf, load `python/2.7.6`, add `$PFX/bin` to `PATH`, add `$PFX/R` to
`R_LIBS_SITE`, and `$PFX/lib/python2.7/site-packages` to `PYTHONPATH`.



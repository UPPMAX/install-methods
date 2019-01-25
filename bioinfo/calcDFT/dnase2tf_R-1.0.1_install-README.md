dnase2tf_R/1.0.1
========================

<https://sourceforge.net/projects/dnase2tfr/>

LOG
---
This is an R package, but I used the calcDFT tree to install it, since they seemed heavily bundled.
    VERSION=1.0.1
    CLUSTER=rackham
    cd /sw/apps/bioinfo/calcDFT/$VERSION/src
    wget https://downloads.sourceforge.net/project/dnase2tfr/dnase2tf_1.0.1.tar.gz
    tar xfz dnase2tf_1.0.1.tar.gz
Standard R package addition
    cd dnase2tf
    VERSION=3.5.0
    CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
    cd /sw/apps
    mkdir -p R_packages
    cd R_packages/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    cd $CLUSTER/
    export R_LIBS_USER=$PWD
    module load R/$VERSION
    module load build-tools
    module load autoconf/2.69
    module load automake/1.14.1
    module load m4/1.4.17
    module load MariaDB/10.1.29
    module load PostgreSQL/10.3
    module load UDUNITS/2.2.26  # these further modules were added
    module load GDAL/2.1.0
    module load Poppler/0.54.0
    module load JAGS/4.3.0
    echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"

Inside R:
    install.packages('/sw/apps/bioinfo/calcDFT/1.0.1/src/dnase2tf', repos = NULL, type="source")

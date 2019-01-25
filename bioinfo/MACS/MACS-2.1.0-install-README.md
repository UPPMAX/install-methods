MACS 2.1.0
==========

Irma installation
-----------------

Exact release string necessary to match installation on Milou.  2.1.0 wasn't
enough and no version specified appeared to install 2.1.1, which isn't listed
on the GitHub site. Note the current version is really just an RC.

    cd /sw/apps/bioinfo/MACS
    VERS=2.1.0
    INST=$PWD/$VERS/$CLUSTER
    mkdir $INST
    module load python/2.7.6
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" MACS2==2.1.0.20140616


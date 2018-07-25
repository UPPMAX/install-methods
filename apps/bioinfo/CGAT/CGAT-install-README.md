CGATOxford CGAT tools
===========

https://github.com/CGATOxford

LOG
---

Simple to install with `pip`.
    VERSION=0.2.7
    PYTHONVERSION=2.7.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/boinfo/CGAT/i
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC ; done
    cd ${CLUSTER}/
    PFX=$PWD
    wget https://raw.github.com/CGATOxford/cgat/master/requires.txt 
    modify requires,txt to be rpy==2.6 and pysam to be 0.8.3
    module load python/$PYTHONVERSION
##satiesfying demands rpy2 nolonger supports python 2
    PYTHONUSERBASE=$PFX pip install  --user -r requires.txt
    PYTHONUSERBASE=$PFX pip install --user git+https://github.com/CGATOxford/cgat/
 ## First install do the foolowing instalation steps
    mkdir /sw/mf/common/bioinfo-tools/misc/CGAT
    cp mf/$VERSION /sw/mf/common/bioinfo-tools/misc/CGAT/


I have tried to solve it as per issye #246 the only thing I have not tried is the conda install.
the issue is that cgat scripts is using a incompatable file version wich causes an incompatible type error

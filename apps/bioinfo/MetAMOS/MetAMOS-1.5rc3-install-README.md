MetAMOS/1.5rc3
==============

A metagenomic and isolate assembly and analysis pipeline.

<http://metamos.readthedocs.io/>
 
<https://github.com/marbl/metAMOS>

This tool wants to install its own copies of several things we have for its
core dependencies.  I couldn't coax it into doing otherwise without much work,
but it appears several other modules can be used for extended functionality if
the results of the `cd ./Test; ./run_pipeline_test.sh` procedure is correct.

LOG
---

    VERSION=1.5rc3
    CLUSTER=${$CLUSTER?:CLUSTER ust be set}
    cd /sw/apps/bioinfo
    mkdir MetAMOS
    cd MetAMOS
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    wget https://github.com/marbl/metAMOS/archive/v1.5rc3.zip
    unzip v1.5rc3.zip
    cd metAMOS-1.5rc3
    module load python/2.7.15
    python INSTALL.py core

Errors... some things could not be downloaded where they expected them to be.
URLs need to be updated, including:

    milou-b: /sw/apps/bioinfo/MetAMOS/1.5rc3/milou/metAMOS-1.5rc3 $ diff ../orig/metAMOS-1.5rc3/INSTALL.py INSTALL.py
    295c295,296
    <        os.system("curl -L http://psutil.googlecode.com/files/psutil-0.6.1.tar.gz -o ./psutil.tar.gz")
    ---
    >        #os.system("curl -L http://psutil.googlecode.com/files/psutil-0.6.1.tar.gz -o ./psutil.tar.gz")
    >        os.system("curl -L https://github.com/giampaolo/psutil/archive/release-0.6.1.tar.gz -o ./psutil.tar.gz")
    297c298
    <        os.system("mv ./Utilities/python/psutil-0.6.1 ./Utilities/python/psutil")
    ---
    >        os.system("mv ./Utilities/python/psutil-release-0.6.1 ./Utilities/python/psutil")
    359c360,361
    <        os.system("curl -L http://pysam.googlecode.com/files/pysam-0.6.tar.gz -o ./pysam.tar.gz")
    ---
    >        #os.system("curl -L http://pysam.googlecode.com/files/pysam-0.6.tar.gz -o ./pysam.tar.gz")
    >        os.system("curl -L https://github.com/pysam-developers/pysam/archive/v0.8.3.tar.gz -o ./pysam.tar.gz")

So, copy over the milou version of `INSTALL.py` which contains the fixes we need and use that.

The installation takes a long time and seems complex, so I decided to keep the
installation in place.

    python INSTALL.py core

This uses about 10GB!  Test it.

    cd Test
    ./run_pipeline_test.sh 

Shows that several tools are unavailable, maybe in the `optional` installation?
But that is far too large.  See if loading the modules we have helps.

    module load KmerGenie/1.6741
    module load CA/8.3
    module load SignalP/4.1f
    module load REAPR/1.0.18
    module load quast/4.5.4
    module load freebayes/1.0.2
    module load 454-dataanalysis/2.9
    module load blast/2.2.31+
    module load ea-utils/1.1.2-537

It seems to. Add a message to the mf file to say this can be done.


GEMINI 0.20.1
=============

<http://gemini.readthedocs.org/en/latest/index.html>

Useful human variant annotation package but the shared data and tools takes **51GB**, when including the CADD and GERP data packages.

Log
---

    VERSION=0.20.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    
    mkdir -p /sw/bioinfo/GEMINI/$VERSION
    cd /sw/bioinfo/GEMINI/$VERSION
    

    mkdir $CLUSTER
    mkdir -p $CLUSTER/share_data
    mkdir src
    cd src
    
    PFX=/sw/bioinfo/GEMINI/$VERSION/$CLUSTER
    SHR=/sw/bioinfo/GEMINI/$VERSION/$CLUSTER/share_data
    
    module load git/2.10.2
    unset PYTHONPATH && unset PYTHONHOME && export PYTHONNOUSERSITE=1
    
    python gemini_install.py $PFX $SHR

Note that this will install a miniconda2 environment including its own python.
No need to load python via `python/2.7.6`.


Now install CADD and GERP using gemini.

    PATH=/sw/apps/bioinfo/GEMINI/$VERSION/$CLUSTER/bin:$PATH
    gemini update --dataonly --extra cadd_score
    gemini update --dataonly --extra gerp_bp

first install
[[ "$CLUSTER" = "rackham" ]] && for CL in bianca irma snowy; do ln -s $CLUSTER $CL ; done
all_mflink -f GEMINI 0.20.1
ln -s /sw/mf/common/bioinfo-tools/annotation/GEMINI/0.20.1 /sw/mf/snowy/bioinfo-tools/annotation/GEMINI/0.20.1


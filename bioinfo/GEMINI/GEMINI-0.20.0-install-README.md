GEMINI 0.20.0
=============

<http://gemini.readthedocs.org/en/latest/index.html>

Useful human variant annotation package but the shared data and tools takes **51GB**, when including the CADD and GERP data packages.

Log
---

One change from the install of the previous version `GEMINI/0.18.3` is to put
`share_data` under `milou`.

    VERSION=0.20.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/GEMINI/$VERSION
    cd /sw/apps/bioinfo/GEMINI/$VERSION
    mkdir $CLUSTER
    mkdir -p $CLUSTER/share_data
    mkdir src
    cd src
    wget https://github.com/arq5x/gemini/raw/master/gemini/scripts/gemini_install.py
    PFX=/sw/apps/bioinfo/GEMINI/$VERSION/$CLUSTER
    SHR=/sw/apps/bioinfo/GEMINI/$VERSION/$CLUSTER/share_data
    module load git/2.10.2
    unset PYTHONPATH && unset PYTHONHOME && export PYTHONNOUSERSITE=1
    python gemini_install.py $PFX $SHR

Note that this will install a miniconda2 environment including its own python.
No need to load python via `python/2.7.6`.

Followed by lots and lots of installing, a lot of programs and some data, into
`/sw/apps/bioinfo/GEMINI/$VERSION/milou/share_data/gemini_data/`.

The installation ended with 

    Gemini data files updated
    Finished: gemini, tools and data installed
     Tools installed in:
      /sw/apps/bioinfo/GEMINI/0.20.0/milou
     NOTE: be sure to add /sw/apps/bioinfo/GEMINI/0.20.0/milou/bin to your PATH.
     Data installed in:
      /sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data
     NOTE: Install data files for GERP_bp & CADD_scores (not installed by default).

The `PATH` advice conflicts with the advice in the above installation
instructions, which says to add `PATH=$tools/bin:$data/anaconda/bin:$PATH`, but
for the tests, that directory and that file do not exist in the installed tree,
anywhere.

Good to know re: GERP and CADD data, I will install those separately below.

The installation also left a few broken links:

    cd /sw/apps/bioinfo/GEMINI/0.20.0/milou/bin
    ls -l

    total 20
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 gemini -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data/anaconda/bin/gemini
    lrwxrwxrwx 1 douglas sw 91 Jul 18 15:11 gemini_conda -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data/anaconda/bin/conda
    lrwxrwxrwx 1 douglas sw 89 Jul 18 15:11 gemini_pip -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data/anaconda/bin/pip
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 gemini_python -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data/anaconda/bin/python
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 grabix -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.20.0/milou/share_data/anaconda/bin/grabix

so I fixed them:

    ln -sf ../share_data/anaconda/bin/gemini .
    ln -sf ../share_data/anaconda/bin/conda gemini_conda
    ln -sf ../share_data/anaconda/bin/pip gemini_pip
    ln -sf ../share_data/anaconda/bin/python gemini_python
    ln -sf ../share_data/anaconda/bin/grabix .

Now install CADD and GERP using gemini.

    PATH=/sw/apps/bioinfo/GEMINI/$VERSION/milou/bin:$PATH
    gemini update --dataonly --extra cadd_score
    gemini update --dataonly --extra gerp_bp

For the extra annotation data, check what is the same between this and 0.19.0
and remove the older copy, symlinking it to the newer copy.

    cd /sw/apps/bioinfo/GEMINI
    diff --brief -Nsr 0.19.0/milou/share_data/gemini_data/ $VERSION/milou/share_data/gemini_data | tee data-file-comparison.txt
    grep 'are identical' data-file-comparison.txt | cut -f2,4 -d' ' | awk '{print "rm -f " $1 " && ln -s $PWD/" $2 " $PWD/" $1}' | bash

Before:

    milou-b: /sw/apps/bioinfo/GEMINI $ du -csh 0*
    8.5G    0.16.3
    1.6G    0.18.3
    51G     0.19.0
    60G     0.20.0
    121G    total

After:

    milou-b: /sw/apps/bioinfo/GEMINI $ du -csh 0*
    8.5G    0.16.3
    1.6G    0.18.3
    38G     0.19.0
    60G     0.20.0
    108G    total

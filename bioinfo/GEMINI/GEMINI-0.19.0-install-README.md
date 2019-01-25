# GEMINI-0.19.0-install-README.md

GEMINI 0.19.0
=============

<http://gemini.readthedocs.org/en/latest/index.html>

Useful human variant annotation package but the shared data and tools takes **51GB**, when including the CADD and GERP data packages.

Log
---

One change from the install of the previous version `GEMINI/0.18.3` is to put
`share_data` under `milou`.

    VERSION=0.19.0
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
    unset PYTHONPATH && unset PYTHONHOME && export PYTHONNOUSERSITE=1
    module load git/2.5.0
    python gemini_install.py $PFX $SHR

Followed by lots and lots of installing, into
`/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/`.

The installation ended with 

    Gemini data files updated
    Finished: gemini, tools and data installed
     Tools installed in:
      /sw/apps/bioinfo/GEMINI/0.18.3/milou
     NOTE: be sure to add /sw/apps/bioinfo/GEMINI/0.18.3/milou/bin to your PATH.
     Data installed in:
      /sw/apps/bioinfo/GEMINI/0.18.3/share_data
     NOTE: Install data files for GERP_bp & CADD_scores (not installed by default).

     Run tests with:
      cd /sw/apps/bioinfo/GEMINI/0.18.3/share_data/github_gemini && bash master-test.sh

The `PATH` advice conflicts with the advice in the above installation
instructions, which says to add `PATH=$tools/bin:$data/anaconda/bin:$PATH`, but
for the tests, that directory and that file do not exist in the installed tree,
anywhere.

Good to know re: GERP and CADD data, I will install those separately below.

The installation also left a bunch of broken links:

    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ll
    total 20
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 gemini -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/bin/gemini
    lrwxrwxrwx 1 douglas sw 91 Jul 18 15:11 gemini_conda -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/bin/conda
    lrwxrwxrwx 1 douglas sw 89 Jul 18 15:11 gemini_pip -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/bin/pip
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 gemini_python -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/bin/python
    lrwxrwxrwx 1 douglas sw 92 Jul 18 15:11 grabix -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.19.0/milou/share_data/anaconda/bin/grabix

so I fixed them:

    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ln -sf ../share_data/anaconda/bin/gemini
    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ln -sf ../share_data/anaconda/bin/conda gemini_conda
    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ln -sf ../share_data/anaconda/bin/pip gemini_pip
    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ln -sf ../share_data/anaconda/bin/python gemini_python
    milou-b: /sw/apps/bioinfo/GEMINI/0.19.0/milou/bin $ ln -sf ../share_data/anaconda/bin/grabix .

After downloading CADD and GERP using the instructions available for the
`GEMINI/0.18.3` install, I wondered whether there was any difference from what
was downloaded for 0.18.3, and there wasn't (this took a while).

    milou-b: /sw/apps/bioinfo/GEMINI $ diff --brief -Nr 0.18.3/share_data/gemini_data/ 0.19.0/milou/share_data/gemini_data/
    milou-b: /sw/apps/bioinfo/GEMINI

So I am keeping the newest copy by removing the old one at
`0.18.3/share_data/gemini_data/` and symlinking
`0.19.0/milou/share_data/gemini_data/` to that location.


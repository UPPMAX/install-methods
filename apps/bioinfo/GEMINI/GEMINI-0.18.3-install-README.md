# GEMINI-0.18.3-install-README.md

GEMINI 0.18.3
=============

<http://gemini.readthedocs.org/en/latest/index.html>

Useful human variant annotation package but the shared data and tools takes **51GB**, when including the CADD and GERP data packages.

Log
---

    VERSION=0.18.3
    mkdir -p /sw/apps/bioinfo/GEMINI/$VERSION
    cd /sw/apps/bioinfo/GEMINI/$VERSION
    mkdir share_data
    mkdir milou
    mkdir src
    cd src
    wget https://github.com/arq5x/gemini/raw/master/gemini/scripts/gemini_install.py
    PFX=/sw/apps/bioinfo/GEMINI/$VERSION/milou
    SHR=/sw/apps/bioinfo/GEMINI/$VERSION/share_data
    unset PYTHONPATH && unset PYTHONHOME && export PYTHONNOUSERSITE=1
    module load git
    python gemini_install.py $PFX $SHR

Followed by lots and lots of installing, into
`/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/`.

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

The `PATH` advice conflicts with the advice in the above installation instructions, which says to add `PATH=$tools/bin:$data/anaconda/bin:$PATH`.

but for the tests, that directory and that file do not exist in the installed
tree, anywhere.

Good to know re: GERP and CADD data, I will install those separately below.

The installation also left a bunch of broken links:

    milou-b: /sw/apps/bioinfo/GEMINI/0.18.3/milou/bin $ ll
    total 20
    lrwxrwxrwx 1 douglas sw 86 Mar 21 15:49 gemini -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/gemini
    lrwxrwxrwx 1 douglas sw 85 Mar 21 15:49 gemini_conda -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/conda
    lrwxrwxrwx 1 douglas sw 83 Mar 21 15:49 gemini_pip -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/pip
    lrwxrwxrwx 1 douglas sw 86 Mar 21 15:49 gemini_python -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/python
    lrwxrwxrwx 1 douglas sw 86 Mar 21 15:49 grabix -> ../../../../../../../pica/sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/grabix

Updated these to point to the actual installed locations:

    milou-b: /sw/apps/bioinfo/GEMINI/0.18.3/milou/bin $ ll
    total 20
    lrwxrwxrwx 1 douglas sw 61 Mar 21 16:44 gemini -> /sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/gemini
    lrwxrwxrwx 1 douglas sw 60 Mar 21 16:48 gemini_conda -> /sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/conda
    lrwxrwxrwx 1 douglas sw 58 Mar 21 16:48 gemini_pip -> /sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/pip
    lrwxrwxrwx 1 douglas sw 61 Mar 21 16:49 gemini_python -> /sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/python
    lrwxrwxrwx 1 douglas sw 61 Mar 21 16:49 grabix -> /sw/apps/bioinfo/GEMINI/0.18.3/share_data/anaconda/bin/grabix

Now install CADD and GERP using gemini and the instructions provided by the ticket requestor (simply to save me time).


    PATH=/sw/apps/bioinfo/GEMINI/0.18.3/milou/bin:$PATH
    gemini update --dataonly --extra cadd_score

Looks like the CADD stuff will be maybe **40GB**.  Yeesh.

    gemini update --dataonly --extra gerp_bp

This one was about 7.5GB.  Looks like both got saved into the `share_data` directory of the installation.


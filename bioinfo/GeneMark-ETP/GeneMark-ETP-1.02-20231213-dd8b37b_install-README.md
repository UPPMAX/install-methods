GeneMark-ETP/1.02-20231213-dd8b37b
========================

<http://>

Used under license:
Creative Commons Attribution NonCommercial ShareAlike 4.0 License
<https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/License-Creative-Commons-Attribution-NonCommercial-ShareAlike-4.0-International.txt>

Structure creating script (makeroom_GeneMark-ETP_1.02-20231213-dd8b37b.sh) moved to /sw/bioinfo/GeneMark-ETP/makeroom_1.02-20231213-dd8b37b.sh

LOG
---

    makeroom.sh -f -c bioinfo -s annotation -t GeneMark-ETP -v 1.02-20231213-dd8b37b -l "Creative Commons Attribution NonCommercial ShareAlike 4.0 License" -L https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/License-Creative-Commons-Attribution-NonCommercial-ShareAlike-4.0-International.txt -d "Gene finding in eukaryotic genomes supported by transcriptome sequencing and protein homology"
    ./makeroom_GeneMark-ETP_1.02-20231213-dd8b37b.sh 
    source /sw/bioinfo/GeneMark-ETP/SOURCEME_GeneMark-ETP_1.02-20231213-dd8b37b
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/gatech-genemark/GeneMark-ETP
    cd GeneMark-ETP/
    git reset --hard dd8b37b
    ml -git

Check perl module availability. Copy the list needed from https://github.com/gatech-genemark/GeneMark-ETP/blob/main/INSTALL into `perl-module-list`:

    curl https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/INSTALL | grep '^cpanm ' | sed -e 's/^cpanm /use /' -e 's/$/;/' > perl-module-list
    ml perl_modules/5.32.1
    cat perl-module-list | perl

You'll see the following warning:

    Warning, threads::shared has already been loaded.  To
    enable shared variables, 'use threads' must be called
    before threads::shared or any module that uses it.

But an error likely means we're missing one of these from perl_modules. Add it.

Now handle the tool tree.

    cd GeneMark-ETP/

GeneMark-ETP provides several statically linked tools in its `tools/`
subdirectory. We're going to use our modules instead. Rename its tools so we
can't find them, and modify its check-tools script to verify using PATH after
we've done the module loads.

    cd tools
    for TOOL in bedtools diamond fastq-dump gffread hisat2* prefetch samtools stringtie vdb-config ; do
        mv $TOOL _$TOOL
    done
    ml bioinfo-tools
    ml BEDTools/2.31.1
    ml HISAT2/2.2.1
    ml StringTie/2.2.1
    ml samtools/1.19
    ml gffread/0.12.7
    ml sratools/3.0.7
    ml diamond/2.1.9 

    sed -i 's,"\./,",' check_ETP_tools.pl
    ./check_ETP_tools.pl

Move the download directory to `PREFIX`.

    rmdir $PREFIX && mv GeneMark-ETP $PREFIX

### Create a virtualenv, determine needed python packages, and change #! lines in python scripts.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    ml -python
    which pip3

Replace gmes scripts following https://github.com/Gaius-Augustus/BRAKER/issues/358

    fetch_url="https://raw.githubusercontent.com/Gaius-Augustus/BRAKER/report/scripts/predictionAnalysis"
    for F in generateReport.py predictionAnalysis.py printLongestIsoforms.py selectSupportedSubsets.py ; do
        [[ -f $F ]] && mv $F $F.old
        wget --timestamping "$fetch_url/$F"
        chmod +x $F
    done

Find required python packages.

    cd $PREFIX
    find bin -name '*.py' -print0 | xargs -0 grep import | cut -f2- -d: | grep -P '^(from|import)' | sort -Vu

This gives us:

    from collections import OrderedDict
    from matplotlib.backends.backend_pdf import PdfPages
    from prothint import callDependency, systemCall
    import argparse
    import collections
    import copy
    import csv
    import logging
    import math
    import matplotlib.pyplot as plt
    import matplotlib.ticker as ticker
    import numpy as np
    import os
    import predictionAnalysis as analysis
    import prothint
    import re
    import removeConflictingPredictions
    import shutil
    import subprocess
    import sys
    import tempfile
    import time

`prothint` `removeConflictingPredictions` and `predictionAnalysis` are local
packages handled in the appropriate .py files.  The rest are standard modules,
except for `matplotlib` and `numpy`. So, install those. Ensure that the pip3
is coming from the virtualenv.

    which pip3
    pip3 install matplotlib numpy

Now change #! lines for each file. Ensure that the python3 is coming from the
virtualenv.

    which python3
    sed -i -e '1i#!'"$(which python3)" $(find bin -name '*.py' -print)

### Wrap up

Wrap up. Load required modules, there are several compared to what GeneMark used.

    cd $TOOLDIR/mf
    vi 1.02-20231213-dd8b37b

Load these there:

    BEDTools/2.31.1
    HISAT2/2.2.1
    StringTie/2.2.1
    samtools/1.19
    gffread/0.12.7
    sratools/3.0.7
    diamond/2.1.9 

Include these directories in `PATH`, prepended in this order so `$PREFIX/bin` is first:

    prepend-path    PATH                  $modroot/bin/bmes/ProtHint/bin
    prepend-path    PATH                  $modroot/bin/gmes
    prepend-path    PATH                  $modroot/bin

Wrap up.

    cd $TOOLDIR
    ./GeneMark-ETP-1.02-20231213-dd8b37b_post-install.sh

Verify the installation.

    ml bioinfo-tools
    ml GeneMark-ETP/1.02-20231213-dd8b37b


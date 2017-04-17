# quast-4.5.4-install-README.md

quast
=====

Genome assembly evaluation tool
<https://pypi.python.org/pypi/quast>


Installation
------------

Previous versions were installed with "setup" but this gave some errors when
testing. Rather than tracking down the errors (which may have been minor), 
decided to switch to PYPI version; it should be easier in the long run anyway.

GitHub and Sourceforge claim that the latest release is 4.5. Those two sources
actually differ slightly and the PYPI is a few days newer. The version numbers 
match the respective "quast -v".

    VERS=4.5.4
    APPL=quast
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load python/2.7.6
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $APPL==$VERS

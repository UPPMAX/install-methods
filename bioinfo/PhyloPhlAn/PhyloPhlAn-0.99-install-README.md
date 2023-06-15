phylophlan/0.99
===============

<https://bitbucket.org/nsegata/phylophlan/wiki/Home>

Installed its own version of biopython to play nicely with `python/2.7.11`.

Ignored case on this one because it is confusing.  Version not available until
a dummy install.  Help claims `./phylophlan.py --version` will produce version
but no, use `-h` option for full help.

LOG
---

    TOOL=phylophlan
    VERSION=0.99
    cd /sw/bioinfo
    mkdir $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    mkdir src
    cd src
    module load python/2.7.11
    PYTHONUSERBASE=$PFX pip install --user biopython
    [[ -f default.tar.gz ]] || wget https://bitbucket.org/nsegata/phylophlan/get/default.tar.gz
    tar xzf default.tar.gz 
    mv nsegata-phylophlan-1d174e34b2ae $PFX/bin

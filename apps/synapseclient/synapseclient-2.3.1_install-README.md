synapseclient/2.3.1
========================

<http://python-docs.synapse.org/build/html/index.html#>

Used under license:

<>

Structure creating script (makeroom_synapseclient_2.3.1.sh) moved to /sw/apps/synapseclient/makeroom_2.3.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "synapseclient" -v "2.3.1" -c "apps" -w "http://python-docs.synapse.org/build/html/index.html#" -d "The synapseclient package provides an interface to Synapse\, a collaborative workspace for reproducible data intensive research projects"
    ./makeroom_synapseclient_2.3.1.sh
    TOOL=synapseclient
    version=2.3.1
    source /sw/apps/${TOOL}/SOURCEME_${TOOL}_$version
    cd $PREFIX
    module load python/3.8.7
    PYTHONUSERBASE=$PREFIX  pip3 install (--upgrade) synapseclient



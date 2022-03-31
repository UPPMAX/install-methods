cutadapt/3.1
========================

<https://cutadapt.readthedocs.io/en/stable/index.html>

Used under license:
MIT

Structure creating script (makeroom_cutadapt_3.1.sh) moved to /sw/bioinfo/cutadapt/makeroom_3.1.sh

LOG
---

Following Marcel Martin's advice for installing on a cluster with a robust virtualenv:

<https://cutadapt.readthedocs.io/en/stable/installation.html#shared-installation-on-a-cluster>

    TOOL=cutadapt
    VERSION=3.1
    cd /sw/bioinfo/cutadapt
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w https://cutadapt.readthedocs.io/en/stable/index.html -d "finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads" 
    ./makeroom_cutadapt_3.1.sh 
    source SOURCEME_cutadapt_3.1
    cd $PREFIX
    module load python/3.7.2
    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install cutadapt==$VERSION
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/cutadapt cutadapt

Make sure the virtualenv's python can find the python .so.

    module unload python
    ldd $(head -1 bin/cutadapt | cut -c3-)

All libraries should be located.

Add `$PREFIX/bin` to `PATH`.


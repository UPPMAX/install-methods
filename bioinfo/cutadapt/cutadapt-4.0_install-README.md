cutadapt/4.0
============

<https://cutadapt.readthedocs.io/en/stable/index.html>

Used under license:
MIT


Structure creating script (makeroom_cutadapt_4.0.sh) moved to /sw/bioinfo/cutadapt/makeroom_4.0.sh

LOG
---

Following Marcel Martin's advice for installing on a cluster with a robust virtualenv:

<https://cutadapt.readthedocs.io/en/stable/installation.html#shared-installation-on-a-cluster>


    MIT -w https://cutadapt.readthedocs.io/en/stable/index.html -d "finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads"
    ./makeroom_cutadapt_4.0.sh
    source /sw/bioinfo/cutadapt/SOURCEME_cutadapt_4.0 && cd $TOOLDIR

    cd $PREFIX
    module load python/3.9.5
    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install cutadapt==$VERSION
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/cutadapt cutadapt

Make sure the virtualenv's python can find the python .so.

    module unload python
    ldd $(head -1 cutadapt | cut -c3-)

All libraries should be located.

Add `$PREFIX/bin` to `PATH`.


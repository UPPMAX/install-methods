FALCON/2018.31.08-03.06
=======================

<https://github.com/PacificBiosciences/FALCON_unzip/wiki/Binaries>

Used under license:
Clear BSD
<https://raw.githubusercontent.com/PacificBiosciences/FALCON_unzip/master/LICENSE.txt>

Structure creating script (makeroom_FALCON_2018.31.08-03.06.sh) moved to /sw/bioinfo/FALCON/makeroom_2018.31.08-03.06.sh

LOG
---

    cd /sw/bioinfo
    cd FALCON
    makeroom.sh -t FALCON -v 2018.31.08-03.06 -s assembly -l "Clear BSD" -L https://raw.githubusercontent.com/PacificBiosciences/FALCON_unzip/master/LICENSE.txt -d "FALCON diploid assembler"
    ./makeroom_FALCON_2018.31.08-03.06.sh 
    source SOURCEME_FALCON_2018.31.08-03.06 
    cd $SRCDIR
    wget https://downloads.pacbcloud.com/public/falcon/falcon-2018.31.08-03.06-py2.7-ucs2-beta.tar.gz
    tar xf falcon-2018.31.08-03.06-py2.7-ucs2-beta.tar.gz 
    mv bin lib $PREFIX/

The mf should load

    module load python/2.7.15
    module load SMRT/5.0.1
    module load minimap2/2.4
    module load MUMmer/3.23

and add `$PREFIX/bin` to `PATH` and `$PREFIX/lib/python2.7/site-packages` to `PYTHONPATH`.


Make sure we can find the locally installed python packages.

    export PYTHONPATH=$PYTHONPATH:$PREFIX/lib/python2.7/site-packages

    python2.7 -c 'import pysam; print falcon_unzip'
    python2.7 -c 'import falcon_unzip; print falcon_unzip'


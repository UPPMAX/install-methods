snakemake/5.2.3
========================

<https://snakemake.readthedocs.io/en/stable/>

Used under license:
MIT

LOG
---

    TOOL=snakemake
    VERSION=5.2.3
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/bioinfo/snakemake/makeroom_5.2.3.sh

    ./makeroom_snakemake_5.2.3.sh
    cd $VERSIONDIR/src
    module load python/3.6.0
    mkdir $PREFIX/jsonschema
    mkdir $PREFIX/idna
    export PYTHONPATH=$PREFIX/idna:$PREFIX/jsonschema:$PREFIX/lib/python3.6/site-packages/
    pip3 install jsonschema --target=$PREFIX/jsonschema
    pip3 install idna --target=$PREFIX/idna
    cd $TOOL
    python3 setup.py install --prefix $PREFIX

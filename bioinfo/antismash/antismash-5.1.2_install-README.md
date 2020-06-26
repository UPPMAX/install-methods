antismash/5.1.2
========================

<https://github.com/antismash/antismash>

Used under license:
GNU Affero General Public License v3.0

Structure creating script (makeroom_antismash_5.1.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/antismash/makeroom_5.1.2.sh

LOG
---

    TOOL=antismash
    VERSION=5.1.2
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

# On your local computer with docker installed:
## Build a new Dockerimage with the included meme-suite from the Dockerfile in $VERSIONDIR/src/Dockerfile
docker build -t uppmax/antismash:5.1.2 .

# On Rackham:
## Create a sandbox to able to download all the databases. 
singularity build -s $PREFIX/antismash_uppmax_standalone.5.1.2 docker://uppmax/antismash:5.1.2
LANG=C.UTF-8 singularity exec -w -B $PREFIX/databases/:/local/databases $PREFIX/antismash_uppmax_standalone.5.1.2 download-antismash-databases

## Run antismash with the wrapper $PREFIX/antismash 
## The databases are located at $PREFIX/databases











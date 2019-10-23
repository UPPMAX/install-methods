circlator/1.5.5
========================

<https://sanger-pathogens.github.io/circlator/>

Used under license:
GNU General Public License v3.0

Structure creating script (makeroom_circlator_1.5.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/circlator/makeroom_1.5.5.sh

LOG
---
https://github.com/nosdac/circlator
https://hub.docker.com/r/uppmax/circlator

### ON A MACHINE YOU HAVE ROOT ACCESS ###

# copy this Dockerfile to some machine you have root access on
/sw/bioinfo/circlator/1.5.5/src/Dockerfile

# go to the folder you put the Dockerfiler above and build docker image
docker build -t uppmax/circlator:1.5.5 .

# push the docker image to docker hub
docker push uppmax/circlator:1.5.5

### ON UPPMAX ###

# build a singularity image from the docker image
singularity build /sw/bioinfo/circlator/1.5.5/rackham/bin/circlator:1.5.5.sif docker://uppmax/circlator:1.5.5

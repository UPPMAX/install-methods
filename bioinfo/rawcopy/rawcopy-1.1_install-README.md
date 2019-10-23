rawcopy/1.1
========================

<http://rawcopy.org>

Used under license:


Structure creating script (makeroom_rawcopy_1.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/rawcopy/makeroom_1.1.sh

LOG

---
### ON A MACHINE YOU HAVE ROOT ACCESS ###

# copy this Dockerfile to some machine you have root access on
/sw/bioinfo/rawcopy/1.1/src/Dockerfile

# go to the folder you put the Dockerfiler above and build docker image
docker build -t rawcopy/rawcopy:1.1 .

# push the docker image to docker hub
docker push rawcopy/rawcopy:1.1


### ON UPPMAX ###

# build a singularity image from the docker image
singularity build /sw/bioinfo/rawcopy/1.1/rackham/bin/rawcopy_1.1.sif docker://rawcopy/rawcopy:1.1

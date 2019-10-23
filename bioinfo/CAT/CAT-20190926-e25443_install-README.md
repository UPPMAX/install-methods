CAT/20190926-e25443
========================

<https://github.com/ComparativeGenomicsToolkit/Comparative-Annotation-Toolkit>

Used under license:
Apache License 2.0

Structure creating script (makeroom_CAT_20190926-e25443.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/CAT/makeroom_20190926-e25443.sh

LOG
---

     ### ON A MACHINE YOU HAVE ROOT ACCESS ###

     # copy this Dockerfile to some machine you have root access on
    /sw/bioinfo/CAT/20190926-e25443/src/Dockerfile

    # go to the folder you put the Dockerfiler above and build docker image
    docker build -t uppmax/comparative-annotation-toolkit:20190926-e25443 .

    # push the docker image to docker hub
    docker push uppmax/comparative-annotation-toolkit:20190926-e25443





    ### ON UPPMAX ###

    # build a singularity image from the docker image
    singularity build /sw/bioinfo/CAT/20190926-e25443/rackham/bin/CAT.sif docker://uppmax/comparative-annotation-toolkit:20190926-e25443

    


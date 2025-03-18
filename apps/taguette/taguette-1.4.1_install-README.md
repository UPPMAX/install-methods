taguette/1.4.1
========================

<https://www.taguette.org/>

Used under license:

<https://gitlab.com/remram44/taguette/-/blob/master/LICENSE.txt>

Structure creating script (makeroom_taguette_1.4.1.sh) moved to /sw/apps/taguette/makeroom_1.4.1.sh

LOG
---

Create a folder `taguette`, cd into it and run the following:  

    ```bash
    /proj/staff/jayant/install-methods/makeroom.sh "-f" "-c" "apps" "-t" "taguette" "-v" "1.4.1" "-d" "Free and open source qualitative research tool" "-L" "https://gitlab.com/remram44/taguette/-/blob/master/LICENSE.txt" "-w" "https://www.taguette.org/"
    source /scratch/TMPFILE_taguette_1.4.1
    ./makeroom_taguette_1.4.1.sh
    source /sw/apps/taguette/SOURCEME_taguette_1.4.1 && cd $TOOLDIR
    source /sw/apps/taguette/SOURCEME_taguette_1.4.1 && cd $SRCDIR

    #apptainer build taguette.sif taguette.def
    cp taguette.sif $PREFIX
    cd $PREFIX
    mkdir bin && cd bin
    ln -s ../taguette.sif taguette

    /sw/apps/taguette/taguette-1.4.1_post-install.sh 
    ```
taguette.def

    ```bash
    Bootstrap: docker
    From: ubuntu:22.04

    %environment
    export LC_ALL=C

    %post
    export LC_ALL=C
    export DEBIAN_FRONTEND=noninteractive

    # Update package list and install dependencies
    # --no-install-recommends prevents systemd issues
    apt update && apt install -y --no-install-recommends \
        glibc-source \
        wget \
        libegl1 libopengl0 libxcb-cursor0 \
        python3 python3-pip \
        calibre


    python3 -m pip install --no-cache-dir taguette==1.4.1


    %runscript
    #!/bin/sh
    if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
        exec $SINGULARITY_NAME "$@"
    else
        echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
    fi
    ```
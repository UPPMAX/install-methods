shovill/1.1.0
========================

<https://github.com/tseemann/shovill>

Used under license:
GPL-3.0


Structure creating script (makeroom_shovill_1.1.0.sh) moved to /sw/bioinfo/shovill/makeroom_1.1.0.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "shovill" "-v" "1.1.0" "-w" "https://github.com/tseemann/shovill" "-l" "GPL-3.0" "-d" "Shovill is a pipeline which uses SPAdes at its core, but alters the steps before and after the primary assembly step to get similar results in less time. Shovill also supports other assemblers like SKESA, Velvet and Megahit, so you can take advantage of the pre- and post-processing the Shovill provides with those too." "-f"
    ./makeroom_shovill_1.1.0.sh

    # Check the definition of the container
    # singularity inspect -d $PREFIX/bin/shovill
    # https://github.com/pmitev/UPPMAX-Singularity/tree/main/shovill


Unicycler/0.5.0
========================

<https://github.com/rrwick/Unicycler>

Used under license:
GNU GPLv3


Structure creating script (makeroom_Unicycler_0.5.0.sh) moved to /sw/bioinfo/Unicycler/makeroom_0.5.0.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-t" "Unicycler" "-v" "0.5.0" "-c" "bioinfo" "-w" "https://github.com/rrwick/Unicycler" "-l" "GNU GPLv3" "-d" "Unicycler is an assembly pipeline for bacterial genomes. It can assemble Illumina-only read sets where it functions as a SPAdes-optimiser. It can also assembly long-read-only sets (PacBio or Nanopore) where it runs a miniasm+Racon pipeline. For the best possible assemblies, give it both Illumina reads and long reads, and it will conduct a short-read-first hybrid assembly." "-u" "rackham snowy bianca" "-f"
    ./makeroom_Unicycler_0.5.0.sh


This was installed with EasyBuild.  The mf file is an 'alias' mf file that sets up and loads the EasyBuild module directly.


On rackham:

    TOOL=Unicycler
    VERSION=0.5.0
    TOOLCHAIN=gompi-2021b
    cd /sw/EasyBuild/
    source source-me-for-EasyBuild-4.6.1-$CLUSTER
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb --dry-run

and build.

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb

Repeat for snowy.

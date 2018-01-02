svprops/20171020-ebf6762
========================

<https://github.com/dellytools/svprops>

LOG
---

The default installer linked to shared libraries that was in the source tree so
I used a static install version which was provided by the makefile. Also, the R
scripts needed the R_modules to be loaded and I added a hashbang line to them.

    mkdir -p /sw/apps/bioinfo/svprops/20171020-ebf6762
    cd /sw/apps/bioinfo/svprops/
    git clone --recursive https://github.com/dellytools/svprops.git
    cd svprops/
    module load gcc/6.3.0 xz/5.2.2 bzip2/1.0.6
    make STATIC=1
    cp -av src/{sampleprops,svprops} ../20171020-ebf6762/milou/bin/

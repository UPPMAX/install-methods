vcfaid-20170616-f0732ae
========================

<https://github.com/tobiasrausch/vcfaid>

LOG
---

The default installer linked to shared libraries that was in the source tree so
I used a static install version which was provided by the makefile. 

    mkdir -p /sw/apps/bioinfo/VCFaid/20170616-f0732ae
    cd /sw/apps/bioinfo/VCFaid/
    git clone --recursive https://github.com/tobiasrausch/vcfaid.git
    cd VCFaid/src/vcfaid/src/
    make all STATIC=1
    cp -av {gq,gqToMissing,subset} ../../../20170616-f0732ae/bin


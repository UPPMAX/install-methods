LRSDAY/1.5.0
========================

<https://github.com/yjx1217/LRSDAY>

Used under license:
MIT

Structure creating script (makeroom_LRSDAY_1.5.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/LRSDAY/makeroom_1.5.0.sh

LOG
---

    TOOL=LRSDAY
    VERSION=1.5.0
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_LRSDAY_1.5.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

    rmdir $PREFIX
    mv /sw/bioinfo/LRSDAY/1.5.0/src/LRSDAY-v1.5.0  $PREFIX
    cd $PREFIX

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load python/2.7.15
    module load python3/3.6.8
    module load java/sun_jdk1.8.0_151
    module load cmake/3.13.2
    module load gcc/8.3.0
    module load bioinfo-tools
    module load BioPerl/1.7.2_Perl5.26.2

Now check whether all perl dependencies are available; not checking versions.
There will be an error about using Inline::C directly but no big deal there.

    for D in $( cat perldeps | cut -f1 -d@) ; do perl -M$D -e 1 ; done

    ./install_dependencies.sh

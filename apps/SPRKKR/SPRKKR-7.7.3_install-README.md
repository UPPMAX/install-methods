SPRKKR/7.7.3
========================

<https://www.ebert.cup.uni-muenchen.de/index.php/en/software-en/13-sprkkr>

Used under license:
GPL license

Structure creating script (makeroom_SPRKKR_7.7.3.sh) moved to /sw/apps/SPRKKR/makeroom_7.7.3.sh

LOG
---

    TOOL=SPRKKR
    VERSION=7.7.3
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/SPRKKR/7.7.3/src
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "SPRKKR" -v "7.7.3" -w "https://www.ebert.cup.uni-muenchen.de/index.php/en/software-en/13-sprkkr" -c "apps" -l "GPL license" -d "SPRKKR is a spin polarized relativistic Korringa-Kohn-Rostoker \(SPR-KKR\) code for calculating solid state properties" -u "rackham snowy" -x "INSTALL"
    ./makeroom_SPRKKR_7.7.3.sh
    cd /sw/apps/SPRKKR/7.7.3/src
#    wget http://
    cd /sw/apps/SPRKKR/$CLUSTER
    module load intel/19.5
    module load intelmpi/19.5
    vi make.inc
    make all
    make allmpi
# cleaning up
	rm *f *o *mod


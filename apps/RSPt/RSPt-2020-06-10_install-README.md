RSPt/2020-06-10
========================

<https://www.physics.uu.se/research/materials-theory/ongoing-research/code-development/rspt-main/>

Used under license:
GPL2 license

Structure creating script (makeroom_RSPt_2020-06-10.sh) moved to /sw/apps/RSPt/makeroom_2020-06-10.sh

LOG
---

    TOOL=RSPt
    VERSION=2020-06-10
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/RSPt/2020-06-10/src
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -f" -t "RSPt" -v "2020-06-10" -w "https://www.physics.uu.se/research/materials-theory/ongoing-research/code-development/rspt-main/" -c "apps" -l "GPL2 license" -d "RSPt is a code for electronic structure calculations based on the Full-Potential Linear Muffin-Tin Orbital \(FP-LMTO\) method." -u "rackham "snowy" -x "INSTALL"
    ./makeroom_RSPt_2020-06-10.sh


# Installations on Rackham and Snowy:
	module load intel/19.5 intelmpi/19.5
	cd /sw/apps/RSPt/2020-06-10/$CLUSTER/
	vi RSPTmake.inc
	make pristine
	make all


# edit the module file
#	vi /sw/apps/$TOOL/mf/$VERSION
	vi /sw/apps/RSPt/mf/2020-06-10
	cp -p /sw/apps/RSPt/mf/2020-06-10 /sw/mf/common/applications/RSPt/.
	cd /sw/apps/RSPt/
	./RSPt-2020-06-10_post-install.sh


RSPt/2021-10-04
========================

<https://www.physics.uu.se/research/materials-theory/ongoing-research/code-development/rspt-main/>

Used under license:
GPL2 license


Structure creating script (makeroom_RSPt_2021-10-04.sh) moved to /sw/apps/RSPt/makeroom_2021-10-04.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -f" -t "RSPt" -v "2021-10-04" -c "apps" -w "https://www.physics.uu.se/research/materials-theory/ongoing-research/code-development/rspt-main/" -l "GPL2 license" -d "RSPt is a code for electronic structure calculations based on the Full-Potential Linear Muffin-Tin Orbital \\(FP-LMTO\\) method." -u "rackham snowy" -x "INSTALL"
    ./makeroom_RSPt_2021-10-04.sh

    TOOL=RSPt
    VERSION=2021-10-04
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/RSPt/$VERSION/src


# Installations on Rackham and Snowy:
	module load intel/20.4 intelmpi/20.4
	cd /sw/apps/RSPt/$VERSION/$CLUSTER/
	vi RSPTmake.inc
	make pristine
	make all


# edit the module file
	vi /sw/apps/$TOOL/mf/$VERSION
	vi /sw/apps/RSPt/mf/$VERSION
	cp -p /sw/apps/RSPt/mf/$VERSION /sw/mf/common/applications/RSPt/.
	cd /sw/apps/RSPt/
	./RSPt-$VERSION_post-install.sh


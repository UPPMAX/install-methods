freesurfer/7.4.1
========================

<https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferWiki>

Used under license:
Custom open-source
<https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSoftwareLicense>

Structure creating script (makeroom_freesurfer_7.4.1.sh) moved to /sw/apps/freesurfer/makeroom_7.4.1.sh

LOG
---

    TOOL=freesurfer
    VERSION=7.4.1
    makeroom.sh -t $TOOL -v $VERSION -c apps -w https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferWiki -l "Custom open-source" -L https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSoftwareLicense -d "A software package for the analysis and visualization of structural and functional neuroimaging data from cross-sectional or longitudinal studies." -f

    ./makeroom_freesurfer_7.4.1.sh
    source /sw/apps/freesurfer/SOURCEME_freesurfer_7.4.1 && cd $SRCDIR
    wget https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.4.1/freesurfer-linux-centos7_x86_64-7.4.1.tar.gz
    tar xzvf freesurfer-linux-centos7_x86_64-7.4.1.tar.gz
    rmdir $PREFIX
    rm freesurfer-linux-centos7_x86_64-7.4.1.tar.gz
    mv freesurfer $PREFIX
    cd $PREFIX
    export FREESURFER_HOME=$(pwd)
    source $FREESURFER_HOME/SetUpFreeSurfer.sh
License file
    cd $TOOLDIR
    cp 6.0.0/rackham/license.txt 7.4.1/rackham/


A license file is required. If you can't use the one located at /sw/apps/freesurfer/6.0.0/rackham/license.txt, you can get a new one at http://surfer.nmr.mgh.harvard.edu/registration.html

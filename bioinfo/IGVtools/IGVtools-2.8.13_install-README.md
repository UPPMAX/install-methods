IGVtools/2.8.13
===============

<http://software.broadinstitute.org/software/igv/home>

Used under license:
MIT

Structure creating script (makeroom_IGVtools_2.8.13.sh) moved to /sw/bioinfo/IGVtools/makeroom_2.8.13.sh


We copy the IGV directory over from IGV/2.8.13 and remove the IGV-only scripts.  We also remove the igvtools scripts from IGV. scripts and libraries over from

LOG
---

    TOOL=IGVtools
    VERSION=2.8.13
    cd /sw/bioinfo/IGVtools/
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w http://software.broadinstitute.org/software/igv/home -d "tools for preparing data for IGV display"
    ./makeroom_IGVtools_2.8.13.sh 
    source SOURCEME_IGVtools_2.8.13 
    cd $VERSION
    cd rackham/
    cp -av /sw/bioinfo/IGV/2.8.13/rackham/* .

Remove the igv scripts.

    rm -f igv_* igv-*
    rm -f igv.bat igv.command igv.sh

Set memory to -Xmx6g in the existing scripts.

    vi igvtools igvtools_gui igvtools_gui_hidpi 

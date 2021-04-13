MELT/2.2.2
========================

<https://melt.igs.umaryland.edu/index.php>

Used under license:
Misc non-commercial
<>

Structure creating script (makeroom_MELT_2.2.2.sh) moved to /sw/bioinfo/MELT/makeroom_2.2.2.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "MELT" -v "2.2.2" -w "https://melt.igs.umaryland.edu/index.php" -c "bioinfo" -l "Misc non-commercial" -d "The Mobile Element Locator Tool \(MELT\) is a software package\, written in Java\, that discovers\, annotates\, and genotypes non-reference Mobile Element Insertions \(MEIs\) in Illumina DNA paired-end whole genome sequencing \(WGS\) data.\" -x "INSTALL" -f
    ./makeroom_MELT_2.2.2.sh
    cd /sw/apps/bioinfo/MELT
    source SOURCEME_MELT_2.2.2
    cd $SRCDIR

#Because of licence, must agree, so download MELT tarball to personal computer then to UPPMAX.

#upload     MELT${VERSION}.tar.gz .
    tar xvzf MELTv${VERSION}.tar.gz 
    mv MELTv${VERSION}/* $PREFIX
    rmdir MELTv${VERSION} 
    


#In the mf file, load a java 8 and bowtie2.
# runs with:
    java -jar $MELT_ROOT/MELT.jar ...

quast/5.0.2
========================

<http://quast.sourceforge.net/>

Used under license:

<>

Structure creating script (makeroom_quast_5.0.2.sh) moved to /sw/bioinfo/quast/makeroom_5.0.2.sh

LOG
---

    TOOL=quast
    VERSION=5.0.2
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/quast/5.0.2/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "quast" -v "5.0.2" -c "bioinfo" -w "http://quast.sourceforge.net/" -d "Quality Assessment Tool for Genome Assemblies" -s "misc" -f
    ./makeroom_quast_5.0.2.sh
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install --user quast==5.0.2
    

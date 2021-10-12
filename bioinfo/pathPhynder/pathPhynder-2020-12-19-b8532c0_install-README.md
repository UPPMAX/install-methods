pathPhynder/2020-12-19-b8532c0
========================

<https://github.com/ruidlpm/pathPhynder>

Used under license:
MIT


Structure creating script (makeroom_pathPhynder_2020-12-19-b8532c0.sh) moved to /sw/bioinfo/pathPhynder/makeroom_2020-12-19-b8532c0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -c "bioinfo" -t "pathPhynder" -v "2020-12-19-b8532c0" -s "phylogeny" -l "MIT" -w "https://github.com/ruidlpm/pathPhynder" -d "A workflow for ancient DNA placement into reference phylogenies"
    ./makeroom_pathPhynder_2020-12-19-b8532c0.sh
    cd $SRCDIR

    module load bioinfo-tools
    module load samtools
    module load R_packages/4.0.4
    module load samtools/1.12

    git clone https://github.com/ruidlpm/pathPhynder.git
    #cp -r pathPhynder/ ../rackham/

    rmdir $PREFIX # removes /sw/bioinfo/pathPhynder/.../rackham directory
    mv pathPhynder $PREFIX # creates new .../rackham directory from git clone'd directory

create the following symlink 
    cd $PREFIX
    ln -s pathPhynder.R pathPhynder

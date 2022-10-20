pathPhynder/1.a-20221011-a407a97
================================

<https://github.com/douglasgscofield/pathPhynder>

Forked from original at

<https://github.com/ruidlpm/pathPhynder>

Used under license:
MIT


Path determination is a bit clunky, as a result so is installation, so I forked
the repository and updated the scripts to use this.path::this.dir() and
simplified the installation.  The commit tag refers to the top commit of my
forked repository.  You can see the fork for the specific updates, and the pull
request for them is <https://github.com/ruidlpm/pathPhynder/pull/4>.



Structure creating script (makeroom_pathPhynder_1.a-20221011-a407a97.sh) moved to /sw/bioinfo/pathPhynder/makeroom_1.a-20221011-a407a97.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-t" "pathPhynder" "-v" "1.a-20221011-a407a97" "-w" "https://github.com/douglasgscofield/pathPhynder" "-d" "workflow for ancient DNA placement into reference phylogenies" "-l" "MIT"
    ./makeroom_pathPhynder_1.a-20221011-a407a97.sh

    module load R_packages/4.1.1
    module load samtools/1.14
    module load python/3.9.5
    module load git/2.34.1

    source /sw/bioinfo/pathPhynder/SOURCEME_pathPhynder_1.a-20221011-a407a97 && cd $SRCDIR
    git clone https://github.com/douglasgscofield/pathPhynder
    cd pathPhynder
    git reset --hard a407a97
    cd ..
    rmdir $PREFIX
    mv pathPhynder $PREFIX

Add the load of phynder to the mf, and the definition of `PATHPHYNDER_DATA`.

Use a .version file since the most recent version is not alphanumerically the latest.

    #%Module1.0###########################################################
    ##
    ## version file for pathPhynder
    ##
    set ModulesVersion      "1.a-20221011-a407a97"

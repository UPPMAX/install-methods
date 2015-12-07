Trans-ABySS 1.5.3
=================

    cd /sw/apps/bioinfo/
    mkdir transabyss
    cd transabyss
    mkdir 1.5.3 mf
    cd 1.5.3/
    mkdir milou src
    ln -s ./milou halvan
    ln -s ./milou nestor

Set up directory for later Python packages.

    cd milou
    mkdir python_packages
    cd python_packages
    PP=$PWD

    cd ../src
    wget http://www.bcgsc.ca/platform/bioinfo/software/trans-abyss/releases/1.5.3/transabyss-1.5.3.zip
    unzip transabyss-1.5.3.zip 
    cd transabyss-1.5.3/

Install python-igraph package.  Everything else we already have.  Note this
requires the PP env var we set above.

    module load gcc/4.9.2
    module load python/2.7.6

    PYTHONUSERBASE=$PP pip install --user python-igraph

Once that is installed, we simply need to copy everything from the transabyss
directory to the install directory.

    cp -a * ../../milou/

A lot of prerequisites, including ABySS 1.5.x which we did not have, must be loaded in the mf file.

    module load python/2.7.6
    module load biopython/1.64
    module load pysam/0.8.3
    module load samtools/0.1.19
    module load gmap-gsnap/2015-09-28
    module load bowtie2/2.2.6
    module load abyss/1.5.2
    module load blat/35

Test it.

    bash sample_dataset/assemble.sh 
    bash sample_dataset/analyze.sh


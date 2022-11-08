FusionCatcher/1.33
==================

<https://github.com/ndaniel/fusioncatcher>

Used under license:
GPLv3


Structure creating script (makeroom_FusionCatcher_1.33.sh) moved to /sw/bioinfo/FusionCatcher/makeroom_1.33.sh

At first I put in quite a bit of time installing versions of tools we already
have that are required by FusionCatcher/1.10.  This led to some good updates
but it couldnt find everything, and some of the version pickiness didn't make
sense, for example it wanted two distinct versions of bowtie, which our module
system won't allow.  So, I loaded `python/2.7.15` and `biopython/1.73`
beforehand and let the install process take care of the rest.


LOG
---

    makeroom.sh -f -t FusionCatcher -v 1.33 -w https://github.com/ndaniel/fusioncatcher -d "Finder of somatic fusion-genes in RNA-seq data" -l GPLv3
    ./makeroom_FusionCatcher_1.33.sh 
    source /sw/bioinfo/FusionCatcher/SOURCEME_FusionCatcher_1.33 && cd $PREFIX
    wget http://sf.net/projects/fusioncatcher/files/bootstrap.py -O bootstrap.py 
    module load python/2.7.15 
    module load gcc/9.3.0
    module load cmake/3.17.3
    module load bzip2/1.0.6
    module load zlib/1.2.11
    module load libcurl/7.45.0
    module load gnuparallel/20180822
    module load bioinfo-tools
    module load biopython/1.73

    python bootstrap.py --prefix=$PREFIX --download -y


Susioncatcher is missing when downloading from sf.net. Add symbolic link to fusioncatcher.py


    cd $PREFIX/fusioncatcher/bin
    ln -s fusioncatcher.py fusioncatcher


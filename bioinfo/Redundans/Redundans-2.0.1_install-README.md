Redundans/2.0.1
===============

<https://github.com/Gabaldonlab/redundans>

Used under license:
GPL v3


Structure creating script (makeroom_Redundans_2.0.1.sh) moved to /sw/bioinfo/Redundans/makeroom_2.0.1.sh

LOG
---

We're going to let it provide its own executables.

We're also going to install R packages for it separately from R_packages, and install a python for it in a venv.


    makeroom.sh "-f" "-t" "Redundans" "-v" "2.0.1" "-w" "https://github.com/Gabaldonlab/redundans" "-l" "GPL v3" "-d" "Redundans is a pipeline that assists an assembly of heterozygous/polymorphic genomes" "-k" "python,bioinformatics,pipeline,genomics,assembly,docker-image,polymorphic,gap-closing,fasta,scaffolding,assembled-contigs,genome-assembly,paired-end,contigs,heterozygous,mate-pairs"
    ./makeroom_Redundans_2.0.1.sh

    source /sw/bioinfo/Redundans/SOURCEME_Redundans_2.0.1
    cd $SRCDIR

Loading R/4.3.1 will load zlib, bzip2, and gcc.

    ml python/3.10.8
    ml R/4.3.1
    ml git/2.34.1

    git clone --recursive https://github.com/Gabaldonlab/redundans.git

Install R packages.

    echo $PREFIX
    export R_LIBS_USER=$PREFIX/R-4.3.1
    mkdir $R_LIBS_USER
    which R
    R --no-init-file

Then within R:

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r, timeout = 300)
    install.packages(c('ggplot2','scales','argparser'), update=FALSE)
    q()

Create python venv. Make sure python comes from venv.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    module unload python
    which python

Place redundans repository within PREFIX, compile everything.

    cd $SRCDIR
    mv redundans $PREFIX/

    cd $PREFIX/redundans

    bin/.compile.sh

Check python scripts. Though top-level script redundans.py is
under redundans/, a symlink is found under bin/ so we work on
that script from within bin/.

    cd bin
    grep import *.py | cut -f2- -d: | sed -e 's/^\s\+//' | sort -u

There don't seem to be any odd packages required. So just change #! lines.

    sed -i '1i#!'"$(which python3)" *.py 

Any other scripts we should change?

    find . -name '*.py'

Everything below . all seem to be utility scripts that probably are not used by this pipeline.

Run a couple of tests.

    deactivate
    module purge
    module load R/4.3.1
    cd $PREFIX/redundans
    export PATH=$PWD:$PATH

    redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1

    redundans.py -v -i test/*_?.fq.gz -f test/contigs.fa --minimap2reduce -o test/run2

    redundans.py -v -i test/*_?.fq.gz -o test/run.denovo


Add `$version/$Cluster/redundans` to `PATH` in the mf. We need to load R/4.3.1 and that's it.


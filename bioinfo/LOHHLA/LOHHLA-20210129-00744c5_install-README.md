LOHHLA/20210129-00744c5
========================

<https://bitbucket.org/mcgranahanlab/lohhla/src/master/>

Used under license:



Structure creating script (makeroom_LOHHLA_20210129-00744c5.sh) moved to /sw/bioinfo/LOHHLA/makeroom_20210129-00744c5.sh

LOG
---

    makeroom.sh "-t" "LOHHLA" "-v" "20210129-00744c5" "-w" "https://bitbucket.org/mcgranahanlab/lohhla/src/master/" "-d" "LOHHLA, Loss Of Heterozygosity in Human Leukocyte Antigen, a computational tool to evaluate HLA loss using next-generation sequencing data" "-s" "annotation" "-c" "bioinfo"
    ./makeroom_LOHHLA_20210129-00744c5.sh 
    source /sw/bioinfo/LOHHLA/SOURCEME_LOHHLA_20210129-00744c5
    cd $SRCDIR
    ml git
    git clone --recursive https://bitbucket.org/mcgranahanlab/lohhla.git
    cd lohhla/
    git reset --hard 00744c5
    ml -git
    chmod -x README.md 

Edit `LOHHLAscript.R` to directly point to Novoalign/3.09.05 path and picard/1.118 path and LOHHLA_ROOT for the hla.data and example sequence files.

    vi LOHHLAscript.R

Move contents to $PREFIX.

    cp -av * $PREFIX/

We need to load jellyfish/2.2.6, samtools/1.4, BEDTools/2.29.2, R/3.6.1,
Novoalign/3.09.05. For jellyfish, samtools and R these are older versions.  We
use jars from picard/1.118, but do not load that module as it would switch java
versions on us. Using jellyfish/2.2.6 required me to fix up the RPATH for the
executable and shared library in this module.

We only load R/3.6.1, here we install the packages we need just for this module.
This automatically installs for the older BioConductor version 3.10.

    cd $PREFIX
    module load R/3.6.1
    mkdir R-3.6.1
    export R_LIBS_USER=$PWD/R-3.6.1

The script also needs `optparse`, which is not listed in the requirements, so
verify what we need with a grep.

    grep -P '(require|library)' LOHHLAscript.R 

We need `c('optparse','seqinr','Biostrings','beeswarm','zoo','Rsamtools')`.

    R --no-init-file

Within R:

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r, timeout = 300)
    if (!requireNamespace("BiocManager"))
        install.packages("BiocManager")
    BiocManager::install(update=FALSE)
    options(BiocManager.check_repositories = FALSE)  # make BioConductor shut up about alternate repositories
    BiocManager::install(c('optparse','seqinr','Biostrings','beeswarm','zoo','Rsamtools'), update=FALSE, Ncpus=8)
    q()

Within the mf file, prepend `$modroot/R-3.6.1` to `R_LIBS_SITE`, and load the above four modules.

The example seems to work, but does not match perfectly. I switched back to the
older R and samtools, and this remains.  Ah, well.

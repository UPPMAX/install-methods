LOHHLA-slagtermaarten/20200219-b38c477
=====================================

<https://github.com/slagtermaarten/LOHHLA>

Used under license:



Structure creating script (makeroom_LOHHLA-slagermaarten_20200219-b38c477.sh) moved to /sw/bioinfo/LOHHLA-slagermaarten/makeroom_20200219-b38c477.sh

This installs a fork of the original LOHHLA tool (available in our LOHHLA
module) that handles GRCh38 and hg19.  We include several changes for that
module here, but don't try to port forward whatever other changes might be
included in the 20210129-00744c5 version of that module to this module, we just
leave it as is.  Slager Maarten has made other changes to the format of the
source that make this more difficult.

LOG
---

    makeroom.sh -f -t LOHHLA-slagtermaarten -v 20200219-b38c477 -w https://github.com/slagtermaarten/LOHHLA -d "A fork of LOHHLA to provide additional functionality, including GRCh38 and single-ended read support. See its website for more." -s annotation -c bioinfo
    ./makeroom_LOHHLA-slagtermaarten_20200219-b38c477.sh 
    source /sw/bioinfo/LOHHLA-slagtermaarten/SOURCEME_LOHHLA-slagtermaarten_20200219-b38c477
    cd $SRCDIR
    ml git/2.44.0
    git clone --recursive https://github.com/slagtermaarten/LOHHLA
    cd LOHHLA
    git reset --hard b38c477
    chmod -x README.md
    ml -git

Find the differences with the LOHHLA module.

    mydiff -y /sw/bioinfo/LOHHLA/20210129-00744c5/src/lohhla/LOHHLAscript.R LOHHLAscript.R 

Clearly source reworking, moving several things into a separate functions.R
file.  The changes to use this follow directly from the LOHHLA module.  We add
LOHHLA.root, novoalign.root, and picard.root.  A few new options added, most
notably `--LOHHLA_loc` which specifies the location of the functions.R file.
This we set to LOHHLA.root.

    vi LOHHLAscript.R

Move contents to $PREFIX.

    cp -av * $PREFIX/

In the mf file we need to load 

    jellyfish/2.2.6
    samtools/1.4
    BEDTools/2.29.2
    R/3.6.1
    Novoalign/3.09.05

For jellyfish, samtools and R these are older versions.  We use jars from
picard/1.118, but **we do not load that module** as it would switch java
versions. Using jellyfish/2.2.6 required me to fix up the RPATH for the
executable and shared library in this module.

We only load R/3.6.1, here we install the packages we need just for this module.
This automatically installs for the older BioConductor version 3.10.

    cd $PREFIX
    module load R/3.6.1
    mkdir R-3.6.1
    export R_LIBS_USER=$PWD/R-3.6.1

The script needs `optparse`, which is not listed in the requirements, so verify
what we need with a grep.

    grep -P '(require|library)' LOHHLAscript.R functions.R

We see we need optparse, but in functions.R we see the use of `require()`
within a loop suggesting more to be found there.  Indeed, examining that
revealed a longer list including glue, magrittr, and data.table.


The full set of R packages we need is `c('optparse', 'seqinr', 'Biostrings', 'beeswarm', 'zoo', 'Rsamtools', 'dplyr', 'naturalsort', 'glue', 'magrittr', 'tools', 'purrr', 'data.table')`.

    R --no-init-file

Within R:

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r, timeout = 300)
    if (!requireNamespace("BiocManager"))
        install.packages("BiocManager")
    BiocManager::install(update=FALSE)
    options(BiocManager.check_repositories = FALSE)  # make BioConductor shut up about alternate repositories
    BiocManager::install(c('optparse', 'seqinr', 'Biostrings', 'beeswarm', 'zoo', 'Rsamtools', 'dplyr', 'naturalsort', 'glue', 'magrittr', 'tools', 'purrr', 'data.table'), update=FALSE, Ncpus=8)
    q()

`tools` did not get installed, not a surprise.

Within the mf file, prepend `$modroot/R-3.6.1` to `R_LIBS_SITE`, and load the above four modules.

Not going to run the example for this install.


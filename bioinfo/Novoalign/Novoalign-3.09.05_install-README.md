Novoalign/3.09.05
=================

<https://www.novocraft.com/products/novoalign/>

Used under license:
Free for academics under restricted conditions
<https://www.novocraft.com/support/download/>

Structure creating script (makeroom_Novoalign_3.09.05.sh) moved to /sw/bioinfo/Novoalign/makeroom_3.09.05.sh

LOG
---

We replace `PREFIX` with  the unpacked directory and adjust `#!` lines of
included R and perl scripts.  We also call attention to PDF documentation in
the module help, and that an R_packages module needs to be loaded to use the R
scripts.


    makeroom.sh -t Novoalign -v 3.09.05 -w https://www.novocraft.com/products/novoalign/ -l "Free for academics under restricted conditions" -L https://www.novocraft.com/support/download/ -d "mapping of short reads onto a reference genome from Illumina, Ion Torrent, and 454 NGS platforms" -c bioinfo -s alignment
    ./makeroom_Novoalign_3.09.05.sh 
    source /sw/bioinfo/Novoalign/SOURCEME_Novoalign_3.09.05
    cd $SRCDIR

Download tarball `novocraftV3.09.05.Linux3.10.0.tar.gz` to local computer and rsync here.

    tar xf novocraftV3.09.05.Linux3.10.0.tar.gz 

    rmdir $PREFIX
    mv novocraft $PREFIX

Now adjust the `#!` lines.

    cd $PREFIX
    head -n 1 *.R *.pl
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl
    sed -i 's,^#!/usr/bin/Rscript.*$,#!/usr/bin/env Rscript,' *.R
    head -n 1 *.R *.pl

Wrap it up.

    cd $TOOLDIR
    ./Novoalign-3.09.05_post-install.sh 



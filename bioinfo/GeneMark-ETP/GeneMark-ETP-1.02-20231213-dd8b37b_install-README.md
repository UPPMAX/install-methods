GeneMark-ETP/1.02-20231213-dd8b37b
========================

<http://>

Used under license:
Creative Commons Attribution NonCommercial ShareAlike 4.0 License
<https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/License-Creative-Commons-Attribution-NonCommercial-ShareAlike-4.0-International.txt>

Structure creating script (makeroom_GeneMark-ETP_1.02-20231213-dd8b37b.sh) moved to /sw/bioinfo/GeneMark-ETP/makeroom_1.02-20231213-dd8b37b.sh

LOG
---

    makeroom.sh -f -c bioinfo -s annotation -t GeneMark-ETP -v 1.02-20231213-dd8b37b -l "Creative Commons Attribution NonCommercial ShareAlike 4.0 License" -L https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/License-Creative-Commons-Attribution-NonCommercial-ShareAlike-4.0-International.txt -d "Gene finding in eukaryotic genomes supported by transcriptome sequencing and protein homology"
    ./makeroom_GeneMark-ETP_1.02-20231213-dd8b37b.sh 
    source /sw/bioinfo/GeneMark-ETP/SOURCEME_GeneMark-ETP_1.02-20231213-dd8b37b
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/gatech-genemark/GeneMark-ETP
    cd GeneMark-ETP/
    git reset --hard dd8b37b
    ml -git

Check perl module availability. Copy the list needed from https://github.com/gatech-genemark/GeneMark-ETP/blob/main/INSTALL into `perl-module-list`:

    curl https://raw.githubusercontent.com/gatech-genemark/GeneMark-ETP/main/INSTALL | grep '^cpanm ' | sed -e 's/^cpanm /use /' -e 's/$/;/' > perl-module-list
    ml perl_modules/5.32.1
    cat perl-module-list | perl

You'll see the following warning:

    Warning, threads::shared has already been loaded.  To
    enable shared variables, 'use threads' must be called
    before threads::shared or any module that uses it.

But an error likely means we're missing one of these from perl_modules. Add it.

Now handle the tool tree.

    cd GeneMark-ETP/

GeneMark-ETP provides several statically linked tools in its `tools/`
subdirectory. We're going to use our modules instead. Modify its check-tools
script to verify using PATH after we've done the module loads.

    cd tools

    ml bioinfo-tools
    ml BEDTools/2.31.1
    ml HISAT2/2.2.1
    ml StringTie/2.2.1
    ml samtools/1.19
    ml gffread/0.12.7
    ml sratools/3.0.7
    ml diamond/2.1.9 

    sed -i 's,"\./,",' check_ETP_tools.pl
    ./check_ETP_tools.pl

Move the download directory to `PREFIX`.

    rmdir $PREFIX && mv GeneMark-ETP $PREFIX

Wrap up. Load required modules, there are several compared to what GeneMark used.

    cd $TOOLDIR/mf
    vi 1.02-20231213-dd8b37b
    cd $TOOLDIR
    ./GeneMark-ETP-1.02-20231213-dd8b37b_post-install.sh

Verify the installation.

    ml bioinfo-tools
    ml GeneMark-ETP/1.02-20231213-dd8b37b


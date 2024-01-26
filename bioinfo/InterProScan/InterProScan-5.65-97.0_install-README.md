InterProScan/5.65-97.0
========================

<https://www.ebi.ac.uk/interpro/download/InterProScan/>

Used under license:
Apache 2.0
<https://github.com/ebi-pf-team/interproscan?tab=Apache-2.0-1-ov-file#readme>

Structure creating script (makeroom_InterProScan_5.65-97.0.sh) moved to /sw/bioinfo/InterProScan/makeroom_5.65-97.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-t" "InterProScan" "-v" "5.65-97.0" "-s" "annotation" "-d" "InterPro provides functional analysis of proteins by classifying them into families and predicting domains and important sites." "-w" "https://www.ebi.ac.uk/interpro/download/InterProScan/" "-f" "-l" "Apache 2.0" "-L" "https://github.com/ebi-pf-team/interproscan?tab=Apache-2.0-1-ov-file#readme"
    ./makeroom_InterProScan_5.65-97.0.sh
InterProScan/5.62-94.0
========================

<http://www.ebi.ac.uk/interpro>

Used under license:



Structure creating script (makeroom_InterProScan_5.62-94.0.sh) moved to /sw/bioinfo/InterProScan/makeroom_5.62-94.0.sh

LOG
---

    makeroom.sh "-t" "InterProScan" "-v" "5.62-94.0" "-s" "annotation" "-d" "InterPro provides functional analysis of proteins by classifying them into families and predicting domains and important sites." "-w" "http://www.ebi.ac.uk/interpro" "-f"
    ./makeroom_InterProScan_5.62-94.0.sh

    source /sw/bioinfo/InterProScan/SOURCEME_InterProScan_5.62-94.0 && cd $SRCDIR


    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz.md5
    md5sum -c interproscan-${VERSION}-64-bit.tar.gz.md5
    tar xzf interproscan-${VERSION}-64-bit.tar.gz
    mv interproscan-5.62-94-0 $PREFIX


Java, Python 3 and Perl 5
-------------------------

Following
<https://interproscan-docs.readthedocs.io/en/latest/UserDocs.html#installation-requirements>
Python 3 must be available as well as any Perl 5, and Oracle's JDK/JRE 11 or
higher, with `$JAVA_HOME` holding the location of the JVM and `$JAVA_HOME/bin`
in `PATH`.  So, we should load one of the Java 8 modules, since both these will
be true after that module load.  In the mf file, we'll add: '

    module load java/OpenJDK_11.0.2
    module load python/3.8.7

    ...


Activating separately licenced analyses
---------------------------------------

There are several tools not distributed with InterProScan because they have
several licences, see
<https://github.com/ebi-pf-team/interproscan/wiki/ActivatingLicensedAnalyses>.
We make links for tools that are not distributed with InterProScan but we have
locally.

We also do the following module loads, though these are not required to run the
tool because of symlinks added below.

    module load bioinfo-tools
    module load Phobius/1.01
    module load SignalP/4.1f
    module load tmhmm/2.0c

Phobius 1.01 (note module name is capitalised):

    cd $PREFIX/bin/phobius/1.01/
    ln -s /sw/apps/bioinfo/Phobius/1.01/$CLUSTER/{phobius.pl,decodeanhmm,phobius.model,phobius.options} .

SignalP 4.1f:

    cd $PREFIX/bin/signalp/4.1/
    ln -s /sw/apps/bioinfo/SignalP/4.1f/$CLUSTER/{signalp,bin} .

TMHMM 2.0c:

    cd $PREFIX/bin/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/$CLUSTER/bin/decodeanhmm.Linux_x86_64 decodeanhmm
    cd $PREFIX/data/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/$CLUSTER/lib/TMHMM2.0.model TMHMM2.0c.model

The Prosite executables where linked to Ubuntu builds. Linking to the Centos7.9 builds made the trick!

    cd $PREFIX/bin/prosite
    ln -sf centos7.9/pfsearchV3 .
    ln -sf centos7.9/pfscanV3 .


changing #! lines of perl scripts

    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl


Afterwards, make sure it works.  It takes several seconds to get going.

    module load bioinfo-tools
    module load InterProScan/5.62-94.0
    interproscan.sh

And then, run the tests.  Because the module is loaded, it is important *not*
to use `./interproscan.sh ...`, but instead `interproscan.sh ...` so everything
is found via `PATH`.  These tests require a few minutes to complete.

    cd $CLUSTERDIR
    interproscan.sh -i test_proteins.fasta -f tsv
    interproscan.sh -i test_proteins.fasta -f tsv -dp

The first test runs full InterProScan, the second avoids the lookup service.
This will result in two files. 
The two versions are not identical in length, but the files are reproducible. Probably just some info output depending on how the tool was run is the reason. 

    -rw-rw-r--  1 bjornc sw  15534 Jun 27 11:44 test_proteins.fasta.tsv    # 1st command
    -rw-rw-r--  1 bjornc sw  15408 Jun 27 11:46 test_proteins.fasta_1.tsv  # 2nd command
    -rw-rw-r--  1 bjornc sw  15408 Jun 27 11:48 test_proteins.fasta_2.tsv  # 2nd command again
    -rw-rw-r--  1 bjornc sw  15534 Jun 27 11:54 test_proteins.fasta_3.tsv  # 1st command again







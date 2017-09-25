annovar annotation databases
============================

Pooling annotations that were previously in
`/sw/data/uppnex/annotations/annovar` and in module directories.


Originally, this was thought to be run on a cron job, and other plans.  The
annovar databases don't update frequently enough, and are quite huge, and their
internal update procedure won't refuse to update if something already exists
locally.  So, seems better to do this piecemeal.

This is not a blanket set of databases for all `annovar` versions.  Each
release of annovar includes its own gene list in files that are not versioned,
so it is not possible to make one global directory that all versions can point
to.  As a result, each version's `humandb/` directory contains some of its own
files, and points to others in this directory that are versioned and can be
used.  The contents of this directory are a subset of the databases available
for `annovar/2017.07.16`, for genome builds hg19 and hg38.  There are also some
older versions of some databases downloaded for `annovar/2016.05.11`, and also some
even earlier ones against build hg18 that were already in this directory.

The set of databases downloaded for hg19 and hg38 are:

    cd /sw/data/uppnex/annotations/annovar
    mkdir humandb
    for BUILD in hg19 hg38 ; do
        for DB in dbnsfp33a ljb26_all gme gnomad_exome gnomad_genome avsnp147 snp138 esp6500siv2_all cosmic70 snp138 gerp++elem cadd13 eigen gwava kaviar_20150923 hrcr1 1000g2015aug 1000g2015aug fathmm exac03
        do
            /sw/apps/bioinfo/annovar/2017.07.16/milou/annotate_variation.pl -v --downdb --webfrom annovar --buildver $BUILD $DB humandb/
        done
    done

To download a reference sequence for a new build, for example hg38, do

    /sw/apps/bioinfo/annovar/2017.07.16/milou/annotate_variation.pl -v --downdb seq --build hg38 humandb/hg38_seq/

We have reference sequences in `humandb/{hg18,hg19,hg38}_seq/`.


Previous README contents
------------------------

ANNOVAR has been installed on UPPMAX:

    module load bioinfo-tools annovar

This is a central repository for databases for ANNOVAR.


A script: "update_annovardb.sh" will search txt files which list databases to download
the list file names should be on the form "annovar_<download-dir>_<build>.txt. The script
will try to figure out the proper download dir and build from this filename and download
all the databases listed in the file to that dir/build.

The script uses the "annotate_variation.pl" script from the ANNOVAR release to perform the
actual download. Unfortunately, this seems to download the full database each time, even if
no updates have been made, and so uses a lot of unnecessary bandwidth.

Update strategy is cron job on a monthly basis.

TODO

* X	add ljb and complete genomics databases, but download links provided are dead
* O	setup as cron job on biologin


LOG

may 11, 2011
    
* Project started as a req. from Henrik Stranneheim, (Scilife Stockholm).
* Created project dir and first version of download lists/script

may 12, 2011

* added "seq" databases for both hg18 and hg19 as requested by Henrik Stranneheim as well
* as automatic running of mrna conversion script. See "update_annovardb.sh" for changes.


2014-11-14

* Note http://www.openbioinformatics.org/annovar/annovar_download.html
* Added 1000g2014aug EUR, snp138, snp138NonFlagged, esp6500si_ea


iGenomes/latest
=================

Illumina iGenomes resource, containing sequences and annotations and additional indices.

<https://support.illumina.com/sequencing/sequencing_software/igenome.html>


The install-methods repository's `data/iGenomes/old-files/bio-data/` directory
contains the contents of the https://github.com/UPPMAX/bio-data repository,
which is now deleted.


Downloads
---------

We download the AWS iGenomes resource curated by Phil Ewels:

<https://ewels.github.io/AWS-iGenomes>


Our local script is `AWS-iGenomes-download-all.sh`. This is designed to
incorporate the `BUILD_OPTS` array from Phil's `aws-igenomes.sh` script. Unlike
that script, this script downloads everything available for each genome build.
Check for a new version of this array in Phil's script and replace the one here
if there are changes.


    cd /sw/data/iGenomes
    tools/aws-iGenomes-download-all.sh



Additional features added
-------------------------

It is annoying that a complete copy of each genome is placed in the index, rather than a symlink.

Thus far, we add for each genome build:

  *  An index built by star/2.7.9a and placed in a new Sequence/STARIndex/version2.7.x/ subdirectory. The existing index within STARIndex/ is for versions of STAR older than 2.7.1a. This new index is built with an adjusted index size and with genes.gtf information where available. See iGenomes-STAR-2.7.x-index.sh for more.
  *  A BED-12 file for the genes built from the genes.gtf file. **Thus far this is a no-op** as genes.bed is already available next to genes.gtf for all builds.
  *  We do **not** build a bowtie1- or bowtie2-versioned Bismark bisulfite indices. Bowtie2-versioned indices are now provided for both GA and CT conversions and we'll stick with just those until there's a request.

These features are added by running

    cd /sw/data/iGenomes
    tools/build-iGenomes-additions.sh

Lock down everything. Write-protect even against me, since I already overwrote something I symlink'd to.

    chmod -R -w .


An additional genome added: Equus_caballus/NCBI/EquCab3.0
---------------------------------------------------------

I didn't provide everything, but several things.  See

    /sw/data/iGenomes/Equus_caballus/NCBI/EquCab3.0/EquCab3.0-notes.md

for more.

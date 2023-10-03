1000G_2504_high_coverage
========================

mirror of http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/

To save space, the data files in these subdirectories have been zeroed. The
files are present as 'bookmarks', with their original names, but are zero-sized.
They can be downloaded by adding the above URL to their relative path from this location.

## `working/20190425_NYGC_GATK/raw_calls_old/`

The subdirectories within this folder are:

    ACB/
    ASW/
    BEB/
    CDX/
    CEU/
    CHB/
    CHS/
    CLM/
    ESN/
    FIN/
    GBR/
    GIH/
    GWD/
    IBS/
    ITU/
    JPT/
    KHV/
    LWK/
    MSL/
    MXL/
    PEL/
    PJL/
    PUR/
    STU/
    TSI/
    YRI/


As an example, say you wish to download the `raw_calls_old` variants for sample
`ACB/Sample_HG02557/`, which are located within its `analysis/` subdirectory.
The full path at UPPMAX to these zeroed files is

    /sw/data/KGP/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/ACB/Sample_HG02557/analysis/HG02557.haplotypeCalls.er.raw.vcf.gz
    /sw/data/KGP/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/ACB/Sample_HG02557/analysis/HG02557.haplotypeCalls.er.raw.vcf.gz.tbi

The full URL to download a files (e.g., with `wget` or `curl -O`) is formed by
combining the above mirror URL with relative paths within the UPPMAX directory:

    http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/ACB/Sample_HG02557/analysis/HG02557.haplotypeCalls.er.raw.vcf.gz
    http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/ACB/Sample_HG02557/analysis/HG02557.haplotypeCalls.er.raw.vcf.gz.tbi


## `working/20190425_NYGC_GATK/raw_calls_updated/`

This folder has sample-specific calls, without regional subdivisions. The top
of the directory was (prior to zeroing):

    total 18066197356
    -rw-r----- 1 douglas kgp     521926 Nov  7  2021 20211105_NYGC_GATK_raw_calls_updated_manifest.txt
    -rw-r----- 1 douglas kgp 5126302714 Nov  7  2021 HG00096.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    3993515 Nov  7  2021 HG00096.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 5812660275 Nov  7  2021 HG00097.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    4071167 Nov  9  2021 HG00097.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 5180306956 Nov  7  2021 HG00099.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    4075234 Nov  8  2021 HG00099.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 6436995384 Nov  7  2021 HG00100.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    4073775 Nov  7  2021 HG00100.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 5618725935 Nov  7  2021 HG00101.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    3996922 Nov  7  2021 HG00101.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 6113825102 Nov  7  2021 HG00102.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    4072505 Nov  7  2021 HG00102.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 5416393554 Nov  7  2021 HG00103.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    3990784 Nov  7  2021 HG00103.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 6989801964 Nov  7  2021 HG00105.haplotypeCalls.er.raw.vcf.gz
    -rw-r----- 1 douglas kgp    3989225 Nov  7  2021 HG00105.haplotypeCalls.er.raw.vcf.gz.tbi
    -rw-r----- 1 douglas kgp 5569852147 Nov  8  2021 HG00106.haplotypeCalls.er.raw.vcf.gz
    ...

As an example, say you wish to download the `raw_calls_updated` variants for sample
`HG00105`.  The full path at UPPMAX to these zeroed files is

    /sw/data/KGP/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG00105.haplotypeCalls.er.raw.vcf.gz
    /sw/data/KGP/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG00105.haplotypeCalls.er.raw.vcf.gz.tbi

The full URL to download a files (e.g., with `wget` or `curl -O`) is formed by
combining the above mirror URL with relative paths within the UPPMAX directory:

    http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG00105.haplotypeCalls.er.raw.vcf.gz
    http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG00105.haplotypeCalls.er.raw.vcf.gz.tbi



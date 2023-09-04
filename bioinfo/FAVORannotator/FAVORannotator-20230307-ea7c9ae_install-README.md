FAVORannotator/20230307-ea7c9ae
========================

<https://github.com/zhouhufeng/FAVORannotator>

Used under license:
GPL v3


Structure creating script (makeroom_FAVORannotator_20230307-ea7c9ae.sh) moved to /sw/bioinfo/FAVORannotator/makeroom_20230307-ea7c9ae.sh

FAVOR essential and full databases are both available in FAVOR_data/1.0

LOG
---

We install the CSV versions of the scripts to use the CSV versions of the databases.


    makeroom.sh "-t" "FAVORannotator" "-v" "20230307-ea7c9ae" "-c" "bioinfo" "-s" "annotation" "-w" "https://github.com/zhouhufeng/FAVORannotator" "-l" "GPL v3" "-d" "an R program for performing functional annotation of any genetic study (e.g. Whole-Genome/Whole-Exome Sequencing/Genome-Wide Association Studies) using the FAVOR backend database to create an annotated Genomic Data Structure (aGDS) file by storing the genotype data (in VCF or GDS format) and their functional annotation data in an all-in-one file" "-k" "functional-annotation GDS FAVOR Genome-Data-Structure"
    ./makeroom_FAVORannotator_20230307-ea7c9ae.sh
    source /sw/bioinfo/FAVORannotator/SOURCEME_FAVORannotator_20230307-ea7c9ae
    cd $SRCDIR

    ml git/2.34.1        # to get the repository
    ml R_packages/4.2.1  # R infrastructure
    ml rust/1.67.0       # provides xsv, this is also loaded by below
    ml FAVOR_data/1.0    # defines FAVOR_DATA_ESSENTIALDB and FAVOR_DATA_FULLDB



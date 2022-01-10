#!/bin/bash

set -e

module load awscli/1.16.225

# using this closed issue for guidance https://github.com/ewels/AWS-iGenomes/issues/12
# the sync command is
# aws s3 --no-sign-request --region eu-west-1 sync s3://ngi-igenomes/igenomes/Escherichia_coli_K_12_DH10B/Ensembl/EB1/ $(pwd)/references/Escherichia_coli_K_12_DH10B/Ensembl/EB1/
#
# This does a true sync and does not re-download anything already available
#
# A new STAR index needs to be built for each.  The downloaded format is for STAR up to 2.7.1 

# copy the below definition of BUILD_OPTS in full from Phil Ewels' aws-igenomes.sh script at
#
#     https://github.com/ewels/AWS-iGenomes/blob/master/aws-igenomes.sh
#
# we will peel off the first ::-separated member of each and download the contents en masse

BUILD_OPTS=(
    "Arabidopsis_thaliana/Ensembl/TAIR10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Arabidopsis_thaliana/Ensembl/TAIR9::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Arabidopsis_thaliana/NCBI/build9.1::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Arabidopsis_thaliana/NCBI/TAIR10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bacillus_cereus_ATCC_10987/NCBI/2004-02-13::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Bacillus_subtilis_168/Ensembl/EB2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Bos_taurus/Ensembl/Btau_4.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/Ensembl/UMD3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Bos_taurus/NCBI/Btau_4.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/NCBI/Btau_4.6.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/NCBI/UMD_3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/NCBI/UMD_3.1.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/UCSC/bosTau4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/UCSC/bosTau6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/UCSC/bosTau7::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Bos_taurus/UCSC/bosTau8::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/Ensembl/WBcel215::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/Ensembl/WBcel235::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/Ensembl/WS210::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/Ensembl/WS220::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/NCBI/WS190::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/NCBI/WS195::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/UCSC/ce10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Caenorhabditis_elegans/UCSC/ce6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/Ensembl/BROADD2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/Ensembl/CanFam3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/NCBI/build2.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/NCBI/build3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/UCSC/canFam2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Canis_familiaris/UCSC/canFam3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/Ensembl/GRCz10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/Ensembl/Zv9::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/NCBI/GRCz10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/NCBI/Zv9::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/UCSC/danRer10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Danio_rerio/UCSC/danRer7::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/Ensembl/BDGP5::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/Ensembl/BDGP5.25::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/Ensembl/BDGP6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/NCBI/build4.1::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/NCBI/build5::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/NCBI/build5.3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/NCBI/build5.41::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/UCSC/dm3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Drosophila_melanogaster/UCSC/dm6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Enterobacteriophage_lambda/NCBI/1993-04-28::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Equus_caballus/Ensembl/EquCab2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Equus_caballus/NCBI/EquCab2.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Equus_caballus/UCSC/equCab2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Escherichia_coli_K_12_DH10B/Ensembl/EB1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Escherichia_coli_K_12_DH10B/NCBI/2008-03-17::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Escherichia_coli_K_12_MG1655/NCBI/2001-10-15::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Gallus_gallus/Ensembl/Galgal4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Gallus_gallus/Ensembl/WASHUC2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Gallus_gallus/NCBI/build2.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Gallus_gallus/NCBI/build3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Gallus_gallus/UCSC/galGal3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Gallus_gallus/UCSC/galGal4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Glycine_max/Ensembl/Gm01::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Homo_sapiens/Ensembl/GRCh37::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Homo_sapiens/GATK/b37::gatk"
    "Homo_sapiens/GATK/hg19::gatk"
    "Homo_sapiens/GATK/hg38::gatk"
    "Homo_sapiens/GATK/GRCh37::gatk"
    "Homo_sapiens/GATK/GRCh38::gatk"
    "Homo_sapiens/NCBI/build36.3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Homo_sapiens/NCBI/build37.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Homo_sapiens/NCBI/build37.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Homo_sapiens/NCBI/GRCh38::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Homo_sapiens/NCBI/GRCh38Decoy::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Homo_sapiens/UCSC/hg18::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Homo_sapiens/UCSC/hg19::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Homo_sapiens/UCSC/hg38::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Macaca_mulatta/Ensembl/Mmul_1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Mus_musculus/Ensembl/GRCm38::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Mus_musculus/Ensembl/NCBIM37::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Mus_musculus/NCBI/build37.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Mus_musculus/NCBI/build37.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Mus_musculus/NCBI/GRCm38::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Mus_musculus/UCSC/mm10::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Mus_musculus/UCSC/mm9::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Mycobacterium_tuberculosis_H37RV/Ensembl/H37Rv.EB1::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Mycobacterium_tuberculosis_H37RV/NCBI/2001-09-07::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Oryza_sativa_japonica/Ensembl/IRGSP-1.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Oryza_sativa_japonica/Ensembl/MSU6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/Ensembl/CHIMP2.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/Ensembl/CHIMP2.1.4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/NCBI/build2.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/NCBI/build3.1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/UCSC/panTro2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/UCSC/panTro3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Pan_troglodytes/UCSC/panTro4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "PhiX/Illumina/RTA::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "PhiX/NCBI/1993-04-28::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Pseudomonas_aeruginosa_PAO1/NCBI/2000-09-13::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Rattus_norvegicus/Ensembl/RGSC3.4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Rattus_norvegicus/Ensembl/Rnor_5.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Rattus_norvegicus/Ensembl/Rnor_6.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Rattus_norvegicus/NCBI/RGSC_v3.4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Rattus_norvegicus/NCBI/Rnor_5.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Rattus_norvegicus/NCBI/Rnor_6.0::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Rattus_norvegicus/UCSC/rn4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Rattus_norvegicus/UCSC/rn5::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Rattus_norvegicus/UCSC/rn6::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Rhodobacter_sphaeroides_2.4.1/NCBI/2005-10-07::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Saccharomyces_cerevisiae/Ensembl/EF2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Saccharomyces_cerevisiae/Ensembl/EF3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Saccharomyces_cerevisiae/Ensembl/EF4::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Saccharomyces_cerevisiae/Ensembl/R64-1-1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Saccharomyces_cerevisiae/NCBI/build2.1::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Saccharomyces_cerevisiae/NCBI/build3.1::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Saccharomyces_cerevisiae/UCSC/sacCer2::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Saccharomyces_cerevisiae/UCSC/sacCer3::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Schizosaccharomyces_pombe/Ensembl/EF1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Schizosaccharomyces_pombe/Ensembl/EF2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Sorangium_cellulosum_So_ce_56/NCBI/2007-11-27::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Sorghum_bicolor/Ensembl/Sbi1::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq"
    "Sus_scrofa/Ensembl/Sscrofa10.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Sus_scrofa/Ensembl/Sscrofa9::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna::variation"
    "Sus_scrofa/NCBI/Sscrofa10::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Sus_scrofa/NCBI/Sscrofa10.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Sus_scrofa/NCBI/Sscrofa9.2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Sus_scrofa/UCSC/susScr2::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Sus_scrofa/UCSC/susScr3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Zea_mays/Ensembl/AGPv2::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
    "Zea_mays/Ensembl/AGPv3::gtf::bed12::bismark::bowtie::bowtie2::bwa::star::fasta::chromosomes::abundantseq::smrna"
)

BUILDS=()

DEST=$(pwd)

for B in ${BUILD_OPTS[@]} ; do  # elements of array
    B=${B%%::*}
    BUILDS+=($B)
    echo "syncing $B ..."
    aws s3 --no-sign-request --region eu-west-1 sync s3://ngi-igenomes/igenomes/$B $DEST/$B
done

echo -e "\n\nsync'd to $DEST\n\n"
echo -e "${BUILDS[@]}"
echo


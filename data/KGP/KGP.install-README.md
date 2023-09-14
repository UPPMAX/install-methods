Checking for duplicated files in the KGP downloads
==================================================

Generated MD5 files for the major trees here

* 1000_genomes_project
* 1000G_2504_high_coverage
* central
* regional
* impute_haplotypes

Wrote a new script (based on an old one-off) to find duplicate files between the trees.
None of consequence found.  For the two large trees:


    processed line 1000: '1000G_2504_high_coverage/additional_698_related/data/ERR3989089/HG02880.final.cram.crai'
    processed line 2000: '1000G_2504_high_coverage/additional_698_related/data/ERR3989422/NA19677.final.cram.md5'
    processed line 3000: '1000G_2504_high_coverage/data/ERR3239572/NA18993.final.cram.crai'
    processed line 4000: '1000G_2504_high_coverage/data/ERR3239905/NA19669.final.cram.md5'
    processed line 5000: '1000G_2504_high_coverage/data/ERR3240239/HG00321.final.cram'
    processed line 6000: '1000G_2504_high_coverage/data/ERR3241956/HG01623.final.cram.crai'
    processed line 7000: '1000G_2504_high_coverage/data/ERR3242289/HG02409.final.cram.md5'
    processed line 8000: '1000G_2504_high_coverage/data/ERR3242623/HG03343.final.cram'
    processed line 9000: '1000G_2504_high_coverage/data/ERR3242956/HG03074.final.cram.crai'
    processed line 10000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/ACB/Sample_HG02508/analysis/HG02508.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 11000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/CHS/Sample_HG00559/analysis/HG00559.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 12000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/GIH/Sample_NA21089/analysis/NA21089.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 13000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/KHV/Sample_HG01863/analysis/HG01863.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 14000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_old/PUR/Sample_HG00551/analysis/HG00551.haplotypeCalls.er.raw.vcf.gz'
    processed line 15000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG00237.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 16000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG01389.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 17000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG02223.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 18000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG03131.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 19000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/HG04096.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 20000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/NA19004.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 21000: '1000G_2504_high_coverage/working/20190425_NYGC_GATK/raw_calls_updated/NA20803.haplotypeCalls.er.raw.vcf.gz.tbi'
    processed line 22000: '1000_genomes_project/data/ACB/HG02314/exome_alignment/HG02314.alt_bwamem_GRCh38DH.20150826.ACB.exome.cram'
    processed line 23000: '1000_genomes_project/data/BEB/HG03904/exome_alignment/HG03904.alt_bwamem_GRCh38DH.20150826.BEB.exome.cram.crai'
    processed line 24000: '1000_genomes_project/data/CEU/NA06984/exome_alignment/NA06984.alt_bwamem_GRCh38DH.20150826.CEU.exome.bam.bas'
    processed line 25000: '1000_genomes_project/data/CHB/NA18615/exome_alignment/NA18615.alt_bwamem_GRCh38DH.20150826.CHB.exome.cram'
    processed line 26000: '1000_genomes_project/data/CLM/HG01137/alignment/HG01137.alt_bwamem_GRCh38DH.20150718.CLM.low_coverage.cram.crai'
    processed line 27000: '1000_genomes_project/data/ESN/HG03295/exome_alignment/HG03295.alt_bwamem_GRCh38DH.20150826.ESN.exome.bam.bas'
    processed line 28000: '1000_genomes_project/data/GBR/HG00120/exome_alignment/HG00120.alt_bwamem_GRCh38DH.20150826.GBR.exome.cram'
    processed line 29000: '1000_genomes_project/data/GIH/NA21115/alignment/NA21115.alt_bwamem_GRCh38DH.20150718.GIH.low_coverage.cram.crai'
    processed line 30000: '1000_genomes_project/data/IBS/HG01537/alignment/HG01537.alt_bwamem_GRCh38DH.20150718.IBS.low_coverage.bam.bas'
    processed line 31000: '1000_genomes_project/data/ITU/HG04056/exome_alignment/HG04056.alt_bwamem_GRCh38DH.20150826.ITU.exome.cram'
    processed line 32000: '1000_genomes_project/data/KHV/HG01866/alignment/HG01866.alt_bwamem_GRCh38DH.20150718.KHV.low_coverage.cram.crai'
    processed line 33000: '1000_genomes_project/data/LWK/NA19454/exome_alignment/NA19454.alt_bwamem_GRCh38DH.20150826.LWK.exome.bam.bas'
    processed line 34000: '1000_genomes_project/data/MXL/NA19771/alignment/NA19771.alt_bwamem_GRCh38DH.20150718.MXL.low_coverage.cram'
    processed line 35000: '1000_genomes_project/data/PJL/HG02792/alignment/HG02792.alt_bwamem_GRCh38DH.20150718.PJL.low_coverage.cram.crai'
    processed line 36000: '1000_genomes_project/data/STU/HG03680/alignment/HG03680.alt_bwamem_GRCh38DH.20150718.STU.low_coverage.bam.bas'
    processed line 37000: '1000_genomes_project/data/TSI/NA20766/exome_alignment/NA20766.alt_bwamem_GRCh38DH.20150826.TSI.exome.cram'
    processed line 38000: '1000_genomes_project/release/20181203_biallelic_SNV/ALL.wgs.shapeit2_integrated_v1a.GRCh38.20181129.sites.vcf.gz.tbi'
    processed 38843 lines
    8 duplicated MD5 hashes
    18 duplicated files
    2.2500 files per duplicated MD5 hash
    16ef1c1dbd47d6ce4af728c319a898ce
    2
    '1000G_2504_high_coverage/README_2504_plus_additional_698_related_samples.txt'
    '1000G_2504_high_coverage/additional_698_related/README_2504_plus_additional_698_related_samples.txt'
    ----
    65d9215c90db4c151c0bd9097a4c3182
    2
    '1000G_2504_high_coverage/README_111822.pdf'
    '1000G_2504_high_coverage/working/README_111822.pdf'
    ----
    a13946be583f92f1540ea9f8f5afa8a2
    3
    '1000G_2504_high_coverage/working/20190425_NYGC_GATK/annotated/CCDG_13607_B01_GRM_WGS_2019-02-19_chrY.recalibrated_variants.annotated.clinical.txt'
    '1000G_2504_high_coverage/working/20190425_NYGC_GATK/annotated/CCDG_13607_B01_GRM_WGS_2019-02-19_others.recalibrated_variants.annotated.coding.txt'
    '1000G_2504_high_coverage/working/20190425_NYGC_GATK/annotated/CCDG_13607_B01_GRM_WGS_2019-02-19_others.recalibrated_variants.annotated.coding_rare.txt'
    ----
    507c51460d4d4b2ea6d6968649fd97f1
    2
    '1000G_2504_high_coverage/working/20200921_3202_NYGC_GATK_preQC/CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.vcf.gz'
    '1000G_2504_high_coverage/working/20201028_3202_raw_GT_with_annot/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.vcf.gz'
    ----
    57a473b526f4a4bd0d8b1c335275b27d
    2
    '1000G_2504_high_coverage/working/20200921_3202_NYGC_GATK_preQC/CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.vcf.gz.tbi'
    '1000G_2504_high_coverage/working/20201028_3202_raw_GT_with_annot/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.vcf.gz.tbi'
    ----
    d457089f46974f2495cef6d313f28592
    3
    '1000G_2504_high_coverage/working/20201028_3202_raw_GT_with_annot/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_chrY.recalibrated_variants.annotated.clinical.txt'
    '1000G_2504_high_coverage/working/20201028_3202_raw_GT_with_annot/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.annotated.coding.txt'
    '1000G_2504_high_coverage/working/20201028_3202_raw_GT_with_annot/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_others.recalibrated_variants.annotated.coding_rare.txt'
    ----
    8eefd26b2b6f32f5c53ee5d4aae0b115
    2
    '1000G_2504_high_coverage/1kGP.3202_samples.pedigree_info.txt'
    '1000G_2504_high_coverage/working/1kGP.3202_samples.pedigree_info.txt'
    ----
    bac176a443f941890ac7b51fb1cabe0d
    2
    '1000G_2504_high_coverage/20130606_g1k_3202_samples_ped_population.txt'
    '1000G_2504_high_coverage/additional_698_related/20130606_g1k_3202_samples_ped_population.txt'
    ----

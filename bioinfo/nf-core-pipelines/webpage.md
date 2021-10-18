Uppmax maintains local copies of nf-core pipelines (released)
(<https://nf-co.re/pipelines>).  Note that:

        * The local copies can be loaded using "$ module load nf-core-pipelines"
        * To run a pipeline with a revision "nextflow run $NF_CORE_PIPELINES/pipeline_name/revsion/workflow ..."
        * The pipelines are updated **every sunday at 00.00**

The pipelines available are:

**Name** | **Releases** |  **Notes**
-----|--------|------
**ampliseq** | 1.0.0, 1.1.0, 1.1.1, 1.1.2, 1.1.3, 1.2.0, 2.0.0, 2.1.0 | 16S rRNA amplicon sequencing analysis workflow using QIIME2
**atacseq** | 1.0.0, 1.1.0, 1.2.0, 1.2.1 | ATAC-seq peak-calling, QC and differential analysis pipeline
**bacass** |  1.0.0, 1.1.0, 1.1.1, 2.0.0 | Simple bacterial assembly and annotation pipeline
**bactmap** | 1.0.0 | A mapping-based pipeline for creating a phylogeny from bacterial whole genome sequences
**bcellmagic** | 1.0.0, 1.1.0, 1.2.0, 2.0.0 | B and T cell repertoire sequencing analysis pipeline using the Immcantation framework
**cageseq** | 1.0.0, 1.0.1, 1.0.2 | CAGE-sequencing analysis pipeline with trimming, alignment and counting of CAGE tags
**chipseq** | 1.0.0, 1.1.0, 1.2.0, 1.2.1, 1.2.2 | ChIP-seq peak-calling, QC and differential analysis pipeline
**clipseq** | 1.0.0 | CLIP sequencing analysis pipeline for QC, pre-mapping, genome mapping, UMI deduplication, and multiple peak-calling options
**coproid** | 1.0, 1.1 | Coprolite host Identification pipeline
**deepvariant** | 1.0 | Googles DeepVariant variant caller as a Nextflow pipeline
**diaproteomics** | 1.0.0 ,1.1.0, 1.2.0, 1.2.1, 1.2.2, 1.2.3  1.2.4 | Automated quantitative analysis of DIA proteomics mass spectrometry measurements
**dualrnaseq** | 1.0.0 | Analysis of Dual RNA-seq data - an experimental method for interrogating host-pathogen interactions through simultaneous RNA-seq
**eager** | 2.0.0,  2.0.1, 2.0.2, 2.0.3, 2.0.4, 2.0.5, 2.0.6, 2.0.7, 2.1.0, 2.2.0, 2.2.1, 2.2.2, 2.3.0, 2.3.1, 2.3.2, 2.3.3, 2.3.4, 2.3.5, 2.4.0 | A fully reproducible and state-of-the-art ancient DNA analysis pipeline
**epitopeprediction** | 1.0.0, 1.1.0 | A bioinformatics best-practice analysis pipeline for epitope prediction and annotation
**fetchngs** | 1.0, 1.1, 1.2, 1.3 | Pipeline to fetch metadata and raw FastQ files from public databases
**hic** | 1.0.0, 1.1.0, 1.2.0, 1.2.1, 1.2.2, 1.3.0 | Analysis of Chromosome Conformation Capture data (Hi-C)
**hlatyping** | 1.0.0, 1.1.0, 1.1.1, 1.1.2, 1.1.3, 1.1.4, 1.1.5, 1.2.0 | Precision HLA typing from next-generation sequencing data
**imcyto** | 1.0.0 | Image Mass Cytometry analysis pipeline
**mag** | 1.0.0, 1.1.0, 1.1.1, 1.1.2, 1.2.0, 2.0.0, 2.1.0 | Assembly and binning of metagenomes
**metaboigniter** | 1.0.0, 1.0.1 | Pre-processing of mass spectrometry-based metabolomics data with quantification and identification based on MS1 and MS2 data
**methylseq** | 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.6.1 |  Methylation (Bisulfite-Sequencing) analysis pipeline using Bismark or bwa-meth + MethylDackel
**mhcquant** | 1.0.0, 1.1.0, 1.2.0, 1.2.1, 1.2.2, 1.2.3, 1.2.4, 1.2.5, 1.2.6, 1.3, 1.4, 1.5, 1.5.1, 1.6.0, 2.0.0 | Identify and quantify MHC eluted peptides from mass spectrometry raw data
**nanoseq** | 1.0.0, 1.1.0 | Nanopore demultiplexing, QC and alignment pipeline
**nascent** | 1.0 | Nascent Transcription Processing Pipeline
**neutronstar** | 1.0.0 | De novo assembly pipeline for 10X linked-reads using Supernova
**pgdb** | 1.0.0 | The ProteoGenomics database generation workflow creates different protein databases for ProteoGenomics data analysis
**proteomicslfq** | 1.0.0 | Proteomics label-free quantification (LFQ) analysis pipeline
**rnafusion** | 1.0, 1.0.1, 1.0.2, 1.1.0, 1.2.0 | RNA-seq analysis pipeline for detection gene-fusions
**rnaseq** | 1.0, 1.1, 1.2, 1.3, 1.4, 1.4.1, 1.4.2, 2.0, 3.0, 3.1, 3.2, 3.3 | RNA sequencing analysis pipeline using STAR, RSEM, HISAT2 or Salmon with gene/isoform counts and extensive quality control
**sarek** | 2.5, 2.5.1, 2.5.2, 2.6, 2.6.1, 2.7, 2.7.1 | Analysis pipeline to detect germline or somatic variants (pre-processing, variant calling and annotation) from WGS / targeted sequencing
**scrnaseq** | 1.0.0, 1.1.0 | A single-cell RNAseq pipeline for 10X genomics data
**slamseq** | 1.0.0 | SLAMSeq processing and analysis pipeline
**smrnaseq** | 1.0.0, 1.1.0  | A small-RNA sequencing analysis pipeline
**viralrecon** | 1.0.0, 1.1.0, 2.0, 2.1, 2.2 | Assembly and intrahost/low-frequency variant calling for viral samples


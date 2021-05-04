bcftools-MoCha/1.11-20210315
========================

<http://software.broadinstitute.org/software/mocha/>

Used under license:
MIT

Structure creating script (makeroom_bcftools-MoCha_1.11-20210315.sh) moved to /sw/bioinfo/bcftools-MoCha/makeroom_1.11-20210315.sh

LOG
---


    TOOL=bcftools-MoCha
    VERSION=1.11-20210315
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://software.broadinstitute.org/software/mocha/ -d "MOsaic CHromosomal Alterations (MoChA) caller" -l MIT 
    ./makeroom_bcftools-MoCha_1.11-20210315.sh 
    source SOURCEME_bcftools-MoCha_1.11-20210315 
    cd $SRCDIR
    module load bzip2/1.0.6
    module load xz/5.2.2
    module load zlib/1.2.11
    module load gcc/9.3.0
    module load libcurl/7.45.0
    module load gsl/2.6
    wget http://software.broadinstitute.org/software/mocha/bio-mocha_1.11-20210315.tar.gz
    wget https://github.com/samtools/bcftools/releases/download/1.11/bcftools-1.11.tar.bz2
    tar xf bcftools-1.11.tar.bz2
    mkdir bio-mocha_1.11-20210315
    cd bio-mocha_1.11-20210315
    tar xf ../bio-mocha_1.11-20210315.tar.gz
    cd ..
    rm -f bcftools-1.11/plugins/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c}
    cp -av bio-mocha_1.11-20210315/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c} bcftools-1.11/plugins/
    cd bcftools-1.11/
    cd htslib-1.11/
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j10 && make install
    cd ..
    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-libgsl
    make -j10
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make test
    make install
    cd $PREFIX/bin
    head gff2gff.py 
    which python3
    python3 --version
    head run-roh.pl 
    perl --version
    module load patchelf/0.10
    patchelf --set-rpath "$(patchelf --print-rpath bcftools):$PREFIX/lib:$GSL_ROOT/lib" bcftools

Get other tools.

    cd $SRCDIR
    wget -O impute5_v1.1.4.zip https://www.dropbox.com/sh/mwnceyhir8yze2j/AAAPJVJv3kI2glXGDdc3sSHga/impute5_v1.1.4.zip?dl=0
    unzip impute5_v1.1.4.zip impute5_v1.1.4/imp{ute5,5Converter}_1.1.4_static
    mv impute5_v1.1.4/impute5_1.1.4_static $PREFIX/bin/impute5
    mv impute5_v1.1.4/imp5Converter_1.1.4_static $PREFIX/bin/imp5Converter
    wget http://faculty.washington.edu/browning/beagle/bref3.18May20.d20.jar
    cp -av bref3.18May20.d20.jar $PREFIX/bin
    cd $PREFIX/bin
    ln -s bref3.18May20.d20.jar bref3.jar


Genome resources
----------------

    cd $PREFIX
    mkdir res
    cd res
    module load bioinfo-tools samtools/1.12 BEDTools/2.29.2
    export PATH=$PREFIX/bin:$PATH

And also set up GRCh37-setup.sh and GRCh38-setup.sh according to the instructions.  These are changed from the already installed version.


### for GRCh37 ...

    mkdir GRCh37
    cd GRCh37

    wget -O- ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz | \
      gzip -d > human_g1k_v37.fasta
    samtools faidx human_g1k_v37.fasta
    wget https://data.broadinstitute.org/alkesgroup/Eagle/downloads/tables/genetic_map_hg19_withX.txt.gz

    wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr{{1..22}.phase3_shapeit2_mvncall_integrated_v5b,X.phase3_shapeit2_mvncall_integrated_v1c,Y.phase3_integrated_v2b}.20130502.genotypes.vcf.gz{,.tbi}
    for chr in {1..22} X Y; do
        bcftools view --no-version -Ou -c 2 ALL.chr${chr}.phase3*integrated_v[125][bc].20130502.genotypes.vcf.gz | \
        bcftools annotate --no-version -Ou -x ID,QUAL,FILTER,INFO,^FMT/GT | \
        bcftools norm --no-version -Ou -m -any | \
        bcftools norm --no-version -Ob -o ALL.chr${chr}.phase3_integrated.20130502.genotypes.bcf -d none -f human_g1k_v37.fasta && \
        bcftools index -f ALL.chr${chr}.phase3_integrated.20130502.genotypes.bcf
    done

    wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/integrated_sv_map/ALL.wgs.mergedSV.v8.20130502.svs.genotypes.vcf.gz{,.tbi}
    bcftools query -i 'AC>1 && END-POS+1>10000 && SVTYPE!="INDEL" && (SVTYPE=="CNV" || SVTYPE=="DEL" || SVTYPE=="DUP")' \
        -f "%CHROM\t%POS0\t%END\t%SVTYPE\n" ALL.wgs.mergedSV.v8.20130502.svs.genotypes.vcf.gz > cnps.bed

    wget -O- http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/genomicSuperDups.txt.gz | gzip -d |
        awk '!($2=="chrX" && $8=="chrY" || $2=="chrY" && $8=="chrX") {print $2"\t"$3"\t"$4"\t"$30}' > genomicSuperDups.bed

    awk '{print $1,$2; print $1,$3}' genomicSuperDups.bed | \
        sort -k1,1 -k2,2n | uniq | \
        awk 'chrom==$1 {print chrom"\t"pos"\t"$2} {chrom=$1; pos=$2}' | \
        bedtools intersect -a genomicSuperDups.bed -b - | \
        bedtools sort | \
        bedtools groupby -c 4 -o min | \
        awk 'BEGIN {i=0; s[0]="+"; s[1]="-"} {if ($4!=x) i=(i+1)%2; x=$4; print $0"\t0\t"s[i]}' | \
        bedtools merge -s -c 4 -o distinct | \
        sed 's/^chr//' | grep -v gl | bgzip > segdups.bed.gz && \
        tabix -f -p bed segdups.bed.gz


    pfx="ALL.chr"
    sfx=".phase3_integrated.20130502.genotypes"
    for chr in {{1..22},X}; do imp5Converter --h $pfx$chr$sfx.bcf --o $pfx$chr$sfx --r $chr; done
    for chr in {1..22}; do bcftools view --no-version $pfx$chr$sfx.bcf | java -jar bref3.jar > $pfx$chr$sfx.bref3; done
    chr=X; bcftools +fixploidy --no-version $pfx$chr$sfx.bcf | \
        sed 's/0\/0/0|0/g;s/1\/1/1|1/g' | java -jar bref3.jar > $pfx$chr$sfx.bref3

    wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/cytoBand.txt.gz

    cd ..

### for GRCh38 ...

    mkdir GRCh38
    cd GRCh38

    wget -O- ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz | \
        gzip -d > GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
    samtools faidx GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna

    wget https://data.broadinstitute.org/alkesgroup/Eagle/downloads/tables/genetic_map_hg38_withX.txt.gz

    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20201028_3202_phased/CCDG_14151_B01_GRM_WGS_2020-08-05_chr{{1..22}.filtered.shapeit2-duohmm,X.filtered.eagle2}-phased.vcf.gz
    for chr in {1..22}; do
        bcftools view --no-version -Ou -c 2 CCDG_14151_B01_GRM_WGS_2020-08-05_chr$chr.filtered.shapeit2-duohmm-phased.vcf.gz | \
        bcftools annotate --no-version -Ob -o CCDG_14151_B01_GRM_WGS_2020-08-05_chr$chr.filtered.phased.bcf -x ID,QUAL,FILTER,INFO,^FMT/GT && \
        bcftools index -f CCDG_14151_B01_GRM_WGS_2020-08-05_chr$chr.filtered.phased.bcf
    done
    bcftools view --no-version -h CCDG_14151_B01_GRM_WGS_2020-08-05_chrX.filtered.eagle2-phased.vcf.gz | \
        sed 's/^#CHROM/##INFO=<ID=ME,Number=1,Type=Float,Description="Mendelian genotype errors">\n#CHROM/' | \
        bcftools reheader -h /dev/stdin CCDG_14151_B01_GRM_WGS_2020-08-05_chrX.filtered.eagle2-phased.vcf.gz | \
        bcftools view --no-version -Ou -c 2 | \
        bcftools annotate --no-version -Ob -o CCDG_14151_B01_GRM_WGS_2020-08-05_chrX.filtered.phased.bcf -x ID,QUAL,FILTER,INFO,^FMT/GT &&
        bcftools index -f CCDG_14151_B01_GRM_WGS_2020-08-05_chrX.filtered.phased.bcf

    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000G_2504_high_coverage/working/20210124.SV_Illumina_Integration/1KGP_3202.Illumina_ensemble_callset.freeze_V1.vcf.gz{,.tbi}
    bcftools query -i 'AC>1 && END-POS+1>10000 && (SVTYPE=="CNV" || SVTYPE=="DEL" || SVTYPE=="DUP")' \
        -f "%CHROM\t%POS0\t%END\t%SVTYPE\n" 1KGP_3202.Illumina_ensemble_callset.freeze_V1.vcf.gz > cnps.bed

    wget -O- http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/genomicSuperDups.txt.gz | gzip -d |
        awk '!($2=="chrX" && $8=="chrY" || $2=="chrY" && $8=="chrX") {print $2"\t"$3"\t"$4"\t"$30}' > genomicSuperDups.bed

    awk '{print $1,$2; print $1,$3}' genomicSuperDups.bed | \
        sort -k1,1 -k2,2n | uniq | \
        awk 'chrom==$1 {print chrom"\t"pos"\t"$2} {chrom=$1; pos=$2}' | \
        bedtools intersect -a genomicSuperDups.bed -b - | \
        bedtools sort | \
        bedtools groupby -c 4 -o min | \
        awk 'BEGIN {i=0; s[0]="+"; s[1]="-"} {if ($4!=x) i=(i+1)%2; x=$4; print $0"\t0\t"s[i]}' | \
        bedtools merge -s -c 4 -o distinct | \
        grep -v "GL\|KI" | bgzip > segdups.bed.gz && \
        tabix -f -p bed segdups.bed.gz

    pfx="ALL."
    sfx="_GRCh38.genotypes.20170504"
    for chr in chr{{1..22},X}; do imp5Converter --h $pfx$chr$sfx.bcf --o $pfx$chr$sfx --r $chr; done
    wget -O bref3.jar http://faculty.washington.edu/browning/beagle/bref3.18May20.d20.jar
    for chr in chr{1..22}; do bcftools view --no-version $pfx$chr$sfx.bcf | java -jar bref3.jar > $pfx$chr$sfx.bref3; done
    chr=chrX; bcftools +fixploidy --no-version $pfx$chr$sfx.bcf | \
        sed 's/0\/0/0|0/g;s/1\/1/1|1/g' | java -jar bref3.jar > $pfx$chr$sfx.bref3

    wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/cytoBand.txt.gz

    cd ..

    cd $PREFIX

HLA-HD/1.6.1
========================

<https://www.genome.med.kyoto-u.ac.jp/HLA-HD/>

Used under license:
free for academic use


Structure creating script (makeroom_HLA-HD_1.6.1.sh) moved to /sw/bioinfo/HLA-HD/makeroom_1.6.1.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-t" "HLA-HD" "-v" "1.6.1" "-s" "annotation" "-c" "bioinfo" "-w" "https://www.genome.med.kyoto-u.ac.jp/HLA-HD/" "-l" "free for academic use" "-d" "HLA-HD (HLA typing from High-quality Dictionary) can accurately determine HLA alleles with 6-digit precision from NGS data (fastq format). RNA-Seq data can also be applied." "-f"
    ./makeroom_HLA-HD_1.6.1.sh
HLA-HD/1.4.0
========================

<https://www.genome.med.kyoto-u.ac.jp/HLA-HD/>

Used under license:
free for academic use


Structure creating script (makeroom_HLA-HD_1.4.0.sh) moved to /sw/bioinfo/HLA-HD/makeroom_1.4.0.sh

LOG
---


    TOOL=HLA-HD
    VERSION=1.4.0
    GCCVERSION=9.3.0

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-t" "HLA-HD" "-v" "1.4.0" "-s" "annotation" "-c" "bioinfo" "-w" "https://www.genome.med.kyoto-u.ac.jp/HLA-HD/" "-l" "free for academic use" "-d" "HLA-HD (HLA typing from High-quality Dictionary) can accurately determine HLA alleles with 6-digit precision from NGS data (fastq format). RNA-Seq data can also be applied." "-f"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load bioinfo-tools bowtie2/2.3.5.1

    cd ${SRCDIR}/hlahd.${VERSION}/
    ./install.sh



vartrix/1.1.22
========================

<https://github.com/10XGenomics/vartrix>

Used under license:
MIT


Structure creating script (makeroom_vartrix_1.1.22.sh) moved to /sw/bioinfo/vartrix/makeroom_1.1.22.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "vartrix" "-v" "1.1.22" "-l" "MIT" "-d" "Single-Cell Genotyping Tool" "-s" "annotation" "-w" "https://github.com/10XGenomics/vartrix"
    ./makeroom_vartrix_1.1.22.sh

# Download prebuilt binary
    cd $PREFIX
    wget https://github.com/10XGenomics/vartrix/releases/download/v1.1.22/vartrix_linux
    ln -s vartrix_linux vartrix
    chmod +x vartrix_linux


# Test
    cd $SRCDIR
    git clone https://github.com/10XGenomics/vartrix.git .
    cd $SRCDIR/test
    ln -s $SRCDIR/test $PREFIX/test
    module load vartrix/1.1.22
    vartrix --bam $VARTRIX_TEST/test_dna.bam --cell-barcodes $VARTRIX_TEST/dna_barcodes.tsv --fasta $VARTRIX_TEST/test_dna.fa  --vcf $VARTRIX_TEST/test_dna.vcf


Downloading SGDP data from EBI's 1000 Genomes portal
====================================================


    cd /sw/data/SGDP

Fetch the indices and READMEs.

    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/README_Simons_diversity_data.md
    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/README_Simons_diversity_datareuse_statement.md
    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/simons_diversity_data.GRCh38DH.alignment.index
    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/simons_diversity_wgs.sequence.index

Mirror the data directory here. Do this within a screen.

    echo "mirror data" | lftp ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data


MD5 checks
----------

Generate and collect MD5 sums.

    module load gnuparallel

    find data \( -name '*.cram' -o -name '*.crai' -o -name '*.bas' \) -print | parallel --dry-run --line-buffer -j4 md5sum | sort -k2,2V > md5s.txt

This produces a file like

    f659866520c7428ae460f303c04cb213  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.bam.bas
    2b5adff40b76574ff99baddcc1faf597  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram
    32b9326e183299392c62bf218caf4d71  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram.crai
    aa5ab5f7d016f41e602ef3a1f1452b83  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.bam.bas
    d7a65eef1caedd825bcb929af8c43ec1  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram
    133896762162df8652952593c02714d5  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram.crai
    c47bdca544420b6712032f8abd7b5edc  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.bam.bas
    384f8ed910067869ff44dc4750fc0ed9  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.cram
    45c80bdda3494c8a995a4e4604b2a7a2  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.cram.crai
    e2ad33f951cfdd54cc5f5900c1115a96  data/Adygei/SAMEA3302728/alignment/SAMEA3302728.alt_bwamem_GRCh38DH.20200922.Adygei.simons.bam.bas

Custom script `check_md5s.pl` to check MD5s using the `simons_diversity_data.GRCh38DH.alignment.index` file, which has MD5s for all three filetypes.


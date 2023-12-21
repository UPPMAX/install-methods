/sw/data/reference
==================

Older ENSEMBL references, still used by many pipelines.

Under `/sw/data/reference/`:

    drwxrwsr-x  3 douglas sw 4096 May 10  2023 Bacteria
    drwxrwsr-x  5 douglas sw 4096 Feb  3  2022 Canis_familiaris
    drwxrwsr-x  3 douglas sw 4096 May 31  2013 Equus_caballus
    drwxrwsr-x  4 douglas sw 4096 Jul 27  2016 Felis_catus
    drwxrwsr-x  3 douglas sw 4096 Apr 23  2010 Gallus_gallus
    drwxrwsr-x  8 douglas sw 4096 Dec  8  2022 Homo_sapiens
    drwxrwsr-x  3 douglas sw 4096 Sep  7  2010 Macaca_mulatta
    drwxrwsr-x  4 douglas sw 4096 Jan 14  2013 Mus_musculus
    drwxrwsr-x  3 douglas sw 4096 Apr 22  2010 Pan_troglodytes
    drwxrwsr-x  3 douglas sw 4096 Sep 13  2011 Pichia_stipitis
    drwxrwsr-x  3 douglas sw 4096 Mar  3  2011 Rattus_norvegicus
    drwxrwsr-x  3 douglas sw 4096 Sep 13  2011 Saccharomyces_cerevisiae
    drwxrwsr-x  3 douglas sw 4096 Sep  1  2010 Schizosaccharomyces_pombe
    drwxrwsr-x  3 douglas sw 4096 Apr 28  2010 Sus_scrofa
    drwxrwsr-x  3 douglas sw 4096 Oct  1  2010 Taeniopygia_guttata

Fetched, for example, using:

    wget -nH --cut-dirs=4 -r 'ftp://ftp.ensembl.org/pub/release-84/fasta/felis_catus/dna/'


Also, the location of the GATK data bundle.

#Human Genome Diversity Project (HGDP)

This collection contains data relating to the Human Genome Diversity Project (HGDP).

**Please respect [Fort Lauderdale Principles](https://www.genome.gov/pages/research/wellcomereport0303.pdf) and see the accompanying Data Reuse policy with regard to this data. details of this policy can be found in the [README_HGDP_datareuse_statement.md](https://github.com/igsr/1000Genomes_data_indexes/blob/master/data_collections/HGDP/README_HGDP_datareuse_statement.md)**  An UPPMAX-local copy of this file is available at `/sw/data/HGDP/README_HGDP_datareuse_statement.md`.

###HGDP-CEPH

The Fondation Jean Dausset - Centre d'Étude du Polymorphisme Humain (CEPH) maintains the bank of cell lines that form the HGDP-CEPH Human Genome Diversity Cell Line Panel. Further information is available from the [website of the Fondation Jean Dausset](http://www.cephb.fr/en/hgdp_panel.php), including [information on conditions of access and use](http://www.cephb.fr/en/hgdp_panel.php#conditionsacces).

The HGDP-CEPH panel is composed of 1063 LCLs, from 1050 individuals from 52 populations.

###Sequence data

The [Tyler-Smith](http://www.sanger.ac.uk/science/groups/tyler-smith-group) and [Durbin](http://www.sanger.ac.uk/science/groups/durbin-group) groups at the Wellcome Trust Sanger Institute (WTSI) have generated high-coverage Illumina sequence data from these samples. Information on using this data can be found on the [WTSI website](http://www.sanger.ac.uk/datasharing/).

###Samples in the HGDP collection

Please note that some of the samples present in the HGDP collection are also present in the [Simons diversity](https://github.com/igsr/1000Genomes_data_indexes/blob/master/data_collections/simons_diversity_data/README_Simons_diversity_data.md) collection.

###Questions
If you have any questions please email info@1000genomes.org.

## UPPMAX installation notes

These data are located under `/sw/data/HGDP/`.  To gain access, email support@uppmax.uu.se and request membership in the `kgp` group.

For UPPMAX staff, `kgp`-group access is controlled by adjusting the top level directory:

    chgrp kgp /sw/data/HGDP
    chmod u+rwx,g+rx-w,o-rwx /sw/data/HGDP

and the data underneath has standard `fixup`-based attributes that are *not* applied to the top-level directory:

    cd /sw/data/HGDP
    fixup *

This way the only restriction on managing files and adjusting attributes applies on the top-level directory. AEs can adjust contents beneath.

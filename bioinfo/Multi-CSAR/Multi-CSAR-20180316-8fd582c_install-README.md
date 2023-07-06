Multi-CSAR/20180316-8fd582c
========================

<https://github.com/ablab-nthu/Multi-CSAR>

Used under license:
GPL-3.0


Structure creating script (makeroom_Multi-CSAR_20180316-8fd582c.sh) moved to /sw/bioinfo/Multi-CSAR/makeroom_20180316-8fd582c.sh

LOG
---

    makeroom.sh -t "Multi-CSAR" -v 20180316-8fd582c -c bioinfo -s assembly -w "https://github.com/ablab-nthu/Multi-CSAR" -l "GPL-3.0" -d "is a scaffolding tool that can order and orient the contigs of a target draft genome based on multiple complete and/or incomplete reference genomes of related organisms."
    source /sw/bioinfo/Multi-CSAR/SOURCEME_Multi-CSAR_20180316-8fd582c

    cd /sw/bioinfo/Multi-CSAR/20180316-8fd582c/src/
    git clone https://github.com/ablab-nthu/Multi-CSAR.git
    cd Multi-CSAR/
    git reset 8fd582c

    cp -rp /sw/bioinfo/Multi-CSAR/20180316-8fd582c/src/Multi-CSAR/* /sw/bioinfo/Multi-CSAR/20180316-8fd582c/rackham/.

    cd /sw/bioinfo/Multi-CSAR/20180316-8fd582c/rackham/
    module load bioinfo-tools MUMmer/3.23 PHP/7.4.32
    vi setup.php
    php setup.php
    ldd aux_bin/*

    vi $TOOLDIR/mf/$VERSION
    vi $TOOLDIR/Multi-CSAR-20180316-8fd582c_install-README.md
    cd $TOOLDIR
    ./Multi-CSAR-20180316-8fd582c_post-install.sh



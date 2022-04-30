Kraken/1.1.1-20210927-375654f
========================

<https://github.com/DerrickWood/kraken>

Used under license:
GPL v3


Structure creating script (makeroom_Kraken_1.1.1-20210927-375654f.sh) moved to /sw/bioinfo/Kraken/makeroom_1.1.1-20210927-375654f.sh

LOG
---

    makeroom.sh -f -t Kraken -v 1.1.1-20210927-375654f -w https://github.com/DerrickWood/kraken -l "GPL v3" -d "Kraken taxonomic sequence classification system"
    ./makeroom_Kraken_1.1.1-20210927-375654f.sh 
    source /sw/bioinfo/Kraken/SOURCEME_Kraken_1.1.1-20210927-375654f && cd $SRCDIR
    cat ../../Kraken-1.1.1-install-README.md 
    ml git gcc/8.3.0
    git clone --recursive https://github.com/DerrickWood/kraken
    cd kraken/
    ./install_kraken.sh $PREFIX


Do we need the below?

2021-06-03
----------

Update `rsync_from_ncbi.pl` from pull request.  New file in

    src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl



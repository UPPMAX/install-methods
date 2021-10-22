ucsc-utilities/v421
===================

<http://hgdownload.soe.ucsc.edu/admin/exe/>

Used under license:
Free non-commercial


Structure creating script (makeroom_ucsc-utilities_v421.sh) moved to /sw/bioinfo/ucsc-utilities/makeroom_v421.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f -t "ucsc-utilities" -v "v421" -w "http://hgdownload.soe.ucsc.edu/admin/exe/" -l "Free non-commercial" -d "Kent bioinformatics utilities"
    ./makeroom_ucsc-utilities_v421.sh
    source /sw/bioinfo/ucsc-utilities/SOURCEME_ucsc-utilities_v421
    cd $PREFIX
    rsync -aP rsync://hgdownload.cse.ucsc.edu/genome/admin/exe/linux.x86_64/ ./

Now fixup and that's that.

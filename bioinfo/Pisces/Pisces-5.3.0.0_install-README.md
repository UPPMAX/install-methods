Pisces/5.3.0.0
========================

<https://github.com/Illumina/Pisces/releases/tag/v5.3.0.0>

Used under license:
GPL 3

We are not using an official Illumina release, instead we are using a release
by github user tamsen <https://github.com/tamsen/Pisces/releases/tag/v5.3.0.0>
that removes .NET/Windows requirements and makes it friendly for Linux x64.
This is referenced by Illunima at the tag URL above.

There is further help for this specific version:

<https://github.com/tamsen/Pisces/wiki>

I will reference this in the load message.

* Illumina's own repository: <https://github.com/Illumina/Pisces>
* Reference to this version within Illumina's repository: <https://github.com/Illumina/Pisces/releases/tag/v5.3.0.0>
* Help specific to this version: <https://github.com/tamsen/Pisces/wiki>


Structure creating script (makeroom_Pisces_5.3.0.0.sh) moved to /sw/bioinfo/Pisces/makeroom_5.3.0.0.sh

LOG
---

    makeroom.sh -t Pisces -v 5.3.0.0 -w https://github.com/Illumina/Pisces/releases/tag/v5.3.0.0 -d "Somatic and germline variant caller for amplicon data. Recommended caller for tumor-only workflows." -l "GPL 3" -c bioinfo -s misc
    ./makeroom_Pisces_5.3.0.0.sh 
    source /sw/bioinfo/Pisces/SOURCEME_Pisces_5.3.0.0 && cd $SRCDIR
    wget https://github.com/tamsen/Pisces/releases/download/v5.3.0.0/pisces_all_5.3.0.0.tar.gz
    tar xf pisces_all_5.3.0.0.tar.gz 

Does it work?

    ldd Pisces
    ./Pisces
    ./Pisces -h

Yes, replace `PREFIX` with it.

    rmdir $PREFIX
    mv pisces_all $PREFIX

Update mf with specific help

    cd $TOOLDIR
    cd mf
    vi 5.3.0.0 

Wrap up.

    cd $TOOLDIR
    ./Pisces-5.3.0.0_post-install.sh 


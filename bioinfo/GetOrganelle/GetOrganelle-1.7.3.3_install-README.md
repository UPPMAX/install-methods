GetOrganelle/1.7.3.3
========================

<https://github.com/Kinggerm/GetOrganelle>

Used under license:
GPLv3
<https://github.com/Kinggerm/GetOrganelle/blob/master/LICENSE>

Structure creating script (makeroom_GetOrganelle_1.7.3.3.sh) moved to /sw/bioinfo/GetOrganelle/makeroom_1.7.3.3.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "GetOrganelle" -v "1.7.3.3" -w "https://github.com/Kinggerm/GetOrganelle" -l "GPLv3" -L "https://github.com/Kinggerm/GetOrganelle/blob/master/LICENSE" -d "This toolkit assemblies organelle genome from genomic skimming data." -s "assembly"
    ./makeroom_GetOrganelle_1.7.3.3.sh
    cd $SRCDIR
    wget https://github.com/Kinggerm/GetOrganelle/archive/1.7.3.3.tar.gz
    tar xvfz 1.7.3.3.tar.gz
    ml python/3.8.7
    pip install ./GetOrganelle-1.7.3.3/ --target=$PREFIX
    pip install psutil --target=$PREFIX


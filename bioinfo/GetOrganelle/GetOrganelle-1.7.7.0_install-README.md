GetOrganelle/1.7.7.0
========================

<https://github.com/Kinggerm/GetOrganelle>

Used under license:
GPLv3
<https://github.com/Kinggerm/GetOrganelle/blob/master/LICENSE>

Structure creating script (makeroom_GetOrganelle_1.7.7.0.sh) moved to /sw/bioinfo/GetOrganelle/makeroom_1.7.7.0.sh

LOG
---

    /home/jonass/uppmax/makeroom.sh "-v" "1.7.7.0" "-t" "GetOrganelle" "-l" "GPLv3" "-L" "https://github.com/Kinggerm/GetOrganelle/blob/master/LICENSE" "-w" "https://github.com/Kinggerm/GetOrganelle" "-d" "This toolkit assemblies organelle genome from genomic skimming data." "-k" "organelle chloroplast genome assembly" "-f"
    ./makeroom_GetOrganelle_1.7.7.0.sh
    cd $SRCDIR
    wget https://github.com/Kinggerm/GetOrganelle/archive/1.7.7.0.tar.gz
    tar xvfz 1.7.7.0.tar.gz
    ml python/3.10.8
    pip install ./GetOrganelle-1.7.7.0/ --target=$PREFIX
    pip install psutil --target=$PREFIX


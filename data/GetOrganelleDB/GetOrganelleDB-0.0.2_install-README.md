GetOrganelleDB/0.0.2
========================

<https://github.com/Kinggerm/GetOrganelleDB>

Used under license:
GPLv3
<https://github.com/Kinggerm/GetOrganelleDB/blob/master/LICENSE>

Structure creating script (makeroom_GetOrganelleDB_0.0.2.sh) moved to /sw/data/GetOrganelleDB/makeroom_0.0.2.sh

LOG
---

    /home/jonass/uppmax/makeroom.sh "-t" "GetOrganelleDB" "-v" "0.0.2" "-w" "https://github.com/Kinggerm/GetOrganelleDB" "-l" "GPLv3" "-L" "https://github.com/Kinggerm/GetOrganelleDB/blob/master/LICENSE" "-d" "All versions of default databases of GetOrganelle." "-c" "data" "-f"
    ./makeroom_GetOrganelleDB_0.0.2.sh
    cd $TOOLDIR
    lista
    GETORG_PATH=$PREFIX
    export GETORG_PATH
    ml GetOrganelle/1.7.7.0
    get_organelle_config.py --add embplant_pt
    get_organelle_config.py --add embplant_mt
    get_organelle_config.py --add embplant_nr
    get_organelle_config.py --add fungus_mt
    get_organelle_config.py --add fungus_nr
    get_organelle_config.py --add animal_mt
    get_organelle_config.py --add other_pt


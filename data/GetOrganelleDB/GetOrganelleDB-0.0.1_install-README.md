GetOrganelleDB/0.0.1
========================

<https://github.com/Kinggerm/GetOrganelleDB>

Used under license:
GPLv3
<https://github.com/Kinggerm/GetOrganelleDB/blob/master/LICENSE>

Structure creating script (makeroom_GetOrganelleDB_0.0.1.sh) moved to /sw/data/GetOrganelleDB/makeroom_0.0.1.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "GetOrganelleDB" -v "0.0.1" -w "https://github.com/Kinggerm/GetOrganelleDB" -l "GPLv3" -L "https://github.com/Kinggerm/GetOrganelleDB/blob/master/LICENSE" -d "All versions of default databases of GetOrganelle." -c "data"
    ./makeroom_GetOrganelleDB_0.0.1.sh
    cd $TOOLDIR
    lista
    GETORG_PATH=$PREFIX
    export GETORG_PATH
    ml GetOrganelle/1.7.3.3
    get_organelle_config.py --add embplant_pt
    get_organelle_config.py --add embplant_mt
    get_organelle_config.py --add embplant_nr
    get_organelle_config.py --add fungus_mt
    get_organelle_config.py --add fungus_nr
    get_organelle_config.py --add animal_mt
    get_organelle_config.py --add other_pt


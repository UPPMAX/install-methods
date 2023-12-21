Ansys/2023R2
========================

<https://www.ansys.com/>

Used under license:
commercial software


Structure creating script (makeroom_Ansys_2023R2.sh) moved to /sw/apps/Ansys/makeroom_2023R2.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "Ansys" "-v" "2023R2" "-w" "https://www.ansys.com/" "-c" "apps" "-l" "commercial software" "-d" "ANSYS is a engineering simulation software suite" "-f"
    ./makeroom_Ansys_2023R2.sh
Ansys/2020R1
========================

<https://www.ansys.com/>

Used under license:
commercial software

Structure creating script (makeroom_Ansys_2020R1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Ansys/makeroom_2020R1.sh

LOG
---

    TOOL=Ansys
    VERSION=2020R1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Ansys" -v "2020R1" -w "https://www.ansys.com/" -c "apps" -l "commercial software" -d "ANSYS is a engineering simulation software suite" -x "INSTALL" -f "''"
	cd /sw/apps/Ansys/2020R1/src/FLUIDS_2010R1_LINX64/
	tar -xvf FLUIDS_2020R1_LINX64.tar
# specify the /sw/apps/Ansys/2020R1/rackham directory as install directory
# the licence server was also specified while installing
	./INSTALL

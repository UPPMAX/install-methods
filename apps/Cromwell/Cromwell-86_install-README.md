Cromwell/86
========================

<https://github.com/broadinstitute/cromwell>

Used under license:
BSD 3-Clause


Structure creating script (makeroom_Cromwell_86.sh) moved to /sw/apps/Cromwell/makeroom_86.sh

LOG
---
TOOL=Cromwell
VERSION=86
makeroom.sh "-f" "-t" $TOOL "-v" $VERSION "-c" "apps" "-w" "https://github.com/broadinstitute/cromwell" "-l" "BSD 3-Clause" "-d" "Cromwell is an open-source Workflow Management System for bioinformatics"
    ./makeroom_Cromwell_86.sh
    source /sw/apps/Cromwell/SOURCEME_Cromwell_86 && cd $TOOLDIR
    cd $PREFIX
    wget https://github.com/broadinstitute/cromwell/releases/download/86/cromwell-86.jar
    wget https://github.com/broadinstitute/cromwell/releases/download/86/womtool-86.jar

Test
    ml java/OpenJDK_17+35
    java -jar cromwell-86.jar
    java -jar womtool-86.jar










<https://github.com/broadinstitute/cromwell>

Used under license:
BSD 3-Clause


Structure creating script (makeroom_Cromwell_71.sh) moved to /sw/apps/Cromwell/makeroom_71.sh

LOG
---

    TOOL=Cromwell
    VERSION=71
    makeroom.sh -f -t $TOOL -v $VERSION  -c "apps" -w https://github.com/broadinstitute/cromwell -l 'BSD 3-Clause' -d 'Cromwell is an open-source Workflow Management System for bioinformatics'
 
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $PREFIX

    module load java/OpenJDK_11.0.2

    wget https://github.com/broadinstitute/cromwell/releases/download/71/cromwell-71.jar

    wget https://github.com/broadinstitute/cromwell/releases/download/71/womtool-71.jar


panther/18.0
========================

<https://pantherdb.org/>

Used under license:
Custom
<http://pantherdb.org/tou.jsp>

Structure creating script (makeroom_panther_18.0.sh) moved to /sw/data/panther/makeroom_18.0.sh

LOG
---

    VERSION=18.0

    makeroom.sh "-f" "-t" "panther" "-v" "${VERSION}" "-c" "data" "-w" "http://pantherdb.org/" "-l" "Custom" "-L" "http://pantherdb.org/tou.jsp"
    ./makeroom_panther_${VERSION}.sh
    source /sw/data/panther/SOURCEME_panther_${VERSION}
    cd $SRCDIR

    wget http://data.pantherdb.org/ftp/panther_library/${VERSION}/PANTHER${VERSION}_ascii.tgz
    wget http://data.pantherdb.org/ftp/panther_library/${VERSION}/PANTHER${VERSION}_binary.tgz
    wget http://data.pantherdb.org/ftp/panther_library/${VERSION}/PANTHER${VERSION}_fasta.tgz
    wget http://data.pantherdb.org/ftp/panther_library/${VERSION}/PANTHER${VERSION}_hmmscoring.tgz

Double check that path components need to be stripped.

    for F in *.tgz ; do echo $F; echo;  tar tvf $F | head -n 40; echo; echo; done

Now unpack the databases directly into `PREFIX`, removing the `panther/${VERSION}/` directory components.

    tar xf PANTHER${VERSION}_ascii.tgz       -C $PREFIX --strip-components=3
    tar xf PANTHER${VERSION}_binary.tgz      -C $PREFIX --strip-components=3
    tar xf PANTHER${VERSION}_fasta.tgz       -C $PREFIX --strip-components=0
    tar xf PANTHER${VERSION}_hmmscoring.tgz  -C $PREFIX --strip-components=3

Make sure `PANTHER_ROOT` is correctly set in the mf.

Update module help. Document the directory structure under PREFIX.

    PANTHER18.0_fasta/

and

    PANTHER18.0_altVersion/

this latter with subdirectories

        ascii/
        binary/
        hmmscoring/


tqdm/4.43.0
========================

<https://github.com/tqdm/tqdm>

Used under license:
MIT, MPL 2.0

Structure creating script (makeroom_tqdm_4.43.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/tqdm/makeroom_4.43.0.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "tqdm" -v "4.43.0" -w "https://github.com/tqdm/tqdm" -d "A Fast\, Extensible Progress Bar for Python and CLI" -l "MIT\, MPL 2.0" -c "apps"

LOG
---

    TOOL=tqdm
    VERSION=4.43.0
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "tqdm" -v "4.43.0" -w "https://github.com/tqdm/tqdm" -d "A Fast\, Extensible Progress Bar for Python and CLI" -l "MIT\, MPL 2.0" -c "apps"
    ./makeroom_tqdm_4.43.0.sh
    ml python3
    pip3 install tqdm --target=$PREFIX

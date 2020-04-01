simpleitk/1.2.4
========================

<https://github.com/SimpleITK/SimpleITK>

Used under license:
Apache 2.0

Structure creating script (makeroom_simpleitk_1.2.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/simpleitk/makeroom_1.2.4.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "simpleitk" -v "1.2.4" -w "https://github.com/SimpleITK/SimpleITK" -d "SimpleITK: a layer built on top of the Insight Toolkit \(ITK\)\, intended to simplify and facilitate ITK\'s use in rapid prototyping\, education and interpreted languages." -l "Apache 2.0" -c "apps"

LOG
---

    TOOL=simpleitk
    VERSION=1.2.4
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "simpleitk" -v "1.2.4" -w "https://github.com/SimpleITK/SimpleITK" -d "SimpleITK: a layer built on top of the Insight Toolkit \(ITK\)\, intended to simplify and facilitate ITK\'s use in rapid prototyping\, education and interpreted languages." -l "Apache 2.0" -c "apps"
    ./makeroom_simpleitk_1.2.4.sh
    ml python3
    pip3 install SimpleITK --target=$PREFIX

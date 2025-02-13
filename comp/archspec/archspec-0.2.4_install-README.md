archspec/0.2.4
==============

<https://github.com/archspec/archspec>

Used under license:
Apache 2.0, MIT


Structure creating script (makeroom_archspec_0.2.4.sh) moved to /sw/comp/archspec/makeroom_0.2.4.sh

LOG
---

    makeroom.sh -t archspec -v 0.2.4 -c comp -w https://github.com/archspec/archspec -d "Archspec aims at providing a standard set of human-understandable labels for various aspects of a system architecture like CPU, network fabrics, etc. and APIs to detect, query and compare them." -l "Apache 2.0, MIT"
    ./makeroom_archspec_0.2.4.sh 
    source /sw/comp/archspec/SOURCEME_archspec_0.2.4 && cd $TOOLDIR
    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    which pip3
    pip3 install archspec==0.2.4
    ll venv/bin/
    mkdir bin
    cd bin
    ln -s ../venv/bin/archspec .

Wrap up.

    cd $TOOLDIR
    ./archspec-0.2.4_post-install.sh

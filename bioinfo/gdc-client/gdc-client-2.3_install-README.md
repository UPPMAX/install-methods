gdc-client/2.3
========================

<http://>

Used under license:



Structure creating script (makeroom_gdc-client_2.3.sh) moved to /sw/bioinfo/gdc-client/makeroom_2.3.sh

LOG
---

    makeroom.sh -t gdc-client -v 2.3 -f
    ./makeroom_gdc-client_2.3.sh

    source /sw/bioinfo/gdc-client/SOURCEME_gdc-client_2.3 && cd $SRCDIR

    module load python/3.12.7 gcc
    # needs to be compiled becouse of the old CentoOS7
    git clone https://github.com/NCI-GDC/gdc-client.git
    python3 -m venv venv-gdc-client
    source venv-gdc-client/bin/activate
    
    cd gdc-client
    python3 -m pip install -r requirements.txta
    python3 -m pip install -U setuptools wheel urllib3
    python3 -m pip install --no-deps . 
    cd $PREFIX
    ln -s ../src/venv-gdc-client/bin/gdc-client


ascp/4.4.3.891
=================

<https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line>

Used under license:



Structure creating script (makeroom_ascp_4.4.3.891.sh) moved to /sw/apps/ascp/makeroom_4.4.3.891.sh

LOG
---


    makeroom.sh -f -c apps -t ascp -v 4.4.3.891 -w https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line -d "IBM Aspera File transfer command line transfer"
    ./makeroom_ascp_4.4.3.891.sh 
    source /sw/apps/ascp/SOURCEME_ascp_4.4.3.891 && cd $SRCDIR
    curl -Lso SDK.zip https://ibm.biz/aspera_sdk
    unzip SDK.zip 
    cd linux-x86_64/
    file ascp
    ldd ascp

    cp -av * $PREFIX/

Now for its license.

    mkdir $PREFIX/../etc
    cd ../noarch
    cp -av aspera-license $PREFIX/../etc/

Clean up.  Mf from before is fine.

    cd $TOOLDIR
    ./ascp-4.4.3.891_post-install.sh


ascp/4.2.0.183804
=================


**NOTE** the license ran out 2024/03/13 @ 13:30 so installing newer version with up to date licence, and depracating this.


<https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line>

Used under license:



Structure creating script (makeroom_ascp_4.2.0.183804.sh) moved to /sw/apps/ascp/makeroom_4.2.0.183804.sh

LOG
---


    makeroom.sh -c apps -t ascp -v 4.2.0.183804 -w https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line -d "IBM Aspera File transfer command line transfer"
    ./makeroom_ascp_4.2.0.183804.sh 
    source /sw/apps/ascp/SOURCEME_ascp_4.2.0.183804 && cd $SRCDIR
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


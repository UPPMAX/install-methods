ascp/4.4.4.1308
===============

<https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line>

Used under license:



Structure creating script (makeroom_ascp_4.4.4.1308.sh) moved to /sw/apps/ascp/makeroom_4.4.4.1308.sh


LOG
---

    makeroom.sh -f -c apps -t ascp -v 4.4.4.1308 -w https://www.ibm.com/docs/en/ahts/4.4?topic=linux-ascp-transferring-from-command-line -d "IBM Aspera File transfer command line transfer"
    ./makeroom_ascp_4.4.4.1308.sh 
    source /sw/apps/ascp/SOURCEME_ascp_4.4.4.1308
    cd $SRCDIR
    curl -Lso SDK.zip https://ibm.biz/aspera_sdk
    unzip SDK.zip
    cd linux-x86_64/
    file ascp
    ldd ascp
    cp -av * $PREFIX/
    mkdir $PREFIX/../etc
    cd ../noarch
    cp -av aspera-license $PREFIX/../etc/
    cd $TOOLDIR
    ./ascp-4.4.4.1308_post-install.sh
    history >> ascp-4.4.4.1308_install-README.md

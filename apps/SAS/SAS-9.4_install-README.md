SAS/9.4
========================

<https://www.sas.com/en_us/home.html>

LOG
---

    TOOL=SAS
    VERSION=9.4
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/SAS/makeroom_9.4.sh
    ./makeroom_SAS_9.4.sh
    cd /sw/apps/$TOOL/$VERSION/src
    wget https://myfiles.uu.se/ssf/s/readFile/share/5530/4375091173243821755/publicLink/SAS%20Software%20Disk%201.iso https://myfiles.uu.se/ssf/s/readFile/share/5531/-7933747992125761307/publicLink/SAS%20Software%20Disk%202.iso https://myfiles.uu.se/ssf/s/readFile/share/5532/5496739477910823684/publicLink/SAS%20Software%20Disk%203.iso https://myfiles.uu.se/ssf/s/readFile/share/5533/127200384464777235/publicLink/SAS%20Software%20Disk%204.iso https://myfiles.uu.se/ssf/s/readFile/share/5534/587393062281814897/publicLink/SAS%20Software%20Disk%205.iso https://myfiles.uu.se/ssf/s/readFile/share/5535/3122264632698621553/publicLink/SAS%20Software%20Disk%206.iso https://myfiles.uu.se/ssf/s/readFile/share/5536/-4126657832407808134/publicLink/SAS%20Software%20Disk%207.iso
    wget https://myfiles.uu.se/ssf/s/readFile/share/5537/2844228868147491743/publicLink/SAS94_9BXN77_51302519_LINUX_X86-64.txt
#    wget https://www.gnu.org/software/xorriso/xorriso-1.5.0.tar.gz
#    tar xzf xorriso-1.5.0.tar.gz
#    cd xorriso-1.5.0
#    ./configure
#    make
#    cd ..
    mv SAS\ Software\ Disk\ 1.iso SAS_Software_Disk_1.iso
    mv SAS\ Software\ Disk\ 2.iso SAS_Software_Disk_2.iso
    mv SAS\ Software\ Disk\ 3.iso SAS_Software_Disk_3.iso
    mv SAS\ Software\ Disk\ 4.iso SAS_Software_Disk_4.iso
    mv SAS\ Software\ Disk\ 5.iso SAS_Software_Disk_5.iso
    mv SAS\ Software\ Disk\ 6.iso SAS_Software_Disk_6.iso
    mv SAS\ Software\ Disk\ 7.iso SAS_Software_Disk_7.iso
    mkdir extracted_isos
    for i in {1..7}; do mkdir extracted_isos/disk$i; done
#    screen -R SAS
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_1.iso -extract / extracted_isos/disk1/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_2.iso -extract / extracted_isos/disk2/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_3.iso -extract / extracted_isos/disk3/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_4.iso -extract / extracted_isos/disk4/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_5.iso -extract / extracted_isos/disk5/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_6.iso -extract / extracted_isos/disk6/
#    xorriso-1.5.0/xorriso/xorriso -osirrox on -indev SAS_Software_Disk_7.iso -extract / extracted_isos/disk7/
#    vim rename-files.sh
#    chmod +x rename-files.sh
#    chmod u+w -R extracted_isos
#    ./rename-files.sh extracted_isos

On my laptop and then scp to /sw/apps/SAS/9.4/src/SAS_install

    curl -o disk1.iso https://myfiles.uu.se/ssf/s/readFile/share/5530/4375091173243821755/publicLink/SAS%20Software%20Disk%201.iso -o disk2.iso https://myfiles.uu.se/ssf/s/readFile/share/5531/-7933747992125761307/publicLink/SAS%20Software%20Disk%202.iso -o disk3.iso https://myfiles.uu.se/ssf/s/readFile/share/5532/5496739477910823684/publicLink/SAS%20Software%20Disk%203.iso -o disk4.iso https://myfiles.uu.se/ssf/s/readFile/share/5533/127200384464777235/publicLink/SAS%20Software%20Disk%204.iso -o disk5.iso https://myfiles.uu.se/ssf/s/readFile/share/5534/587393062281814897/publicLink/SAS%20Software%20Disk%205.iso -o disk6.iso https://myfiles.uu.se/ssf/s/readFile/share/5535/3122264632698621553/publicLink/SAS%20Software%20Disk%206.iso -o disk7.iso https://myfiles.uu.se/ssf/s/readFile/share/5536/-4126657832407808134/publicLink/SAS%20Software%20Disk%207.iso -o SAS94_9BXN77_51302519_LINUX_X86-64.txt https://myfiles.uu.se/ssf/s/readFile/share/5537/2844228868147491743/publicLink/SAS94_9BXN77_51302519_LINUX_X86-64.txt

    cd /sw/apps/SAS/9.4/src
    mkdir SAS_install
    cd /sw/apps/SAS/9.4/src/extracted_isos/disk1
    ./setup.sh
Follow onscreen instructions to pre-install in SAS_install
    cd /sw/apps/SAS/9.4/src/SAS_install
    cp ../SAS94_9BXN77_51302519_LINUX_X86-64.txt sid_files/
    ./setup.sh
Follow onscreen instructions to install in /sw/apps/SAS/9.4/rackham/
Pick /sw/apps/SAS/9.4/src/SAS_install/sid_files/SAS94_9BXN77_51302519_LINUX_X86-64.txt
Use defaults
!!!!!!!!!! Remember to include rbrowser !!!!!!!!!!!
Ensure that correct (64-bit) version of rbrowser was selected. 32-bit version fails to find X11 libs.

########### TO UPDATE LICENSE ###############
    /sw/apps/SAS/9.4/rackham/SASDeploymentManager/9.4/sasdm.sh
In the SAS Deployment Manager, select the option to "Renew SAS Software"
Click "Next" as in "http://support.sas.com/documentation/installcenter/en/ikunixplannedri/66610/PDF/default/setinit_planned.pdf"

GoogleCloudSDK/447.0.0
========================

<https://cloud.google.com/sdk>

Used under license:



Structure creating script (makeroom_GoogleCloudSDK_447.0.0.sh) moved to /sw/apps/GoogleCloudSDK/makeroom_447.0.0.sh

LOG
---

They like to hid the download locations, so just look for Earlier releases and
find the latest. I found the 447.0.0 tarball within
https://console.cloud.google.com/storage/browser/cloud-sdk-release;tab=objects?_ga=2.67763665.1557482277.1695478826-1743737562.1695478826&pli=1&prefix=&forceOnObjectsSortingFiltering=false
Use the drop-down menu to fetch the URL.


It sets paths to its install location, so move the thing to PREFIX prior to running `./install.sh`.

    makeroom.sh -f -c apps -t GoogleCloudSDK -v 447.0.0 -w https://cloud.google.com/sdk -d "Command line interfaces for Google Cloud"
    ./makeroom_GoogleCloudSDK_447.0.0.sh 
    source /sw/apps/GoogleCloudSDK/SOURCEME_GoogleCloudSDK_447.0.0
    cd $SRCDIR
    wget https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-447.0.0-linux-x86_64.tar.gz
    tar xf google-cloud-cli-447.0.0-linux-x86_64.tar.gz 
    rmdir $PREFIX && mv google-cloud-sdk $PREFIX
    cd $PREFIX
    ./install.sh 

Remove its updates to my .bashrc.

    vi /home/douglas/.bashrc

Wrap up.

    ./GoogleCloudSDK-447.0.0_post-install.sh

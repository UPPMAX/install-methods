GoogleCloudSDK/455.0.0
========================

<https://cloud.google.com/sdk>

Used under license:

LOG
---


It sets paths to its install location, so move the thing to PREFIX prior to running `./install.sh`.

    makeroom.sh -f -c apps -t GoogleCloudSDK -v 455.0.0 -w https://cloud.google.com/sdk -d "Command line interfaces for Google Cloud"
    ./makeroom_GoogleCloudSDK_455.0.0.sh 
    source /sw/apps/GoogleCloudSDK/SOURCEME_GoogleCloudSDK_455.0.0
    cd $SRCDIR
    wget https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-455.0.0-linux-x86_64.tar.gz
    tar xf google-cloud-cli-455.0.0-linux-x86_64.tar.gz 
    rmdir $PREFIX && mv google-cloud-sdk $PREFIX
    cd $PREFIX
    ./install.sh 

Remove its updates to my .bashrc.

    vi ~/.bashrc

Wrap up.

    ./GoogleCloudSDK-455.0.0_post-install.sh
GoogleCloudSDK/455.0.0
========================

<https://cloud.google.com/sdk>

Used under license:



Structure creating script (makeroom_GoogleCloudSDK_455.0.0.sh) moved to /sw/apps/GoogleCloudSDK/makeroom_455.0.0.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-f" "-c" "apps" "-t" "GoogleCloudSDK" "-v" "455.0.0" "-w" "https://cloud.google.com/sdk" "-d" "Command line interfaces for Google Cloud"
    ./makeroom_GoogleCloudSDK_455.0.0.sh

GoogleCloudSDK/534.0.0
========================

<https://cloud.google.com/sdk>

Used under license:

LOG
---

First, find out what the latest version is.

    mkdir t
    cd t
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
    tar xf google-cloud-cli-linux-x86_64.tar.gz
    cd google-cloud-sdk/
    cat VERSION
    cd ../..
    rm -rf t

We learn that it is 534.0.0 so reference that version directly.


It sets paths to its install location, so move the thing to PREFIX prior to running `./install.sh`.

    makeroom.sh -f -c apps -t GoogleCloudSDK -v 534.0.0 -w https://cloud.google.com/sdk -d "Command line interfaces for Google Cloud"
    ./makeroom_GoogleCloudSDK_534.0.0.sh 
    source /sw/apps/GoogleCloudSDK/SOURCEME_GoogleCloudSDK_534.0.0
    cd $SRCDIR
    wget https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-534.0.0-linux-x86_64.tar.gz
    tar xf google-cloud-cli-534.0.0-linux-x86_64.tar.gz 
    rmdir $PREFIX && mv google-cloud-sdk $PREFIX
    cd $PREFIX
    ./install.sh 

Answer N to the first question, and n to the second question.

Wrap up.

    ./GoogleCloudSDK-534.0.0_post-install.sh


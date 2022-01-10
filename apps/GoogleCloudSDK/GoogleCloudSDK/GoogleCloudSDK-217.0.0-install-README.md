CLUSTER=rackham
OTHERCLUSTERS="snowy irma bianca"
TOOL=/sw/apps/GoogleCloudSDK
VERSION=217.0.0

mkdir -p $TOOL/$VERSION/src
cd $TOOL/$VERSION/src
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-217.0.0-linux-x86_64.tar.gz
tar xf google-cloud-sdk-217.0.0-linux-x86_64.tar.gz
mv google-cloud-sdk ../$CLUSTER

cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done

chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION


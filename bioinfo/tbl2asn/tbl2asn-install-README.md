CLUSTER=rackham
OTHERCLUSTERS="irma bianca snowy"
VERSION=20180629
TOOL=/sw/apps/bioinfo/tbl2asn

mkdir -p $TOOL/$VERSION/{src,$CLUSTER}
cd $TOOL/$VERSION/src
wget ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz
gunzip linux64.tbl2asn.gz
mv linux64.tbl2asn ../$CLUSTER/tbl2asn
chmod a+x ../$CLUSTER/tbl2asn
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

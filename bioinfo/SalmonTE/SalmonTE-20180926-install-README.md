TOOL=/sw/apps/bioinfo/SalmonTE
VERSION=20180926
CLUSTER=rackham
OTHERCLUSTERS="snowy bianca irma"

mkdir -p $TOOL/$VERSION/src
cd $TOOL/$VERSION/src
wget https://github.com/hyunhwaj/SalmonTE/archive/master.zip
unzip master.zip
mv SalmonTE-master ../$CLUSTER
mv master.zip master_20180926.zip

cd ../$CLUSTER
module load python/3.6
reqs="snakemake docopt pandas"
for req in $reqs; do
   PYTHONUSERBASE=$PWD pip3 install $req --user
done
cd ../
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

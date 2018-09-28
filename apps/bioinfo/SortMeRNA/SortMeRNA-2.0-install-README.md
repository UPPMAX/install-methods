# Needed for Qiime 1.9.1
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
TOOL=/sw/apps/bioinfo/SortMeRNA
VERSION=2.0
mkdir -p $TOOL/{$VERSION,src}
cd $TOOL/src
wget https://github.com/biocore/sortmerna/archive/2.0.tar.gz
tar xf $VERSION.tar.gz
cd sortmerna-2.0
./configure --prefix=$TOOL/$VERSION/$CLUSTER
module load gcc/5.4.0
make
make install
# Bug in the makefile makes it stop too early 
# we need to run these manually
make install-indexDATA
make install-sortmernaDATA
# Copy the scripts directory
cp -rf scripts ../../$VERSION/$CLUSTER/
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done

# As adviced by Doug index the database
cd $TOOL/$VERSION/$CLUSTER/sortmerna
for F in rRNA_databases/*.fasta; do
  I=${F#rRNA_databases/}; I=index/${I%.fasta}
  indexdb_rna --ref $F,$I -v 2>&1 | tee $I.indexlog
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

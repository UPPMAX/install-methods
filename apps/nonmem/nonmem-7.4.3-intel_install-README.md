# NONMEM is licensed software.
# The license owner andrew.hooker@farmbio.uu.se has given
# UPPMAX premissions to install NONEMEM on UPPMAX.
# The license owner requests NO UNIX group for the handling
# of the licenses. See RT#195004.

TOOL=/sw/apps/nonmem
TOOLVERSION=7.4.3
VERSION=${TOOLVERSION}-intel
CLUSTER=snowy
OTHERCLUSTERS="rackham"

mkdir -p $TOOL/{mf,$VERSION,$VERSION/src}
cd $TOOL/$VERSION
PREFIX=$PWD/$CLUSTER
cd src
if ! [ -e NONMEM${VERSION}.zip ]; then
    cp ../../${TOOLVERSION}/src/NONMEM${TOOLVERSION}.zip .
	# wget https://nonmem.iconplc.com/nonmem743/NONMEM7.4.3.zip?token=267012D2-D889-11e9-A317-005056911489&html
fi
unzip -P zorx7bqRT NONMEM${TOOLVERSION}.zip 
cd nm743CD
module load intel/19.5
./SETUP74 $PWD $PREFIX ifort y ar same rec i
# During the installation you will need to copy
# in the correct license file. The license file has been supplied
# by the user rikardno in /home/rikardno/nm743/license.
# Anser y to all questions

# Apply a patch to remove the first occurence of u= (roughly line 19)
# in nmfe74
sed -i  '0,/^u=$/{/^u=$/d}' $TOOL/$VERSION/$CLUSTER/run/nmfe74
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done

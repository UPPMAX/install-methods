VERSION=2.0.23
TOOL=/sw/apps/bioinfo/GISTIC
CLUSTER=rackham
OTHERCLUSTERS="irma snowy bianca"

mkdir -p $TOOL/$VERSION/{$CLUSTER,src}
cd $TOOL/$VERSION/
(cd src && wget ftp://ftp.broadinstitute.org/pub/GISTIC2.0/GISTIC_2_0_23.tar.gz)
cp src/GISTIC_2_0_23.tar.gz $CLUSTER
cd $CLUSTER
tar xf GISTIC_2_0_23.tar.gz
cd MCR_INSTALLER
unzip MCRInstaller.zip
./install -mode silent -agreeToLicense yes -destinationFolder $(realpath ../MATLAB_Compiler_Runtime)

cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
   ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

# Finally manually edit gistic2 to not resolve
# paths using `pwd` it mucks it up when you load it from 
# the module system since `pwd` becomes the cwd

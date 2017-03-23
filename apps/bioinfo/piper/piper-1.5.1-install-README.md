# piper-1.5.1-install-README.md

piper
=====

SciLifeLab's own genomics pipeline built on the GATK Queue framework

Installation
------------

Java-based so should only be installed for one cluster. Other clusters should be
sym-linked to the installed cluster folder.

    VERS=1.5.1
    INST=/sw/apps/bioinfo/piper/$VERS
    mkdir $INST/{src,$CLUSTER}
    cd $INST/src
    wget https://github.com/NationalGenomicsInfrastructure/piper/releases/download/$VERS/piper-$VERS.zip
    wget https://github.com/NationalGenomicsInfrastructure/piper/releases/download/$VERS/setupfilecreator-$VERS.zip
    cd ../$CLUSTER
    unzip ../src/piper*
    mv piper-* piper
    unzip ../src/setupfilecreator*
    mv setupfilecreator-* setupfilecreator


A piper config file contains links to a platform folder. Fixed these links to
shared UPPMAX folders but have not yet convinced the platform to commit the fix
to the repo. Currently, I just compare the config file to a copy of the unfixed
file from the previous version and if they match, I copy the fixed file to this
version.

    OLD=1.5.0
    cd $INST/$CLUSTER
    diff -rq piper/conf ../../$OLD/$CLUSTER/piper/conf

"uppmax_global_config.xml" should differ
"uppmax_global_config.xml-orig" only in old version

    diff -s piper/conf/uppmax_global_config.xml ../../$OLD/$CLUSTER/piper/conf/uppmax_global_config.xml-orig

should match

    mv piper/conf/uppmax_global_config.xml piper/conf/uppmax_global_config.xml-orig
    cp ../../$OLD/$CLUSTER/piper/conf/uppmax_global_config.xml .

if they don't match, there are probably just some version changes to fix manually
 
May also need to check/confirm which version of Java to use for the module file.
There has been some uncertainty about this in the past.

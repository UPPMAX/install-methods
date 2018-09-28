# install BRAKER 2 version 2.1.1 from 
 wget http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER2.tar.gz

#installation instructions detailed in user guide
#from snippy adjust and change to 
    VERSION=2.1.1
    PERLVERSION=5.24.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    OTHERCLUSTERS="irma bianca"
    TOOL=/sw/apps/bioinfo/braker
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    ml perl/5.24.1
    ml perl_modules/5.24.1
    BRAKER=$TOOL/$VERSION/$CLUSTER
    PATH=$BRAKER:$PATH
    export PATH
    ml GeneMark/4.33-es_Perl5.24.1
#only done during setup to test if Braker works, the user will be promted to do the next comand 
   cp -av /sw/apps/bioinfo/GeneMark/4.33-es/rackham/gm_key $HOME/.gm_key
   ml augustus/3.2.3_Perl5.24.1
#test if braker runs 
   braker.pl
#get a good framework for the mf file
   cp 4.33-es_Perl5.24.1 $BRAKER/
   cd $BRAKER
   mv 4.33-es_Perl5.24.1 $TOOL/mf/
   cd $TOOL/mf/
   mv 4.33-es_Perl5.24.1 2.1.1_Perl5.24.1
   rm BRAKER2.tar.gz


# Also, change the `#!` lines in the perl files to be `#!/usr/bin/env perl`.
# first install do the foolowing instalation steps
   mkdir /sw/mf/common/bioinfo-tools/misc/braker/ 
   cp mf/$VERSION_Perl$PERLVERSION /sw/mf/common/bioinfo-tools/misc/braker
   all_mflink braker 2.1.1_Perl5.24.1/

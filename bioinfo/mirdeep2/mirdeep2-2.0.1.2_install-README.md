mirdeep2/2.0.1.2
========================

<https://github.com/rajewsky-lab/mirdeep2>

Used under license:
GPL v3

Structure creating script (makeroom_mirdeep2_2.0.1.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/mirdeep2/makeroom_2.0.1.2.sh


export PATH=$PATH:/sw/bioinfo/mirdeep2/2.0.1.2/rackham/bin
PERL_MB_OPT="--install_base $PREFIX";export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=$PREFIX";export PERL_MM_OPT
export PERL5LIB=/sw/bioinfo/mirdeep2/2.0.1.2/rackham/lib/perl5

cd $VERSIONDIR
rm -rf rackham
    git clone https://github.com/rajewsky-lab/mirdeep2.git rackham
    cd rackham
    perl install.pl
Remove all the junk from your .bashrc!!! 
    perl install.pl

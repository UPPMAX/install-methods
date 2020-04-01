MetaCRAST/2019-04-05-1779453
========================

<https://github.com/molleraj/MetaCRAST>

Used under license:
GPL v3

Structure creating script (makeroom_MetaCRAST_2019-04-05-1779453.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MetaCRAST/makeroom_2019-04-05-1779453.sh

LOG
---

Reading its `local_install.sh` script, it needs BioPerl, some other perl
modules, cd-hit, and some perm changes.  So, load BioPerl and that will get the
other modules in.

#!/bin/sh
# How to install
# IN HOME FOLDER: git clone https://github.com/molleraj/MetaCRAST.git
# chmod 777 ~/MetaCRAST/local_install.sh or sh local_install.sh
# install cd-hit
sudo apt-get install cd-hit

# install CPAN packages
sudo cpan install Text::Levenshtein::XS String::Approx Getopt::Std Bio::SeqIO Bio::Perl MCE MCE::Loop MCE::Shared

# install dependencies for fasta-splitter.pl
sudo cpan install File::Util File::Path File::Basename Getopt::Long

# make bin files executable
sudo chmod 777 ~/MetaCRAST/bin/*

# add MetaCRAST and MetaCRAST/bin to PATH
export PATH=$HOME/MetaCRAST/bin:$PATH
sudo echo "export PATH=$HOME/MetaCRAST/bin:$PATH" >> ~/.bash_profile
sudo echo "export PATH=$HOME/MetaCRAST/bin:$PATH" >> ~/.profile
source ~/.bash_profile
source ~/.profile

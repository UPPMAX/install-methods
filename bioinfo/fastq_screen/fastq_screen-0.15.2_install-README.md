fastq_screen/0.15.2
===================

<https://stevenwingett.github.io/FastQ-Screen/>

Used under license:

GPLv3


Structure creating script (makeroom_fastq_screen_0.15.2.sh) moved to /sw/bioinfo/fastq_screen/makeroom_0.15.2.sh

LOG
---


makeroom.sh -f -c data -t fastq_screen_data -v 20220330 -w https://stevenwingett.github.io/FastQ-Screen/ -d "Reference genomes for FastQ Screen, both standard and bisulfite" 
./makeroom_fastq_screen_data_20220330.sh 
source /sw/data/fastq_screen_data/SOURCEME_fastq_screen_data_20220330 && cd $TOOLDIR

    cd /sw/bioinfo/fastq_screen/
    makeroom.sh -f -t fastq_screen -v 0.15.2 -w https://stevenwingett.github.io/FastQ-Screen/ -d "Contmaination screening for NGS data sets" 
    ./makeroom_fastq_screen_0.15.2.sh 
    source /sw/bioinfo/fastq_screen/SOURCEME_fastq_screen_0.15.2 && cd $SRCDIR
    wget https://github.com/StevenWingett/FastQ-Screen/archive/refs/tags/v0.15.2.tar.gz
    tar xf v0.15.2.tar.gz 
    cd FastQ-Screen-0.15.2/

Change `#!` line to use `#!/usr/bin/env perl`.

    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' fastq_screen

Replace prefix directory with unpacked directory.

    rmdir $PREFIX
    mv FastQ-Screen-0.15.2 $PREFIX
    cd $PREFIX

Run while loading perl/5.26.2 and perl_modules/5.26.2, the latter for GD and GD::Graph.


937  ls
938  ll
939  ll download_genomes/
940  ll download_genomes/bisulfite_genomes_config_file/
941  cat download_genomes/README.md 
942  ll Misc/
943  ll
944  head fastq_screen
945  sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' fastq_screen
1009  cd /sw/bioinfo
1010  ll
1011  cd fastq_screen/
1012  ll
1013  source SOURCEME_fastq_screen_0.15.2
1014  cd $TOOLDIR
1015  cd $SRCDIR
1016  ll
1017  cd FastQ-Screen-0.15.2/
1018  ll
1019  cd ..
1020  rmdir $PREFIX
1021  mv FastQ-Screen-0.15.2 $PREFIX
1022  cd $PREFIX
1023  ll
1024  ml perl_modules/5.26.2
1025  ll
1026  head fastq_screen
1027  perl -d -e 0
1028  cd ../..
1029  ll
1030  history >> fastq_screen-0.15.2_install-README.md

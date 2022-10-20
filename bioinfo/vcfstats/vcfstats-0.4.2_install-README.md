vcfstats/0.4.2
========================

<https://github.com/pwwang/vcfstats>

Used under license:
Other


Structure creating script (makeroom_vcfstats_0.4.2.sh) moved to /sw/bioinfo/vcfstats/makeroom_0.4.2.sh

LOG
---
  TOOL=vcfstats
  VERSION=0.4.2

  /home/pmitev/GIT/install-methods/makeroom.sh "-t" "vcfstats" "-v" "0.4.2" "-w" "https://github.com/pwwang/vcfstats" "-c" "bioinfo" "-s" "misc" "-l" "Other" "-d" "Powerful statistics for VCF files"
  ./makeroom_vcfstats_0.4.2.sh
  cd $SRCDIR

  module load python/3.9.5
  PYTHONUSERBASE=$PREFIX pip install $TOOL==$VERSION -I numpy -I scipy -I matplotlib==3.5.3

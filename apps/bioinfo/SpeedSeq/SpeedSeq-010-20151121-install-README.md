    mkdir -p /sw/apps/bioinfo/SpeedSeq
    cd /sw/apps/bioinfo/SpeedSeq
    mkdir -p 0.1.0-20151121 mf

Adding the date because I am cloning the repository, not the 0.1.0 release.

    cd 0.1.0-20151121
    git clone --recursive https://github.com/hall-lab/speedseq

    mv speedseq milou
    cd milou/
    export SPEEDSEQ_DIR=$PWD
    module load git/2.5.0
    module load gcc/4.9.2
    module load python/2.7.6
    make

In the process, I learned that scipy for python/2.7.6 (together with a few
other modules that were removed because of me) was wesley:wesley and I could
not access it.  Moved it to another name, reinstalled it, and made sure the
rest was group sw.

    cd src/cnvnator/bin
    cp cnvnator_wrapper.py annotate_rd.py ../../../bin/
    cd ../../..

Now modify speedseq.config to point to the variant_effect_predictor.pl script
from vep/82 and the VEP cache from /sw/data/uppnex/vep/82, and the cnvnator
from CNVnator/0.3.2.  The original config wanted cnvnator-multi, but that is
built by default with CNVnator/0.3.2.

    vi bin/speedseq.config

Now test out the install.

    cd example
    ./run_speedseq.sh 


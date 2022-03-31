CPLEXOptimizationStudio/20.10
========================

<https://www.ibm.com/se-en/analytics/cplex-optimizer>

Used under license:
IBM Academic
<https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students?mhsrc=ibmsearch_a&mhq=cplex%20academic>

Structure creating script (makeroom_CPLEXOptimizationStudio_20.10.sh) moved to /sw/apps/CPLEXOptimizationStudio/makeroom_20.10.sh

LOG
---

    makeroom.sh -t CPLEXOptimizationStudio -v 20.10 -c apps -w https://www.ibm.com/se-en/analytics/cplex-optimizer -l "IBM Academic" -L "https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students?mhsrc=ibmsearch_a&mhq=cplex%20academic" -d "CPLEX Optimizer provides flexible, high-performance mathematical programming solvers for linear programming, mixed integer programming, quadratic programming and quadratically constrained programming problems. These solvers include a distributed parallel algorithm for mixed integer programming to leverage multiple computers to solve difficult problems."
    ./makeroom_CPLEXOptimizationStudio_20.10.sh 
    source /sw/apps/CPLEXOptimizationStudio/SOURCEME_CPLEXOptimizationStudio_20.10 && cd $SRCDIR

Transfer over 20.10 files retrieved to desktop.

    rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/ILOG* .

See where PREFIX is, remember this:

    echo $PREFIX

Now install from installer.

    chmod +x *bin
    ./ILOG_COS_20.10_LINUX_X86_64.bin -i console

And, following its instructions, install python interface. Turns out, this includes cplex only for python3.7 and python3.8.


    ml python/3.8.7
    python /sw/apps/CPLEXOptimizationStudio/20.10/rackham/python/setup.py install --prefix $PREFIX
    ml python/3.7.2
    python /sw/apps/CPLEXOptimizationStudio/20.10/rackham/python/setup.py install --prefix $PREFIX

The quick start guides are not very helpful.

    unzip ILOG_CPLEX_OPT_STUDIO_20.10_QSG.zip 
    evince CPLEX_OptimizationStudio201_QuickStartGuide.pdf

CPLEXOptimizationStudio/12.9.0
========================

<https://www.ibm.com/se-en/analytics/cplex-optimizer>

Used under license:
IBM Academic
<https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students?mhsrc=ibmsearch_a&mhq=cplex%20academic>

Structure creating script (makeroom_CPLEXOptimizationStudio_12.9.0.sh) moved to /sw/apps/CPLEXOptimizationStudio/makeroom_12.9.0.sh

LOG
---

    makeroom.sh -t CPLEXOptimizationStudio -v 12.9.0 -c apps -w https://www.ibm.com/se-en/analytics/cplex-optimizer -l "IBM Academic" -L "https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students?mhsrc=ibmsearch_a&mhq=cplex%20academic" -d "CPLEX Optimizer provides flexible, high-performance mathematical programming solvers for linear programming, mixed integer programming, quadratic programming and quadratically constrained programming problems. These solvers include a distributed parallel algorithm for mixed integer programming to leverage multiple computers to solve difficult problems."
    ./makeroom_CPLEXOptimizationStudio_12.9.0.sh 
    source /sw/apps/CPLEXOptimizationStudio/SOURCEME_CPLEXOptimizationStudio_12.9.0 && cd $SRCDIR

Transfer over 12.9.0 files retrieved to desktop.

    rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/CPLEX* .
    rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/cplex* .

See where PREFIX is, remember this:

    echo $PREFIX

Now install from installer.

    chmod +x cplex_studio129.linux-x86-64.bin 
    ./cplex_studio129.linux-x86-64.bin -i console

And, following its instructions, install python interface. Turns out, this includes cplex only for python3.7 and python3.8.


    ml python/3.6.8
    cd /sw/apps/CPLEXOptimizationStudio/12.9.0/rackham/python/
    python setup.py install --prefix $PREFIX
    ml python/3.7.2
    python setup.py install --prefix $PREFIX


Gurobi/9.5.1
========================

<https://www.gurobi.com/downloads/gurobi-software>

Used under license:
Academic License


Structure creating script (makeroom_Gurobi_9.5.1.sh) moved to /sw/apps/Gurobi/makeroom_9.5.1.sh

LOG
---

    TOOL=Gurobi
    VERSION=9.5.1

    makeroom.sh -t $TOOL -v $VERSION -w "https://www.gurobi.com/downloads/gurobi-software" -c "apps" -l "Academic License" -d "The fastest and most powerful mathematical programming solver available for your LP, QP and MIP (MILP, MIQP, and MIQCP) problems."  -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

  

   cd $SRCDIR
   wget https://packages.gurobi.com/9.5/gurobi9.5.1_linux64.tar.gz
   rmdir $PREFIX
   mv gurobi951 $PREFIX

Running licence
   $PREFIX/linux64/bin/grbgetkey 156e7f9c-a694-11ec-a24e-0242c0a81004

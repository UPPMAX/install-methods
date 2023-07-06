Gurobi/10.0.2
========================

<https://www.gurobi.com/downloads/gurobi-software>

Used under license:
Academic License


Structure creating script (makeroom_Gurobi_10.0.2.sh) moved to /sw/apps/Gurobi/makeroom_10.0.2.sh

LOG
---

    TOOL=Gurobi
    VERSION=10.0.2

    makeroom.sh -t $TOOL -v $VERSION -w "https://www.gurobi.com/downloads/gurobi-software" -c "apps" -l "Academic License" -d "The fastest and most powerful mathematical programming solver available for your LP, QP and MIP (MILP, MIQP, and MIQCP) problems."  -f

    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/apps/Gurobi/SOURCEME_Gurobi_10.0.2 && cd $TOOLDIR


   cd $SRCDIR
   wget https://packages.gurobi.com/10.0/gurobi10.0.2_linux64.tar.gz
   tar xzvf gurobi10.0.2_linux64.tar.gz
   rmdir $PREFIX
   mv gurobi1002 $PREFIX

Edit mf file: be sure GRB_LICENSE_FILE is correctly set

##Licenses

We need two (2!!!) academic floating server licenses, one for Rackham+Snowy and one for Bianca.
Contact: license@gurobi.zendesk.com
on local computer
https://portal.gurobi.com/iam/licenses/list/
Press INSTALL button and see the license key to be used below

### On Rackham
Running license
    cd $PREFIX
    $PREFIX/linux64/bin/grbgetkey 5946c48d-66c7-41cc-88ec-72560a414cdd   # change accordingly
    choose present dir (`.`) for license
Edit mf file: be sure GRB_LICENSE_FILE is correctly set
Start floating token server
    ml Gurobi
    grb_ts
test from somewhere else (other user, on compute node on Rackham/Snowy)
    ml Gurobi
    gurobi_cl    
   
### License for Bianca (still do the work from Rackham)
    cd $VERSIONDIR
    rm bianca
    mkdir bianca
    cd src
    tar xzvf gurobi10.0.2_linux64.tar.gz
    mv gurobi1002/* ../bianca/
    
Start Bianca session
    ml Gurobi
    grbprobe

on local computer
https://portal.gurobi.com/iam/licenses/list/
For the other license: INSTALL --> manual installation --> copy-paste the grbprobe output
--> submit --> download
if download is not available, close and hit INSTALL again and press download
transfer license file to /sw/apps/Gurobi/<version>/bianca (on Rackham cluster)

Wait for sync

Start floating token server
    ml Gurobi
    grb_ts
test from somewhere else (other user, other project, on compute node Bianca)
    ml Gurobi
    gurobi_cl

Cross fingers!


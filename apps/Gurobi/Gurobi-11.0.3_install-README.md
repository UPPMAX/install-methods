Gurobi/11.0.3
========================

<https://www.gurobi.com/downloads/gurobi-software>

Used under license:
Academic License


Structure creating script (makeroom_Gurobi_11.0.3.sh) moved to /sw/apps/Gurobi/makeroom_11.0.3.sh

LOG
---

    TOOL=Gurobi
    VERSION=11.0.3

    makeroom.sh -t $TOOL -v $VERSION -w "https://www.gurobi.com/downloads/gurobi-software" -c "apps" -l "Academic License" -d "The fastest and most powerful mathematical programming solver available for your LP, QP and MIP (MILP, MIQP, and MIQCP) problems."  -f

    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/apps/Gurobi/SOURCEME_Gurobi_11.0.3 && cd $TOOLDIR


   cd $SRCDIR
   wget https://packages.gurobi.com/11.0/gurobi11.0.3_linux64.tar.gz
   tar xzvf gurobi11.0.3_linux64.tar.gz
   rmdir $PREFIX
   mv gurobi1103 $PREFIX


##Licenses

We need two (2!!!) academic floating server licenses, one for Rackham+Snowy and one for Bianca.
Contact: license@gurobi.zendesk.com
on local computer
https://portal.gurobi.com/iam/licenses/list/
Press INSTALL button and see the license key to be used below

### On Rackham
Running license
    cd $TOOLDIR/licenses
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
    cp -r $PREFIX/* bianca/
    
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
If this does not work since the module itself fails do:
    export GRB_LICENSE_FILE=/sw/apps/Gurobi/licenses/bianca/gurobi.lic
    cd $PREFIX/linux64/bin
    grb_ts

use the mf file from v10 and onwards.
#start token locally
    # Spoof the MAC address.
    set ::env(LD_PRELOAD) /usr/local/flexlm/lib/libmacspoof.so.1.0.1
    set ::env(MAC_ADDRESS) fa:16:3e:b4:13:4f
    exec $modroot/linux64/bin/grb_ts

    make sure hostid is the one given in the license (same as the grb_ts is run on)

test from somewhere else (other user, other project, on compute node Bianca)
    ml Gurobi
    gurobi_cl




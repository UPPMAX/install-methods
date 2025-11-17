Gurobi/12.0.3
========================

<https://www.gurobi.com/downloads/gurobi-software>

Used under license:
Academic License


Structure creating script (makeroom_Gurobi_12.0.3.sh) moved to /sw/apps/Gurobi/makeroom_12.0.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "Gurobi" "-v" "12.0.3" "-w" "https://www.gurobi.com/downloads/gurobi-software" "-c" "apps" "-l" "Academic License" "-d" "The fastest and most powerful mathematical programming solver available for your LP, QP and MIP (MILP, MIQP, and MIQCP) problems." "-f"
    ./makeroom_Gurobi_12.0.3.sh
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


## Licenses

- We need two (2!!!) academic floating server licenses, one for Rackham+Snowy and one for Bianca.
- Björn C registered an account at Gurobi: https://portal.gurobi.com/iam/register/
- Contact: license@gurobi.zendesk.com
    - You should ask for a Floating-Use academic license
- Wait until license is set up (they confirm by email)
  - on local computer: https://portal.gurobi.com/iam/licenses/list/
  - Press INSTALL button and see the license key to be used below

### On Rackham
- Running license
  
    cd $TOOLDIR/licenses
    $PREFIX/linux64/bin/grbgetkey 5946c48d-66c7-41cc-88ec-72560a414cdd   # change accordingly

- choose present dir (`.`) for license
- Edit mf/module file: be sure GRB_LICENSE_FILE is correctly set
- Start floating token server

    ml Gurobi
    grb_ts

- test from somewhere else (other user, on compute node on Rackham/Snowy)

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
  if module fails to load, from /sw/apps/Gurobi do
    12.0.3/bianca/linux64/bin/grbprobe  

on local computer
https://portal.gurobi.com/iam/licenses/list/
For the other license: INSTALL --> manual installation --> copy-paste the grbprobe output
--> submit --> download
if download is not available, close and hit INSTALL again and press download
transfer license file to /sw/apps/Gurobi/licenses/bianca (on Rackham cluster)

Wait for sync

Start floating token server
    ml Gurobi
    grb_ts
If this does not work since the module itself fails do:
    export GRB_LICENSE_FILE=/sw/apps/Gurobi/licenses/bianca/gurobi.lic
    cd $PREFIX/linux64/bin
    grb_ts

# Let Arvid or other system expert 
  updates the file /opt/gurobi/gurobi.lic    
use the mf file from v10 and onwards.
#start token locally
    # Spoof the MAC address.
    set ::env(LD_PRELOAD) /usr/local/flexlm/lib/libmacspoof.so.1.0.1
    set ::env(MAC_ADDRESS) fa:16:3e:f7:08:62 (fa:16:<HOSTID>)
    exec $modroot/linux64/bin/grb_ts

    make sure hostid is the one given in the license (same as the grb_ts is run on)

test from somewhere else (other user, other project, on compute node Bianca)
    ml Gurobi
    gurobi_cl




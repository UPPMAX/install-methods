Vapor/3.3.0
========================

<https://www.vapor.ucar.edu/>

Used under license:
Apache v2.0 license
<>

Structure creating script (makeroom_Vapor_3.3.0.sh) moved to /sw/apps/Vapor/makeroom_3.3.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "Vapor" -v "3.3.0" -w "https://www.vapor.ucar.edu/" -c "apps" -l "Apache v2.0 license" -d "VAPOR is the Visualization and Analysis Platform for Ocean\\, Atmosphere\\, and Solar Researchers. VAPOR provides an interactive 3D visualization environment that can also produce animations and still frame images." -u "rackham snowy" -x "INSTALL" -f
    ./makeroom_Vapor_3.3.0.sh

    wget https://github.com/NCAR/VAPOR/releases/download/3.2.0/VAPOR3-3.2.0-CentOS7.sh
    sh VAPOR3-3.3.0-CentOS7.sh
    cp -r bin $PREFIX
    cd $PREFIX/bin
    mv vapor vapor.real
# make bash wrapper called "vapor"

#!/bin/bash
#
# This should be used as a wrapper with the original binary moved to
# NAME.real
#
# Pontus Freyhult, 2017
# Shortend by Björn Claremar, 2021
#
pname=`basename $0`

runname="$0.real"
  vglrun -c proxy "$runname" "$@"    
     
#--------------
#ssh to rackham[1-4]
     ./vapor &	# to test    


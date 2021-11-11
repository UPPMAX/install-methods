WPS-geog/4
========================

<https://www2.mmm.ucar.edu/wrf/users/download/get_sources_wps_geog.html>

Used under license:
Custom open-source AS IS


Structure creating script (makeroom_WPS-geog_4.sh) moved to /sw/data/WPS-geog/makeroom_4.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "WPS-geog" -v "4" -w "https://www2.mmm.ucar.edu/wrf/users/download/get_sources_wps_geog.html" -c "data" -l "Custom open-source AS IS" -d "WPS static geodata" -u "rackham snowy" -x "INSTALL"
    ./makeroom_WPS-geog_4.sh
    cd $PREFIX
    wget https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
    tar xvf 
#   include landuse data from Corine and topographic data from Metria 
#   these were prepared by Björn Claremar in 2019 and now put in the $TOOLDIR directory 
#   link to present version of WPS_geog
    cd WPS_GEOG
    ln -s $TOOLDIR/Corine Corine
    ln -s $TOOLDIR/metria metria
#   put GEOGRID.TBL file taking care of Corine and metria in that directory (may change in newer versions)
    #cp /proj/staff/bjornc/WRF/WPS-4.1/geogrid/GEOGRID.TBL.ARW.corine_metria  .

#    


python_GIS_packages/3.10.8
========================

<http://>

Used under license:
Various


Structure creating script (makeroom_python_GIS_packages_3.10.8.sh) moved to /sw/apps/python_GIS_packages/makeroom_3.10.8.sh

LOG
---
    TOOL=python_GIS_packages
    VERSION=3.10.8

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "python_GIS_packages" "-v" "3.10.8" "-c" "apps" "-l" "Various" "-d" "Python package for GIS installation" "-f"
    ./makeroom_python_GIS_packages_3.10.8.sh
    source /sw/apps/python_GIS_packages/SOURCEME_python_GIS_packages_3.10.8 && cd $TOOLDIR
 
    cd $PREFIX

    PYTHONUSERBASE=$PREFIX pip install --user 

    ml python/3.10.8
    ml gcc/12.2.0
    ml GEOS/3.11.2-gcc12.2.0


    PYTHONUSERBASE=$PREFIX pip install --user \
 contextily==1.2.0\
 folium==0.14.0\
 geojson==2.5.0\
 geopandas==0.12.2\
 geoplot==0.5.1\
 geopy==2.3.0\
 mplleaflet==0.0.5\
 openpyxl==3.1.0\
 osmnx==1.3.0\
 owslib==0.27.2\
 pygeos==0.14\
 pykrige==1.7.0\
 pyrosm==0.6.1\
 pysal==23.1\
 rasterio==1.3.4\
 rasterstats==0.17.0\
 scipy==1.10.0\
 seaborn==0.12.2\
 xarray==2023.1.0\
 xarray_leaflet==0.2.3\
 xarray-spatial==0.3.5\
 shapely\
 sqlalchemy


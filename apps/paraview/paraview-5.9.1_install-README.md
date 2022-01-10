paraview/5.9.1
========================

<https://www.paraview.org/>

Used under license:
BSD


Structure creating script (makeroom_paraview_5.9.1.sh) moved to /sw/apps/paraview/makeroom_5.9.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "paraview" "-v" "5.9.1" "-w" "https://www.paraview.org/" "-c" "apps" "-l" "BSD" "-d" "ParaView is an open-source, multi-platform data analysis and visualization application. ParaView users can quickly build visualizations to analyze their data using qualitative and quantitative techniques. " "-x" "INSTALL" "-f"
    ./makeroom_paraview_5.9.1.sh
    source /sw/apps/paraview/SOURCEME_paraview_5.9.1 && cd $TOOLDIR
    cd $SRCDIR
    #wget is blocked for download site. Instead downloading to computer and upload to $SRCDIR
    #https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.9&type=binary&os=Linux&downloadFile=ParaView-5.9.1-MPI-Linux-Python3.8-64bit.tar.gz

    tar xfz 
    cd ParaView-5.9.1-MPI-Linux-Python3.8-64bit/
    cp -r * $PREFIX/
    cd $PREFIX/bin

# make vgl alias of paraview binary
    mv paraview paraview.real
    echo vgl_paraview > paraview
#   vglrun -c proxy paraview.real 
#   add following line in mf file:
#	set-alias       vgl_paraview    "vglrun -c proxy paraview.real"
#   set correct python version
#	module load python/3.8.7
#	prepend-path    PYTHONPATH     /sw/apps/paraview/$version/$Cluster/lib/python3.8


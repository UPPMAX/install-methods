VMD/1.9.4-alpha-57
========================

<https://www.ks.uiuc.edu/Research/vmd/>

Used under license:
University of Illinois Open Source License
<https://www.ks.uiuc.edu/Research/vmd/current/LICENSE.html>

Structure creating script (makeroom_VMD_1.9.4-alpha-57.sh) moved to /sw/apps/VMD/makeroom_1.9.4-alpha-57.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "VMD" "-v" "1.9.4-alpha-57" "-w" "https://www.ks.uiuc.edu/Research/vmd/" "-c" "apps" "-l" "University of Illinois Open Source License" "-L" "https://www.ks.uiuc.edu/Research/vmd/current/LICENSE.html" "-d" "molecular visualization program for displaying, animating, and analyzing large biomolecular systems using 3-D graphics and built-in scripting." "-x" "INSTALL"
    ./makeroom_VMD_1.9.4-alpha-57.sh
    cd $SRCDIR
    # register or use user account and download from  at https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=VMD    
    # put file in $SRCDIR
    tar zxvf vmd-1.9.4a57.bin.LINUXAMD64-CUDA102-OptiX650-OSPRay185.opengl.tar.gz
    cd vmd-1.9.4a57/
    vi configure
    # Directory where VMD startup script is installed, should be in users´ paths.
      $install_bin_dir="/sw/apps/VMD/1.9.4-alpha-57/rackham/bin";
    # Directory where VMD files and executables are installed
      $install_library_dir="/sw/apps/VMD/1.9.4-alpha-57/rackham/lib/$install_name";
    # This sets installing path to $PREFIX
    ./configure
    cd src/
    make install 	#Note: do NOT 'make' first
    # check and test
    cd $PREFIX
    ls bin
    ls lib
    bin/vmd &

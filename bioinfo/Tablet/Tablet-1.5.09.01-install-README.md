Tablet 1.15.09.01
=================

<https://ics.hutton.ac.uk/tablet/>

Log
---

    TOOLDIR=/sw/apps/bioinfo/Tablet
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    VERSION=1.15.09.01
    mkdir $VERSION
    cd $VERSION
    mkdir milou
    ln -s ./milou halvan
    ln -s ./milou nestor
    ln -s ./milou tintin
    mkdir install
    mkdir src
    wget http://bioinf.hutton.ac.uk/tablet/installers/tablet_linux_x64_1_15_09_01.sh
    bash tablet_linux_x64_1_15_09_01.sh 

This starts an X installer using Java.  I set the install directory as
$TOOLDIR/$VERSION/install/Tablet and the symlink directory as
$TOOLDIR/$VERSION/milou.  This places a tablet symlink for milou/ and simply
running this gets the app.  Since it is Java the other clusters get it via
symlinks to milou/.


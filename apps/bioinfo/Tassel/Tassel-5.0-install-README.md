Tassel 5.0
==========

    cd /sw/apps/bioinfo
    mkdir Tassel
    cd Tassel
    mkdir 5.0
    cd 5.0/
    mkdir milou src

Java program, so we can link tintin here as well.

    ln -s ./milou tintin
    ln -s ./milou halvan
    ln -s ./milou nestor

    cd src/
    git clone https://bitbucket.org/tasseladmin/tassel-5-standalone.git
    cd tassel-5-standalone/

Change the format of the perl scripts, update the perl #! lines, allocate
-Xmx3500m by default, and deactivate the bat files.

    dos2unix *.pl
    vi *.pl
    chmod -x *.bat

Copy to install directory

    cp -a * ../../milou

Make sure it works.

    module load java/sun_jdk1.8.0_40
    ./start_tassel.pl 

For the mf file, must load java 8, see above.

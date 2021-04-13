GhostPDL/9.53.3
========================

<https://ghostscript.com>

Used under license:
Gnu GPL Affero v3
<http://www.gnu.org/licenses/agpl-3.0.html>

Structure creating script (makeroom_GhostPDL_9.53.3.sh) moved to /sw/apps/GhostPDL/makeroom_9.53.3.sh

LOG
---

Build the tools, and the shared library + header files and other stuff.

    TOOL=GhostPDL
    VERSION=9.53.3
    makeroom.sh -t "GhostPDL" -v "9.53.3" -c "apps" -w "https://ghostscript.com" -d "interpreter for page description languages PS, PDF, XPS, PCL" -l "Gnu GPL Affero v3" -L "http://www.gnu.org/licenses/agpl-3.0.html"
    ./makeroom_GhostPDL_9.53.3.sh
    cd $SRCDIR
    wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9533/ghostpdl-9.53.3.tar.gz
    tar xf ghostpdl-0.53.3.tar.gz
    cd ghostpdl-9.53.3
    ./configure --prefix=$PREFIX
    make && make install
    make install-so
    make install-contrib-extras

Get additional fonts.

   wget https://downloads.sourceforge.net/project/gs-fonts/gs-fonts/6.0%20%28misc%2C%20AFPL%29/ghostscript-fonts-other-6.0.tar.gz
   tar xf ghostscript-fonts-other-6.0.tar.gz
   mv fonts $PREFIX/share/

For the mf file, prepend 

* $modroot/bin to PATH.
* $modroot/lib to LD_RUN_PATH.
* $modroot/lib to LD_LIBRARY_PATH.
* $modroot/lib to LIBRARY_PATH.
* $modroot/include/ghostscript to CPATH.
* $modroot/include/ghostscript to CPLUS_INCLUDE_PATH.
* $modroot/include to CPATH.
* $modroot/include to CPLUS_INCLUDE_PATH.
* $modroot/share/man to MANPATH.
* $modroot/share/fonts to GS_FONTPATH

and note documentation starting at $modroot/share/doc/ghostscript/index.html

DBG2OLD
=======

Efficient Assembly of Large Genomes Using the Compressed Overlap Graph

DBG2OLC
-------
<https://sites.google.com/site/dbg2olc/>
<http://sourceforge.net/projects/dbg2olc/files/>
<http://sourceforge.net/p/dbg2olc/code/ci/master/tree/>
<http://arxiv.org/abs/1410.2801>

Sparc
-----
<http://sourceforge.net/projects/sparc-consensus/>
<http://sourceforge.net/p/sparc-consensus/code/ci/master/tree/>
<https://peerj.com/preprints/1401.pdf>

Log
----

    cd /sw/apps/bioinfo
    mkdir DBG2OLC
    cd DBG2OLC/

There is a linux executable, but I would rather build from source.  I am taking
the version from the last-update date of the linux package from sourceforge.
The source package also includes some utilities.  Nonetheless, get the linux
package to get the manual.

    mkdir 20151208
    cd 20151208
    mkdir milou
    ln -s ./milou halvan
    ln -s ./milou nestor
    mkdir tintin
    mkdir src
    cd src
    git clone http://git.code.sf.net/p/dbg2olc/code dbg2olc-code
    wget http://downloads.sourceforge.net/project/dbg2olc/DBG2OLC_Linux.zip
    unzip DBG2OLC_Linux.zip 
    cd DBG2OLC_Linux/

Build PDF version of DBG2OLC_Manual.docx and copy both to the cluster directory.

    # build pdf, then
    cp DBG2OLC_Manual.* ../../milou/
    cp DBG2OLC_Manual.* ../../tintin/
    cd ..

Build the tool, and redo for tintin:

    cd dbg2olc-code/
    module load gcc/4.9.2
    g++ -o DBG2OLC -O3 *.cpp
    cp DBG2OLD ../../milou

    cd utility/
    dos2unix *

The *.txt files are example usages of the shell and python scripts.

    chmod +x split_*
    cp * ../../../milou/
    cp * ../../../tintin/

Get the Sparc assembler.  It has a `utility/` directory that duplicates what is
in DBG2OLC.

    cd ../../
    git clone http://git.code.sf.net/p/sparc-consensus/code sparc-consensus-code
    cd sparc-consensus-code/
    g++ -o Sparc -O3 *.cpp
    cp Sparc ../../milou/

Now check for a manual for Sparc in the Linux executable.

    cd ../..
    wget http://downloads.sourceforge.net/project/sparc-consensus/Sparc_Linux.zip
    unzip Sparc_Linux.zip 
    cd Sparc_Linux/

Create PDF from SparcManual.docx.  Then

    cp SparcManual.* ../../milou
    cp SparcManual.* ../../tintin


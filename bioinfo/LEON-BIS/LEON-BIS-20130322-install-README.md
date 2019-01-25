LEON-BIS 20130321
=================

<http://www.lbgi.fr/~julie/LEON-BIS/>

Versioned based on the date on the download file.

LOG
---

Odd setup.  Built the tools in the cluspack_src and leon_src subdirectories, and added them and the top directory to PATH so the individual tools can be found outside of the leon-bis.tcsh script.

The Makefiles need to have lines removed that look for the expat library for munging XML, this is available by default on all our systems.

    12,14c12,15
    < LFLAGS  = -g -lm  -L$(EXPAT_LIB) -lexpat
    < EXPAT_LIB       = /home/julie/expat-1.95.6/lib
    < EXPAT_INC       = /home/julie/expat-1.95.6/lib
    ---
    > LFLAGS  = -g -lm -lexpat
    > #LFLAGS  = -g -lm  -L$(EXPAT_LIB) -lexpat
    > #EXPAT_LIB       = /home/julie/expat-1.95.6/lib
    > #EXPAT_INC       = /home/julie/expat-1.95.6/lib
    33c34,35
    < 	$(CC) $(CFLAGS) -I$(EXPAT_INC) $*.c
    ---
    > 	$(CC) $(CFLAGS) $*.c
    > 	#$(CC) $(CFLAGS) -I$(EXPAT_INC) $*.c

Modify leon-bis.tcsh to use `LEON_BIS_ROOT` to find the subdirectories, even though they are also added to PATH.

Remove executable bits set on the subdirectories.  No reason why those should be set.

    chmod -x *comp *.jar
    cd cluspack_src
    chmod -x *.{c,h,o}
    chmod -x sortie numero Makefile
    cd ../leon_src
    chmod -x *.{c,h,o}
    chmod -x makefile

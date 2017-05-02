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

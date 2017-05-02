# install.README     pallol@kalkyl1.uppmax.uu.se     2013/06/26 07:52:17

TITLE

	CEGMA installation on kalkyl

DESCRIPTION

	

TODO


LOG

$ wget http://korflab.ucdavis.edu/datasets/cegma/cegma_v2.4.010312.tar.gz
$ tar xzf cegma_v2.4.010312.tar.gz
$ mkdir 2.4.010312
$ mv cegma_v2.4.010312 2.4.010312/kalkyl
$ cd 2.4.010312/kalkyl/

$ module load bioinfo-tools
$ module add wise2/2.2.0
$ module add hmmer
$ module add geneid/1.4.4
$ module add blast/2.2.25+

$ make

-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2013 by Pall Isolfur Olason


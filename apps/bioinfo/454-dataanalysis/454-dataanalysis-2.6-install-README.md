# install.README     pallol@kalkyl4.uppmax.uu.se     2011/09/16 07:50:06

TITLE

	454 DataAnalysis installation readme

DESCRIPTION

	Installation steps for Roche 454 DataAnalysis software

TODO


	module file

LOG

sep 16, 2011

	Björn Nysted asks for update of the 454 data analysis pipeline, version 2.6 (he also
	provides the software, DataAnalysis_2.6_All.tgz).

	$ tar xzf DataAnalysis_2.6_All.tgz
	$ cd DataAnalysis_2.6_All
	$ ./setup.sh

	# setup launches an installer, which guides the installation. Selected "local" installation
	# (not system) and gave "//////sw/apps/bioinfo/roche/2.6/" as the installation path.
	# setup complains that a few i386 libraries are missing, but continues anyway
	# FINISHED

	$ cd //////sw/apps/bioinfo/roche/
	$ chown -R pallol:uppmax_staff 2.6/
	$ chown pallol:uppmax_staff install.README
	$ chmod 664 install.README

	# finally, when I got write permission, moved the 2.6 directory under DataAnalysis/2.6


-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2011 by Pall Isolfur Olason


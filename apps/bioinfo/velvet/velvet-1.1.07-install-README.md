# velvet_install.README     pallol@kalkyl1.uppmax.uu.se     2011/11/08 14:08:12

TITLE

	Velvet installation notes

DESCRIPTION

	README file for project

TODO


LOG
---

    ####
    # 2011-11-08 
    #
    # Updating velvet as requested by Anders Lind
    # RT 66082
    #

    # downloading and installing:

    git clone git://github.com/dzerbino/velvet.git
    cd velvet/
    make MAXKMERLENGTH=151 CATEGORIES=20 OPENMP=1
    cd ..
    mv velvet //////sw/apps/bioinfo/velvet/1.1.07
    chown -R pallol:uppmax_staff //////sw/apps/bioinfo/velvet/1.1.07



-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2011 by Pall Isolfur Olason


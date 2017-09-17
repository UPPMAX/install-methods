# trinity_install.README     pallol@kalkyl1.uppmax.uu.se     2011/11/08 12:42:37

TITLE

	Installation of Trinity

DESCRIPTION

	README file for project

TODO


LOG

###
# 2011-11-08
# download & install Trinity r2011-10-29:
#

wget http://downloads.sourceforge.net/project/trinityrnaseq/trinityrnaseq_r2011-10-29.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ftrinityrnaseq%2F&ts=1320412942&use_mirror=ignum
tar xzf trinityrnaseq_r2011-10-29.tgz 
cd trinityrnaseq_r2011-10-29
make
mkdir //////sw/apps/bioinfo/trinity/2011-10-29
cd ..
cp -r trinityrnaseq_r2011-10-29 //////sw/apps/bioinfo/trinity/2011-10-29
chown -R pallol:uppmax_staff //////sw/apps/bioinfo/trinity/2011-10-29



###
# 2012-01-26
#

At request of M. Grabherr for course at bmc, installed latest version of trinity, 2011-11-26
using same procedure as above


###
# 2012-09-26
#

Performed update, using same steps above, as per request through support@uppmax.uu.se.
Changed installation directory setup, using "kalkyl" specific installation directory under
the release-specific directory.


###
# 2015-01-29
#

Trinity 2 needs make and make plugins
--
Wes

###
# 2015-05-11
#

Trinity 2 also needs bowtie and samtools >= 1.0 loaded, added those to mf.
--
Doug

-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2011 by Pall Isolfur Olason


 # ucsc-utilities-v345-install-README.md, douglas.scofield@ebc.uu.se

 TITLE
 =====

 UCSC Utilities v345


 DESCRIPTION
 -----------

 Various useful utilities from UCSC.  Infer the version from the last source bundle.


 WEBSITE
 -------

     http://hgdownload.cse.ucsc.edu/admin/exe/


 MODULE REQUIREMENTS
 -------------------

 Just add the PATH


 LOG
 ---

     UCSC_DIR=/sw/apps/bioinfo/ucsc-utilities
     VERSION=v345
     mkdir -p $UCSC_DIR/$VERSION/milou
     cd $UCSC_DIR/$VERSION/milou

 Download them all from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/

     rsync -aP rsync://hgdownload.cse.ucsc.edu/genome/admin/exe/linux.x86_64/ ./

 On rackham et al., no shared object for libpng15 (why on earth does faSplit
 need libpng15?) so must build from source on rackham for those systems.

     mkdir -p $UCSC_DIR/$VERSION/src_rackham
     cd $UCSC_DIR/$VERSION/src_rackham
     wget wget http://hgdownload.soe.ucsc.edu/admin/exe/userApps.src.tgz
     tar xzf userApps.src.tgz

 But it turns out it needs a mysql_devel system, so for now I am freezing
 rackham et al at v287. Perhaps later I will return to building from src but not
 at the moment.

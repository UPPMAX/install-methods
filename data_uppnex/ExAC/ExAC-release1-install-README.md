#ExAC database release1
#===================

#<http://exac.broadinstitute.org/>

#LOG
#---

    VERSION=release1
    cd /sw/data/uppnex/ExAC
    echo "mirror -v $VERSION" | lftp ftp://ftp.broadinstitute.org/pub/ExAC_release


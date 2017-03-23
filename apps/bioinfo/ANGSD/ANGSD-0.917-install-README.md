Built almost the same way as the previous version except that the
official release was used in place of cloning the current repo (could
have cloned to a specific version instead).  Did this because some
changes were as recent as a couple hours before downloading. Also updated
find statement for Rackham's version of findutils.

    TOOL=/sw/apps/bioinfo/ANGSD
    VERS=0.917
    INST=$TOOL/$VERS/$CLUSTER
    mkdir -p $INST/{bin,misc}
    cd $TOOL/$VERS
    mkdir src
    cd src
    git clone https://github.com/samtools/htslib.git
    wget https://github.com/ANGSD/angsd/archive/0.917.tar.gz
    tar xzf 0.917.tar.gz
    module load gcc/4.9.2
    cd htslib
    make
    cd ../angsd*
    make HTSSRC=../htslib
    cp angsd $INST/bin/
    cp -rp R doc scripts $INST/
    find misc -type f -perm /1 -exec cp {} $INST/misc/ \;

Deleted source folders (angsd and htslib) rather than trust "make
clean/dist". Using the module version of htslib fails. Probably could
adjust a few variables but htslib is so small that it'd hardly be
worth the effort.

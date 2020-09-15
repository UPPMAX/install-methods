RECON/1.08
==========

<http://eddylab.org/software/recon/>

Using updated source from

http://www.repeatmasker.org/RepeatModeler/RECON-1.08.tar.gz

Used under license:
GPL

Structure creating script (makeroom_RECON_1.08.sh) moved to /sw/bioinfo/RECON/makeroom_1.08.sh


We're going to move the unpacked directory over to `$PREFIX` and then build there.

LOG
---

    TOOL=RECON
    VERSION=1.08
    cd /sw/bioinfo

    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://eddylab.org/software/recon/ -l "GPL" -d "package for automated de novo identification of repeat families from genomic sequences" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget http://www.repeatmasker.org/RepeatModeler/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz 

    rmdir $PREFIX
    mv ${TOOL}-${VERSION} $PREFIX
    cd $PREFIX
    cd src
    make && make install
    cd ../scripts
    sed -i "s,path = \"\";,path=\"$PREFIX/bin\";," recon.pl 
    head recon.pl 


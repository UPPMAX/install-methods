MultiQC/1.22.2
========================

<https://multiqc.info>

Used under license:
MIT


Structure creating script (makeroom_MultiQC_1.22.2.sh) moved to /sw/bioinfo/MultiQC/makeroom_1.22.2.sh

LOG
---

     TOOL=MultiQC
     VERSION=1.22.2
     makeroom.sh t "$TOOL" -v "$VERSION" -w "https://multiqc.info" -l "MIT" -d "Aggregate results from bioinformatics analyses across many samples into a single report" -f -s "misc" 

    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/bioinfo/MultiQC/SOURCEME_MultiQC_1.22.2 && cd $TOOLDIR


    PYTHONVERSION=3.8.7
    cd $PREFIX
    module load python/$PYTHONVERSION
    virtualenv  --system-site-packages MultiQC
    . MultiQC/bin/activate
    which pip
    which python
    pip install multiqc==$VERSION
    cp -r MultiQC/bin/* bin/

    mf file was updated to modern style including ROOT dir

## Add som scripts from github (rather small repo)
    cd $SRCDIR
    git clone https://github.com/MultiQC/MultiQC.git
    cd MultiQC/
    cp -ar scripts/ $PREFIX/



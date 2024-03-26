compleasm/0.2.5
========================

<https://github.com/huangmengCSU/compleasm>

Used under license:
Apache 2.0 and others
<https://github.com/huangnengCSU/compleasm/blob/0.2.5/LICENSE-BUSCO>

Structure creating script (makeroom_compleasm_0.2.5.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.5.sh

LOG
---

    makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.5" "-w" "https://github.com/huangmengCSU/compleasm" "-d" "A genome completeness evaluation tool based on miniprot" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.5/LICENSE-BUSCO"
    ./makeroom_compleasm_0.2.5.sh


    # load modules
    module load bioinfo-tools
    module load sepp/4.5.2
    module load miniprot/0.12
    module load hmmer/3.3.2

    # Download
    git clone https://github.com/huangnengCSU/compleasm.git .
    git checkout tags/v0.2.2
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages/:$PYTHONPATH

    # To get compleasm list --local to work you have to create a lineage.done file to each lineage. Otherwise list will not work.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages 
    find -maxdepth 1 -type d -exec touch {}.done \;


    # Doug subextracts the refseqs for each lineage. Compress them again and save the original.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS


    # Test with S. cerevisiae
    ./compleasm.py analyze  \
        -l saccharomycetes_odb10 \
        -L /sw/bioinfo/BUSCO/v5_lineage_sets/lineages/ \
        -o $SRCDIR/saccharo \
        -g <(miniprot --trans -u -I --outs=0.95 --gff -t 8 \
            /crex/data/reference/Saccharomyces_cerevisiae/S288C/concat/concat.fa \
            /sw/bioinfo/BUSCO/v5_lineage_sets/lineages/saccharomycetes_odb10/refseq_db.faa)






    # To get compleasm list --local to work you have to create a lineage.done file to each lineage. Otherwise list will not work.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages 
    find -maxdepth 1 -type d -exec touch {}.done \;

    # OLD
    # Disable download_placement and lineage
    #sed -i '72 {s/True/False/g}' compleasm.py
    # Fix nr 2. Compleasm tries to write to files in the lineages directory. Change that to read instead.
    #cd $SRCDIR
    #sed -i -r "s/'w'(\).close)/'r'\1/" compleasm.py  | grep "'r').close"
    # Comment out check for "miniprot.done"
    #sed -i '305,307 {s/^/#/}' compleasm.py 


    # Doug subextracts the refseqs for each lineage. Compress them again and save the original.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS
 


Stuff for 0.2.5:


    cd /sw/bioinfo/compleasm
    makeroom.sh -f -t compleasm -v 0.2.5 -w https://github.com/huangmengCSU/compleasm -d "A genome completeness evaluation tool based on miniprot" -l "Apache 2.0 and others" -L https://github.com/huangnengCSU/compleasm/blob/0.2.5/LICENSE-BUSCO 
    ./makeroom_compleasm_0.2.5.sh 
    source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.5
    cd $SRCDIR
    wget https://github.com/huangnengCSU/compleasm/releases/download/v0.2.5/compleasm-0.2.5_x64-linux.tar.bz2
    tar xf compleasm-0.2.5_x64-linux.tar.bz2 

Unpacks to `compleasm_kit/`. This directory contains executables for miniprot
and hmmsearch. We get those from modules, so ignore them.


Set up venv for installation.

    ml python/3.11.8
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    pip3 install pandas

Now install from the unpacked tarball.

    cd $SRCDIR
    cd compleasm_kit
    pip3 install .

Edit it so as not to download the lineage or placement files.

    cd $PREFIX/venv/lib/python3.11/site-packages
    sed -i '72 {s/download_lineage=True/download_lineage=False/}'     compleasm.py
    sed -i '72 {s/download_placement=True/download_placement=False/}' compleasm.py


Lift out the executable, and provide a symlink for `compleasm.py`.

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/compleasm .
    ln -s compleasm compleasm.py

Be sure the miniprot and hmmsearch executables are not under PREFIX.

    cd $PREFIX
    find . -name miniprot
    find . -name hmmsearch

Rename the versions under $SRCDIR to make sure compleasm is using the module versions.

    cd $SRCDIR/compleasm_kit/
    mv miniprot _miniprot
    mv hmmsearch _hmmsearch

Manage the lineage files.  To get compleasm list --local to work you have to
create a lineage.done file to each lineage. Otherwise list will not work.

    cd /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages
    for LINEAGE in *_odb10 ; do
        touch $LINEAGE.done
    done

Make sure the compressed sources are there.

    cd /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS

In the mf, add $modroot/bin to PATH, load miniprot/0.12 and hmmer/3.3.2. Make sure the mf is not a symlink

    cd $TOOLDIR/mf
    ls -l $VERSION

If not a symlink, edit as directed above.

    vi $VERSION

Edit to add $modroot/bin to PATH, load miniprot/0.12 and hmmer/3.3.2, and

    depends-on miniprot/0.12
    depends-on hmmer/3.3.2
    prepend-path PATH $modroot/bin
    setenv COMPLEASM_BUSCO_V5_LINEAGES /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages

This is the new location of BUSCO lineage sets.

Wrap up.

    cd $TOOLDIR
    ./compleasm-0.2.5_post-install.sh

Load module and test.

    ml purge
    ml bioinfo-tools
    ml compleasm/0.2.5

    compleasm list --local -L $COMPLEASM_BUSCO_V5_LINEAGES

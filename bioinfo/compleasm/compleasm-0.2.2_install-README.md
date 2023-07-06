compleasm/0.2.2
========================

<http://>

Used under license:
Apache 2.0


Structure creating script (makeroom_compleasm_0.2.2.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "compleasm" "-v" "0.2.2" "-d" "A genome completeness evaluation tool based on miniprot" "-l" "Apache 2.0" "-s" "annotation"
    ./makeroom_compleasm_0.2.2.sh
    cd $SRCDIR

    # load modules
    module load bioinfo-tools
    module load sepp/4.3.10_python_3.7.2
    module load miniprot/0.12
    module load hmmer/3.3.2

    # Download
    git clone https://github.com/huangnengCSU/compleasm.git .
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages/:$PYTHONPATH

    # Install
    python setup.py install --prefix=$PREFIX

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


jcvi/1.3.8
========================

<http://>

Used under license:
BSD2


Structure creating script (makeroom_jcvi_1.3.8.sh) moved to /sw/bioinfo/jcvi/makeroom_1.3.8.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "jcvi" "-v" "1.3.8" "-d" "Python library to facilitate genome assembly, annotation, and comparative genomics" "-l" "BSD2" "-s" "annotation"
    ./makeroom_jcvi_1.3.8.sh

    module load bioinfo-tools
    module load python/3.11.4
    module load last
    module load texlive/2021

    # Install
    PYTHONUSERBASE=$PREFIX pip install --user jcvi==1.3.8

    # Test
    mkdir $PREFIX/test
    cd $PREFIX/test
    python -m jcvi.apps.fetch phytozome Ppersica,Phallii_495_v3.1

    python -m jcvi.formats.gff bed --type=mRNA --key=Name Ppersica_298_v2.1.gene.gff3.gz -o peach.bed
    python -m jcvi.formats.gff bed --type=mRNA --key=Name Phallii_495_v3.1.gene.gff3.gz -o phallii.bed

    python -m jcvi.formats.fasta format Ppersica_298_v2.1.cds.fa.gz peach.cds
    python -m jcvi.formats.fasta format Phallii_495_v3.1.cds.fa.gz phallii.cds

    python -m jcvi.compara.catalog ortholog phallii peach --no_strip_names

    python -m jcvi.compara.synteny screen --minspan=30 --simple phallii.peach.anchors phallii.peach.anchors.new

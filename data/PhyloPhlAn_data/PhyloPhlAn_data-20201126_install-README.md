PhyloPhlAn_data/20201126
========================

<https://github.com/biobakery/phylophlan/wiki#databases>

Used under license:



Structure creating script (makeroom_PhyloPhlAn_data_20201126.sh) moved to /sw/data/PhyloPhlAn_data/makeroom_20201126.sh

LOG
---


    makeroom.sh -f -c data -t PhyloPhlAn_data -v 20201126 -w 'https://github.com/biobakery/phylophlan/wiki#databases' -d "PhyloPhlAn 3.0 is able to automatically download two databases of universal markers for prokaryotes" 
    ./makeroom_PhyloPhlAn_data_20201126.sh 
    source /sw/data/PhyloPhlAn_data/SOURCEME_PhyloPhlAn_data_20201126
    cd $SRCDIR

See what databases to get.

    wget http://cmprod1.cibio.unitn.it/databases/PhyloPhlAn/phylophlan_databases.txt
    cat phylophlan_databases.txt 

Get 'em.

    wget http://cmprod1.cibio.unitn.it/databases/PhyloPhlAn/amphora2.tar
    wget http://cmprod1.cibio.unitn.it/databases/PhyloPhlAn/amphora2.md5
    wget http://cmprod1.cibio.unitn.it/databases/PhyloPhlAn/phylophlan.tar
    wget http://cmprod1.cibio.unitn.it/databases/PhyloPhlAn/phylophlan.md5
    md5sum -c *.md5

Unpack and build diamond, blast and usearch databases.

    tar -xf amphora2.tar
    bzcat amphora2/*.bz2 > amphora2/amphora2.faa

    tar -xf phylophlan.tar
    bunzip2 -k phylophlan/phylophlan.faa.bz2

    module load bioinfo-tools
    module load PhyloPhlAn/3.0.2  # use the diamond blast and usearch versions used by the latest PhyloPhlAn module

    diamond makedb --in amphora2/amphora2.faa --db amphora2/amphora2
    diamond makedb --in phylophlan/phylophlan.faa --db phylophlan/phylophlan

    cd amphora2
    makeblastdb -in amphora2.faa -dbtype prot -title AMPHORA2 -out amphora2
    usearch -makeudb_usearch amphora2.faa -output amphora2.udb
    cd ..

    cd phylophlan
    makeblastdb -in phylophlan.faa -dbtype prot -title PhyloPhlAn -out phylophlan
    usearch -makeudb_usearch phylophlan.faa -output phylophlan.udb
    cd ..


Install.

    cp -av amphora2/amphora2.{faa,dmnd,p??,udb} phylophlan/phylophlan.{faa,dmnd,p??,udb} $PREFIX/

Note them in the module help.


REPET/3.0
========================

<https://urgi.versailles.inra.fr/Tools/REPET>

Used under license:
CeCILL

Structure creating script (makeroom_REPET_3.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/REPET/makeroom_3.0.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "REPET" -v "3.0" -w "https://urgi.versailles.inra.fr/Tools/REPET" -d "REPET integrates bioinformatics programs in order to tackle biological issues at the genomic scale." -l "CeCILL" -s "misc"

makeroom -t REPET -v 3.0 -w https://urgi.versailles.inra.fr/Tools/REPET -d "REPET integrates bioinformatics programs in order to tackle biological issues at the genomic scale." -l "CeCILL" -s misc
./makeroom_REPET_3.0.sh
cd $TOOLDIR
cd 3.0/src/
singularity build --sandbox image docker://urgi/docker_vre_aio:latest
chmod -R 777 image/
singularity build REPET.sif image/





export SINGULARITY_CACHEDIR=/sw/bioinfo/REPET/3.0/src/tmp
export SINGULARITY_TMPDIR=/sw/bioinfo/REPET/3.0/src/tmp
singularity build --sandbox --fix-perms REPET_sb docker://urgi/docker_vre_aio:latest
##chmod -R u+rwX REPET_sb
chmod -R 2777 REPET_sb
singularity build REPET.sif REPET_sb









wget https://urgi.versailles.inra.fr/download/repet/REPET_linux-x64-3.0.tar.gz
tar xvfz REPET_linux-x64-3.0.tar.gz
cd REPET_linux-x64-3.0/
ml python/2.7.15
pip install MySQLdb logging yaml --target=$PREFIX
pip install mysqlclient logging yaml --target=$PREFIX
ml MariaDB
pip install mysqlclient logging yaml --target=$PREFIX
pip install mysqlclient logging pyyaml --target=$PREFIX
ml blast
ml hmmer
ml PILER-64
ml mcl
ml RepeatMasker
ml trf
ml GenomeTools
cp -r /sw/bioinfo/REPET/3.0/src/REPET_linux-x64-3.0/* 3.0/rackham/



### Installation on kalkyl ###
Log in to biologin.uppmax.uu.se

Put the copy in the bwa folder:
cd //////sw/apps/bioinfo/bwa/0.6.2
wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.6.2.tar.bz2

Unpack:
bunzip2 bwa-0.6.2.tar.bz2 
tar xvf bwa-0.6.2.tar 

Rename:
mv bwa-0.6.2 kalkyl

Install:
module add gcc/4.6
cd kalkyl
make clean
make all
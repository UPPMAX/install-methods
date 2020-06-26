Logged in on biologin.uppmax.uu.se

Downloaded the source from  to my glob folder.

gunzip EMBOSS-6.3.1.tar.gz
tar xvf EMBOSS-6.3.1.tar
cd EMBOSS-6.3.1
mkdir //////sw/apps/bioinfo/emboss/6.3.1
module load gcc/4.4
./configure --prefix=//////sw/apps/bioinfo/emboss/6.3.1
make
make check
make install




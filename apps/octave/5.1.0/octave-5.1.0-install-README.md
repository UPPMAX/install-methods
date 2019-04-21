octave-5.1.0
================

LOG
---

cd /sw/apps/octave
mkdir 5.1.0
cd 5.1.0
mkdir src
cd src
wget https://ftp.acc.umu.se/mirror/gnu.org/gnu/octave/octave-5.1.0.tar.gz
tar -xvzf octave-5.1.0.tar.gz
cd octave-5.1.0
mkdir build
module load gcc/8.3.0
../configure --prefix=/sw/apps/octave/5.1.0/rackham
make
make install

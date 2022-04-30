gdb/11.2
========================

<https://ftp.gnu.org/gnu/gdb/>

Used under license:
Other-d


Structure creating script (makeroom_gdb_11.2.sh) moved to /sw/comp/gdb/makeroom_11.2.sh

LOG
---

  TOOL=gdb
  VERSION=11.2
  mkdir $TOOL
  cd $TOOL

  makeroom.sh -t $TOOL -v $VERSION   -w "https://ftp.gnu.org/gnu/gdb/"  -c "comp"  -l "Other"-d "GNU Debugger is GNU project which helps to debug software applications and analyze what is happening during program execution"   -f


  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}
    
  cd $SRCDIR
  module load gcc/11.2.0

  wget https://ftp.gnu.org/gnu/gdb/gdb-11.2.tar.gz
  tar xzf gdb-11.2.tar.gz

  cd gdb-11.2
  ./configure -prefix=$PREFIX --without-auto-load-safe-path
  make -j 
  make install


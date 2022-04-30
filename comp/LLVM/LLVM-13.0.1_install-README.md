LLVM/13.0.1
========================

<http://>

Used under license:
Various


Structure creating script (makeroom_LLVM_13.0.1.sh) moved to /sw/comp/LLVM/makeroom_13.0.1.sh

LOG
---

  TOOL=LLVM
  VERSION=13.0.1

  mkdir $TOOL
  cd $TOOL

  makeroom.sh -t $TOOL -v $VERSION  -c "comp" -l Various -d "The LLVM package contains a collection of modular and reusable compiler and toolchain technologies."  -f

  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}

  module load cmake/3.22.2
  module load gcc/11.2.0
  module load git/2.34.1
  module load doxygen/1.8.11
  module load Graphviz/2.40.1
  module load texlive/2021
  module load ninja/1.10.0
  module load pothon/3.9.5
  module load binutils/2.38


  wget https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang-13.0.1.src.tar.xz
  wget https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/compiler-rt-13.0.1.src.tar.xz
  wget https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/llvm-13.0.1.src.tar.xz

  tar -xvf clang-13.0.1.src.tar.xz
  tar -xvf compiler-rt-13.0.1.src.tar.xz
  tar -xvf llvm-13.0.1.src.tar.xz

  cd llvm-13.0.1.src/
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX/bin \
       -DLLVM_ENABLE_FFI=ON                      \
       -DCMAKE_BUILD_TYPE=Release                \
       -DLLVM_BUILD_LLVM_DYLIB=ON                \
       -DLLVM_LINK_LLVM_DYLIB=ON                 \
       -DLLVM_ENABLE_RTTI=ON                     \
       -DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF" \
       -Wno-dev  ..


  make -j
  make install

# Install CLANG
  cd clang-13.0.1.src
  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
  make -j
  make install

#install Compiler RT
  cd compiler-rt-13.0.1.src
  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
  make -j
  make install


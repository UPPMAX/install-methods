cuda/12.2.2
========================

<https://developer.nvidia.com/cuda-toolkit>

Used under license:
EULA
<https://docs.nvidia.com/cuda/eula/index.html>

Structure creating script (makeroom_cuda_12.2.2.sh) moved to /sw/comp/cuda/makeroom_12.2.2.sh

LOG
---

```bash

cd /sw/comp/
makeroom.sh -t "cuda" -v "12.2.2" -c "comp" -w "https://developer.nvidia.com/cuda-toolkit" -l "EULA" -L "https://docs.nvidia.com/cuda/eula/index.html" -d "CUDA (formerly Compute Unified Device Architecture) is a parallel computing platform and programming model created by NVIDIA and implemented by the graphics processing units (GPUs) that they produce. CUDA gives developers access to the virtual instruction set and memory of the parallel computational elements in CUDA GPUs."

./makeroom_cuda_12.2.2.sh

cd /sw/comp/cuda/

source SOURCEME_cuda_12.2.2

# symlinks from Snowy instead of Rackham
cd 12.2.2/
rm bianca miarka snowy
rmdir rackham
mkdir snowy
ln -s snowy rackham
ln -s snowy bianca
ln -s snowy miarka

# Use the EasyBuild installation
cp -rp /sw/EasyBuild/snowy-gpu/software/CUDA/12.2.2/* /sw/comp/cuda/12.2.2/snowy/.
rm -r /sw/comp/cuda/12.2.2/snowy/easybuild

# edit the module file
vi /sw/comp/cuda/mf/12.2.2

# run the post-install scripts
cd /sw/comp/cuda/
./cuda-12.2.2_post-install.sh

# edit the installation instructions
vi cuda-12.2.2_install-README.md

```


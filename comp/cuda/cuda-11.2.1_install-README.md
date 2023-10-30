cuda/11.2.1
========================

<https://developer.nvidia.com/cuda-toolkit>

Used under license:
EULA
<https://docs.nvidia.com/cuda/eula/index.html>

Structure creating script (makeroom_cuda_11.2.1.sh) moved to /sw/comp/cuda/makeroom_11.2.1.sh

LOG
---

```bash

cd /sw/comp/
makeroom.sh -t "cuda" -v "11.2.1" -c "comp" -w "https://developer.nvidia.com/cuda-toolkit" -l "EULA" -L "https://docs.nvidia.com/cuda/eula/index.html" -d "CUDA (formerly Compute Unified Device Architecture) is a parallel computing platform and programming model created by NVIDIA and implemented by the graphics processing units (GPUs) that they produce. CUDA gives developers access to the virtual instruction set and memory of the parallel computational elements in CUDA GPUs."

./makeroom_cuda_11.2.1.sh

cd /sw/comp/cuda/

source SOURCEME_cuda_11.2.1

# symlinks from Snowy instead of Rackham
cd 11.2.1/
rm bianca miarka snowy
rmdir rackham
mkdir snowy
ln -s snowy rackham
ln -s snowy bianca
ln -s snowy miarka

# Use the EasyBuild installation
cp -rp /sw/EasyBuild/snowy-gpu/software/CUDAcore/11.2.1/* /sw/comp/cuda/11.2.1/snowy/.
rm -r /sw/comp/cuda/11.2.1/snowy/easybuild

# edit the module file
vi /sw/comp/cuda/mf/11.2.1

# run the post-install scripts
cd /sw/comp/cuda/
./cuda-11.2.1_post-install.sh

# edit the installation instructions
vi cuda-11.2.1_install-README.md

```


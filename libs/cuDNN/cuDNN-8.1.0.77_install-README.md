cuDNN/8.1.0.77
========================

<https://developer.nvidia.com/cudnn>

Used under license:
SLA
<https://docs.nvidia.com/deeplearning/cudnn/sla/index.html>

Structure creating script (makeroom_cuDNN_8.1.0.77.sh) moved to /sw/libs/cuDNN/makeroom_8.1.0.77.sh

LOG
---

```bash

cd /sw/libs/
makeroom.sh -t "cuDNN" -v "8.1.0.77" -c "libs" -w "https://developer.nvidia.com/cudnn" -l "SLA" -L "https://docs.nvidia.com/deeplearning/cudnn/sla/index.html" -d "The NVIDIA CUDA Deep Neural Network library (cuDNN) is a GPU-accelerated library of primitives for deep neural networks."

./makeroom_cuDNN_8.1.0.77.sh

cd /sw/libs/cuDNN/

source SOURCEME_cuDNN_8.1.0.77

# symlinks from Snowy instead of Rackham
cd 8.1.0.77/
rm bianca miarka snowy
rmdir rackham
mkdir snowy
ln -s snowy rackham
ln -s snowy bianca
ln -s snowy miarka

# Use the EasyBuild installation
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.1.0.77-CUDA-11.2.1/include /sw/libs/cuDNN/8.1.0.77/snowy/.
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.1.0.77-CUDA-11.2.1/lib64 /sw/libs/cuDNN/8.1.0.77/snowy/.
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.1.0.77-CUDA-11.2.1/NVIDIA_SLA_cuDNN_Support.txt /sw/libs/cuDNN/8.1.0.77/snowy/.

cd /sw/libs/cuDNN/8.1.0.77/snowy/
ln -s lib64 lib

# edit the module file
vi /sw/libs/cuDNN/mf/8.1.0.77

# run the post-install scripts
cd /sw/libs/cuDNN/
./cuDNN-8.1.0.77_post-install.sh

# edit the installation instructions
vi cuDNN-8.1.0.77_install-README.md

```


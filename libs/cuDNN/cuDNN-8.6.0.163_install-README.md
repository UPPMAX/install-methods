cuDNN/8.6.0.163
========================

<https://developer.nvidia.com/cudnn>

Used under license:
SLA
<https://docs.nvidia.com/deeplearning/cudnn/sla/index.html>

Structure creating script (makeroom_cuDNN_8.6.0.163.sh) moved to /sw/libs/cuDNN/makeroom_8.6.0.163.sh

LOG
---

```bash

cd /sw/libs/
makeroom.sh -t "cuDNN" -v "8.6.0.163" -c "libs" -w "https://developer.nvidia.com/cudnn" -l "SLA" -L "https://docs.nvidia.com/deeplearning/cudnn/sla/index.html" -d "The NVIDIA CUDA Deep Neural Network library (cuDNN) is a GPU-accelerated library of primitives for deep neural networks."

./makeroom_cuDNN_8.6.0.163.sh

cd /sw/libs/cuDNN/

source SOURCEME_cuDNN_8.6.0.163

# symlinks from Snowy instead of Rackham
cd 8.6.0.163/
rm bianca miarka snowy
rmdir rackham
mkdir snowy
ln -s snowy rackham
ln -s snowy bianca
ln -s snowy miarka

# Use the EasyBuild installation
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.6.0.163-CUDA-11.8.0/include /sw/libs/cuDNN/8.6.0.163/snowy/.
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.6.0.163-CUDA-11.8.0/lib /sw/libs/cuDNN/8.6.0.163/snowy/.
cp -rp /sw/EasyBuild/snowy-gpu/software/cuDNN/8.6.0.163-CUDA-11.8.0/LICENSE /sw/libs/cuDNN/8.6.0.163/snowy/.

cd /sw/libs/cuDNN/8.6.0.163/snowy/
ln -s lib lib64

# edit the module file
vi /sw/libs/cuDNN/mf/8.6.0.163

# run the post-install scripts
cd /sw/libs/cuDNN/
./cuDNN-8.6.0.163_post-install.sh

# edit the installation instructions
vi cuDNN-8.6.0.163_install-README.md

```


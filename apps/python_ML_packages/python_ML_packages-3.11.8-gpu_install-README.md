python_ML_packages/3.11.8-gpu
========================

<https://pypi.org>

Used under license:
Various


Structure creating script (makeroom_python_ML_packages_3.11.8-gpu.sh) moved to /sw/apps/python_ML_packages/makeroom_3.11.8-gpu.sh

LOG
---

```bash

    salloc -A staff -M snowy --reservation=env_test -N 1 -n 16 --gpus=1 --gpus-per-node=1 -t 00-05:00:00

    makeroom.sh "-f" "-t" "python_ML_packages" "-v" "3.11.8-gpu" "-c" "apps" "-w" "https://pypi.org" "-l" "Various" "-d" "A selection of Python packages for Machine Learning" "-u" "snowy"
    ./makeroom_python_ML_packages_3.11.8-gpu.sh
        
    cd /sw/apps/python_ML_packages
    source /sw/apps/python_ML_packages/SOURCEME_python_ML_packages_3.11.8-gpu

# update the PREFIX
    cd /sw/apps/python_ML_packages/3.11.8-gpu
    mv snowy snowy-centos7-t4
    export PREFIX=/sw/apps/python_ML_packages/3.11.8-gpu/snowy-centos7-t4
    cd $PREFIX


    module load gcc/12.3.0
    module load python/3.11.8


    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade setuptools pip wheel


# setting additional paths to avoid warnins during pip install
    export PATH=$PREFIX/bin:$PATH
# for pip list -v
    export PYTHONPATH=$PREFIX/lib/python3.11/site-packages


    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade nvidia-pyindex



    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade tensorflow_probability tensorflow_datasets

    PYTHONUSERBASE=$PREFIX pip3 install "tensorflow[and-cuda]"

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade tensorrt --extra-index-url https://pypi.nvidia.com

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade scikit-learn

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade pytensor

# skip this as it installs Keras 3, incompatible with TensorFlow <= 2.15
# Keras 2.15 is nevertheless installed as a dependency of TensorFlow 2.15
# future TensorFlow versions will build on top of Keras 3
#    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade keras


    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade nlp

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade torch torchvision torchaudio

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade seaborn "seaborn[stats]"

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade numba

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade imbalanced-learn

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade --no-binary ducc0 --user ducc0


# lock it down
    chmod -R -w $PREFIX

    cd $TOOLDIR
    vi mf/3.11.8-gpu
    vi python_ML_packages-3.11.8-gpu_install-README.md
    vi python_ML_packages-3.11.8-gpu_post-install.sh
   ./python_ML_packages-3.11.8-gpu_post-install.sh


```

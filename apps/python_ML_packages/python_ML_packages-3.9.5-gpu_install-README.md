python_ML_packages/3.9.5-gpu
========================

<http://>

Used under license:
Various


Structure creating script (makeroom_python_ML_packages_3.9.5-gpu.sh) moved to /sw/apps/python_ML_packages/makeroom_3.9.5-gpu.sh

LOG
---

    TOOL=python_ML_packages
    VERSION=3.9.5-gpu

    makeroom.sh -t $TOOL -v $VERSION  -c "apps" -l Various -d "Python package installation"  -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}


    module load python/3.9.5
    module load gcc/9.3.0
    module use /sw/EasyBuild/snowy-gpu/modules/all
    module load fosscuda/2020b
    module load cuDNN/8.0.4.30-CUDA-11.1.1

    cd $PREFIX

    PYTHONUSERBASE=$PREFIX pip install scikit-learn seaborn theano
    PYTHONUSERBASE=$PREFIX pip install -f torch torchvision
    PYTHONUSERBASE=$PREFIX pip install tensorflow-gpu
    PYTHONUSERBASE=$PREFIX pip install keras
    PYTHONUSERBASE=$PREFIX pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html
    PYTHONUSERBASE=$PREFIX pip install --user tensorflow_probability==0.13.0 tensorflow_datasets==3.2.1

    # Temporary conda env to support qt on Bianca
    conda create -n qt_env python=3.9
    source activate qt_env
    conda install -y qt
    conda install -y pyqt
    conda install -y matplotlib


You can produce the list of packages installed only within this module with

    PYTHONUSERBASE=$PREFIX pip list --user

Include this in the module help.

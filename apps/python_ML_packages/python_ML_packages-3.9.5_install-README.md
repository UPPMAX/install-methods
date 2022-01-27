python_ML_packages/3.9.5
========================

<http://>

Used under license:
Various


Structure creating script (makeroom_python_ML_packages_3.9.5.sh) moved to /sw/apps/python_ML_packages/makeroom_3.9.5.sh

LOG
---

    TOOL=python_ML_packages
    VERSION=3.9.5
    mkdir $TOOL
    cd $TOOL
    makeroom.sh -t $TOOL -v $VERSION  -c "apps" -l Various -d "Python package installation"  -f

   .makeroom_python_ML_packages_3.9.5.sh

    sourceSOURCEME_python_ML_packages_3.9.5

    module load python/3.9.5
    module load gcc/9.3.0

    cd $PREFIX

    PYTHONUSERBASE=$PREFIX pip install scikit-learn seaborn theano TensorFlow Keras torch nlp  


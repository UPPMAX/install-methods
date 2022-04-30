python_ML_packages/3.9.5-cpu
========================

<http://>

Used under license:
Various


Structure creating script (makeroom_python_ML_packages_3.9.5-cpu.sh) moved to /sw/apps/python_ML_packages/makeroom_3.9.5-cpu.sh

LOG
---

    TOOL=python_ML_packages
    VERSION=3.9.5-cpu

     makeroom.sh -t $TOOL -v $VERSION  -c "apps" -l Various -d "Python package installation"  -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}


    module load python/3.9.5
    module load gcc/9.3.0

    cd $PREFIX

    PYTHONUSERBASE=$PREFIX pip install scikit-learn seaborn theano TensorFlow Keras torch nlp  
    PYTHONUSERBASE=$PREFIX pip install --upgrade /proj/staff/niharika/TensorFlow_lite/tensorflow/tensorflow/lite/tools/pip_package/gen/tflite_pip/python3/dist/tflite_runtime-2.10.0-cp39-cp39-linux_x86_64.whl


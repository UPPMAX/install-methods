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

    PYTHONUSERBASE=$PREFIX pip install --user scikit-learn seaborn theano TensorFlow Keras torch nlp  
    PYTHONUSERBASE=$PREFIX pip install --user --upgrade /proj/staff/niharika/TensorFlow_lite/tensorflow/tensorflow/lite/tools/pip_package/gen/tflite_pip/python3/dist/tflite_runtime-2.10.0-cp39-cp39-linux_x86_64.whl

    PYTHONUSERBASE=$PREFIX pip install --user protobuf==3.19.4 tensorflow_probability==0.13.0 tensorflow_datasets==3.2.1

## Björn update 31 March

    PYTHONUSERBASE=$PREFIX pip install --user imbalanced-learn
    PYTHONUSERBASE=$PREFIX pip install --no-binary ducc0 --user ducc0

### library fix
    patchelf --set-rpath  "$LD_RUN_PATH:$(patchelf --print-rpath ducc0.cpython-39-x86_64-linux-gnu.so)"    ducc0.cpython-39-x86_64-linux-gnu.so


## Diana's comments for future versions:
## We should install tensorflow-cpu instead, possibly using the wheel file below
## PYTHONUSERBASE=$PREFIX pip install --upgrade tensorflow-cpu /proj/staff/diana/TensorFlow/TensorFlow-2-via-pip/lib/python3.9/site-packages/wheels/tensorflow_cpu-2.10.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
## Is tflite really needed? Seems to be relevant for mobile devices.


You can produce the list of packages installed only within this module with

    PYTHONUSERBASE=$PREFIX pip list --user

Include this in the module help.




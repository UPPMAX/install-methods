scikit-learn/1.4.2
========================

<https://github.com/scikit-learn/scikit-learn>

Used under license:
BSD-3


Structure creating script (makeroom_scikit-learn_1.4.2.sh) moved to /sw/apps/scikit-learn/makeroom_1.4.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "scikit-learn" "-v" "1.4.2" "-d" "scikit-learn: machine learning in Python" "-l" "BSD-3" "-w" "https://github.com/scikit-learn/scikit-learn" "-c" "apps" "-f"
    ./makeroom_scikit-learn_1.4.2.sh

 # Load module
 module load python/3.9.5

# pip install
 PYTHONUSERBASE=$PREFIX pip install --user scikit-learn==$VERSION




scikit-learn/0.24.1
========================

<https://github.com/scikit-learn/scikit-learn>

Used under license:
BSD-3


Structure creating script (makeroom_scikit-learn_0.24.1.sh) moved to /sw/apps/scikit-learn/makeroom_0.24.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "scikit-learn" "-v" "0.24.1" "-d" "scikit-learn: machine learning in Python" "-l" "BSD-3" "-w" "https://github.com/scikit-learn/scikit-learn" "-c" "apps" "-f"
    ./makeroom_scikit-learn_0.24.1.sh
    
    # Load modules
    python/3.8.7

    # pip install
    PYTHONUSERBASE=$PREFIX pip install --user scikit-learn==0.24.1













scikit-learn/0.22.1
========================

<https://github.com/scikit-learn/scikit-learn>

Used under license:
BSD 3

Structure creating script (makeroom_scikit-learn_0.22.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/scikit-learn/makeroom_0.22.1.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -w "https://github.com/scikit-learn/scikit-learn" -v "0.22.1" -c "apps" -d "scikit-learn is a Python module for machine learning built on top of SciPy" -l "BSD 3" -t "scikit-learn"

LOG
---

    TOOL=scikit-learn
    VERSION=0.22.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -w "https://github.com/scikit-learn/scikit-learn" -v "0.22.1" -c "apps" -d "scikit-learn is a Python module for machine learning built on top of SciPy" -l "BSD 3" -t "scikit-learn"
    ./makeroom_scikit-learn_0.22.1.sh
    ml python3
    pip3 install scikit-learn --target=$PREFIX

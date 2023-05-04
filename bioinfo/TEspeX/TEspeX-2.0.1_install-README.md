TEspeX/2.0.1
============

<https://github.com/fansalon/TEspeX>

Used under license:
GPL v3


Structure creating script (makeroom_TEspeX_2.0.1.sh) moved to /sw/bioinfo/TEspeX/makeroom_2.0.1.sh

LOG
---

This tool has an odd hybrid installation procedure.

  * pysam and pandas (and python 3.6) are installed within a conda environment. We will instead use a python/3.6.8 virtualenv that uses a `#!` line in each script to run using the python within the virutalenv. We also need to define `PYTHONPATH` so that the module packages are available (specifically gzip)
  * it contains its own `bin/` directory, which it finds based on the location of the running script. Within that directory are included its own STAR and picard.jar
  * Then, samtools 1.3.1 is installed within the same `bin/` directory.


### Modify package loading

It then expects to augment its path by searching `sys.path`, so (sort of) needs the conda environment to be activated. We will modify the scripts to skip this part, since the use of virtualenv and `PYTHONPATH` will make this unnecessary. The specific changes are illustrated for the script `TEspeX.py`, where the try/except block is removed and the imports are done directly. We test that each of these is available once things are set up correctly.

    rackham5: /sw/bioinfo/TEspeX/2.0.1/rackham/TEspeX_deps $ diff $SRCDIR/TEspeX/TEspeX.py TEspeX.py
    0a1,2
    > #!/sw/bioinfo/TEspeX/2.0.1/rackham/TEspeX_deps/bin/python3.6
    >
    18,43c20,31
    < try:
    <   import argparse
    <   import sys
    <   # ensure that only the modules installed within the TEspeX_deps env are loaded - this basically deletes from sys.path all the paths not containing TEspeX_deps
    <   new_path = []
    <   for path in sys.path:
    <     l = path.find("TEspeX_deps")
    <     if l != -1:
    <       new_path.append(path)
    <   # sys.path is now equal to new_path --> if TEspeX_deps env has not been activated sys.path will be an empty list
    <   sys.path = new_path
    <   # now import other paths
    <   import time
    <   import os
    <   from os import listdir
    <   import gzip
    <   import subprocess
    <   import math
    <   import pysam
    <   import pandas
    <   from functools import reduce
    <   import csv
    < except ModuleNotFoundError:
    <   print("ERROR: it seems like none of your sys.path paths contains the TEspeX_deps one...")
    <   print("Did you forget to activate TEspeX_deps environment through source activate TEspeX_deps?")
    <   sys.exit(1)
    ---
    > import argparse
    > import sys
    > import time
    > import os
    > from os import listdir
    > import gzip
    > import subprocess
    > import math
    > import pysam
    > import pandas
    > from functools import reduce
    > import csv

Do the same for cleanup.py, index.py and wrapper_slurm.py.

### The installation, from the start

    makeroom.sh -t TEspeX -v 2.0.1 -s annotation -w https://github.com/fansalon/TEspeX -d "pipeline for Transposable Elements expression quantification" -l "GPL v3" 
    ./makeroom_TEspeX_2.0.1.sh 
    source /sw/bioinfo/TEspeX/SOURCEME_TEspeX_2.0.1
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/fansalon/TEspeX

Now set up virtualenv within PREFIX, and install required versions of pandas and pysam there.

    module load python/3.6.8
    virtualenv $PREFIX/TEspeX_deps
    $PREFIX/TEspeX_deps/bin/pip install pandas==0.23.0 pysam==0.15.1

Now rsync over the contents of the git repository into the virtuanenv's directory. This will be the root of PATH.

    cd $SRCDIR/TEspeX_deps
    rsync -Pa * $PREFIX/TEspeX_deps/

Modify the scripts, following the advice in **Modify package loading** above.

    cd $PREFIX/TEspeX_deps/
    vi TEspeX.py cleanup.py index.py wrapper_slurm.py

Then, modify the scripts following to insert #! lines, using the python within the virtualenv, and make them executable.
Now modify the scripts to have the #! lines, using the python within the virtualenv, and make them executable.

    cd $PREFIX/TEspeX_deps/
    for F in TEspeX.py cleanup.py index.py wrapper_slurm.py ; do
        sed -i "1s,^,#\!$PREFIX/TEspeX_deps/bin/python3.6\n\n," $F
        chmod +x $F
    done

Within the mf file, 

    depends-on java/OpenJDK_11.0.2

    prepend-path     PATH           $modroot/TEspeX_deps
    prepend-path     PYTHONPATH     /sw/comp/python/3.6.8_${Cluster}/lib/python3.6/site-packages/
    setenv           TESPEX_ROOT    $modroot

Test, closely!


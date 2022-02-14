BlobToolKit/2.6.4
========================

<https://github.com/blobtoolkit>

Used under license:
MIT License


Structure creating script (makeroom_BlobToolKit_2.6.4.sh) moved to /sw/bioinfo/BlobToolKit/makeroom_2.6.4.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh "-f" "-t" "BlobToolKit" "-v" "2.6.4" "-s" "misc" "-w" "https://github.com/blobtoolkit" "-l" "MIT License" "-d" "A new implementation of BlobTools with support for interactive data exploration via the BlobToolKit viewer"
    ./makeroom_BlobToolKit_2.6.4.sh
BlobToolKit/2.6.3
========================

<https://github.com/blobtoolkit/blobtools2>

Used under license:
MIT License


Structure creating script (makeroom_BlobToolKit_2.6.3.sh) moved to /sw/bioinfo/BlobToolKit/makeroom_2.6.3.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "BlobToolKit" -v "2.6.3" -s "misc" -w "https://github.com/blobtoolkit/blobtools2" -l "MIT License" -d "A new implementation of BlobTools with support for interactive data exploration via the BlobToolKit viewer"
    ./makeroom_BlobToolKit_2.6.3.sh

    Module load conda
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n btk_env -c conda-forge -y python=3.6 docopt psutil pyyaml ujson tqdm nodejs=10 yq;
    source activate btk_env;
    conda install -c bioconda -y pysam seqtk;
    conda install -c conda-forge -y geckodriver selenium pyvirtualdisplay;
    pip install fastjsonschema;

    mkdir -p ~/blobtoolkit;
    cd ~/blobtoolkit;
    git clone https://github.com/blobtoolkit/blobtools2;
    git clone https://github.com/blobtoolkit/viewer;
    git clone https://github.com/blobtoolkit/specification;
    git clone https://github.com/blobtoolkit/insdc-pipeline;

   cd viewer;
   npm install;
   cd ..;
    

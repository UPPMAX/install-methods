G-Nomix/2022-09-18-de952a2
========================
<https://github.com/AI-sandbox/gnomix>

License:
This software is available for use free of charge for academic research use only. Commercial users, for profit companies or consultants, and non-profit institutions not qualifying as "academic research" must contact the Stanford Office of Technology Licensing for a separate license.

Structure creating script (makeroom_G-Nomix_2022-09-18-de952a2.sh) moved to /sw/bioinfo/G-Nomix/makeroom_G-Nomix_2022-09-18-de952a2.sh

LOG
---

    /home/iusan/makeroom.sh -t "G-Nomix" -v "2022-09-18-de952a2" -s "phylogeny" -w "https://github.com/AI-sandbox/gnomix" -d "High Resolution Ancestry Deconvolution for Next Generation Genomic Data" -l "free for academic use"
    ./makeroom_G-Nomix_${VERSION}

    TOOL=G-Nomix
    VERSION=2022-09-18-de952a2

    source SOURCEME_G-Nomix_${VERSION}


    cd $SRCDIR
    wget https://github.com/AI-sandbox/gnomix/archive/refs/heads/main.zip
    unzip main.zip

    # alternatively:
    # git clone https://github.com/AI-sandbox/gnomix
    # git checkout de952a2


Install the dependencies in a virtual environment.

An older version of Python, 3.8.7, was used as the version 3.9.5 was not compatible with the scipy==1.5.3 requirement.

    module load python/3.8.7
    virtualenv $PREFIX/venv
    cd $PREFIX/venv/
    cp -p $SRCDIR/gnomix-main/requirements.txt .
    $PREFIX/venv/bin/pip install -r requirements.txt


Add `#!/sw/bioinfo/G-Nomix/2022-09-18-de952a2/rackham/venv/bin/python` to the top of the Python scripts

    vi `find $SRCDIR/gnomix-main/ -name "*.py"`

Copy additional files and scripts to the installation directory:

    cp -rp $SRCDIR/gnomix-main $PREFIX/.


Make the relevant scripts executable and link them to the `bin` directory:

    chmod a+x `find $SRCDIR/gnomix-main/ -name "*.py"`
    chmod a+x $SRCDIR/gnomix-main/download_pretrained_models.sh

    cd $PREFIX
    mkdir bin
    cd bin

    find $SRCDIR/gnomix-main/ -name "*.py"

    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/gnomix.py gnomix.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Base/base.py base.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Base/models.py models.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Base/string_kernel.py string_kernel.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Gnofix/__init__.py __init__.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Gnofix/gnofix.py gnofix.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Gnofix/phasing.py phasing.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Gnofix/simple_switch.py simple_switch.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/Calibration.py Calibration.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/cnn.py cnn.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/crf.py crf.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/models.py models.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/smooth.py smooth.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/Smooth/utils.py utils.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/laidataset.py laidataset.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/model.py model.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/postprocess.py postprocess.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/preprocess.py preprocess.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/utils.py utils.py
    ln -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/src/visualization.py visualization.py

    ls -s /sw/bioinfo/G-Nomix/2022-09-18-de952a2/src/gnomix-main/download_pretrained_models.sh download_pretrained_models.sh


Edit the module file

    vi $TOOLDIR/mf/$VERSION

Fix permissions and put module files in `/sw/mf`:

    cd $TOOLDIR
    ./G-Nomix-2022-09-18-de952a2_post-install.sh



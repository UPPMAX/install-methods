mgatk/0.7.0
========================

<https://github.com/caleblareau/mgatk>

Used under license:
MIT


Structure creating script (makeroom_mgatk_0.7.0.sh) moved to /sw/bioinfo/mgatk/makeroom_0.7.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "mgatk" "-v" "0.7.0" "-w" "https://github.com/caleblareau/mgatk" "-l" "MIT" "-d" "python-based command line interface for processing .bam files with mitochondrial reads and generating high-quality heteroplasmy estimation from sequencing data." "-s" "misc"
    ./makeroom_mgatk_0.7.0.sh
    source /sw/bioinfo/mgatk/SOURCEME_mgatk_0.7.0 && cd $TOOLDIR
    cd $PREFIX
    ml bioinfo-tools biopython/1.76-py3 #gives 3.7.2
    python3 -m venv --system-site-packages venv3
    . venv3/bin/activate
    which pip
    pip install mgatk
    pip install pulp==2.7.0
    deactivate

There are some R scripts and the needed R libraries are checked in a script. However, since the loaded R_packages have more than 1000 libraries the output is truncated and the needed libraries are not listed.
Therefore, comment these lines in the file:
    $PREFIX/venv3/lib/python3.7/site-packages/mgatk/mgatkHelp.py

        #if(not set(required_packages) < set(installed_packages)):
        #       sys.exit("ERROR: cannot find the following R package: " + str(set(required_packages) - set(installed_packages)) + "\n" +
        #               "Install it in your R console and then try rerunning mgatk (but there may be other missing dependencies).")

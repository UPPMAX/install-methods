bonito/0.3.8-cpu
========================

<https://github.com/nanoporetech/bonito>

Used under license:
Oxford Nanopore Public License 1.0
<https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt>

Structure creating script (makeroom_bonito_0.3.8-cpu.sh) moved to /sw/bioinfo/bonito/makeroom_0.3.8-cpu.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -c "bioinfo" -s "misc" -t "bonito" -v "0.3.8-cpu" -w "https://github.com/nanoporetech/bonito" -d "a PyTorch Basecaller for Oxford Nanopore Reads\; this installation is CPU-only" -l "Oxford Nanopore Public License 1.0" -L "https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt"
    ./makeroom_bonito_0.3.8-cpu.sh
bonito/0.3.8
========================

<https://github.com/nanoporetech/bonito>

Used under license:
Oxford Nanopore Public License 1.0
<https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt>

Structure creating script (makeroom_bonito_0.3.8.sh) moved to /sw/bioinfo/bonito/makeroom_0.3.8.sh

LOG
---

Install using pip since this seems to work fine.

    TOOL=bonito
    VERSION=0.3.8
    cd /sw/bioinfo/
    makeroom.sh -f -c bioinfo -s misc -t $TOOL -v $VERSION -w https://github.com/nanoporetech/bonito -d "a PyTorch Basecaller for Oxford Nanopore Reads" -l "Oxford Nanopore Public License 1.0" -L https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt
    ./makeroom_bonito_0.3.8.sh 
    cd bonito/
    source SOURCEME_bonito_0.3.8 
    module load python/3.8.7
    module load gcc/9.3.0
    PYTHONUSERBASE=$PREFIX pip install --user ont-bonito==0.3.8

You may need to run this twice.

Add $PREFIX/bin to PATH and $PREFIX/lib/python3.8/site-packages to PYTHONPATH.
Test.

    bonito
    bonito basecaller -h

Now download training models into the module.

    bonito download --all

and document these in help.  Copy the command output into the mf file. Escape each opening square bracket with a backslash.


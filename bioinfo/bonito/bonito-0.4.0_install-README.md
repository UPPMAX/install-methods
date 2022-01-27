bonito/0.4.0
============

<https://github.com/nanoporetech/bonito>

Used under license:
Oxford Nanopore Public License 1.0

<https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt>

Structure creating script (makeroom_bonito_0.4.0.sh) moved to /sw/bioinfo/bonito/makeroom_0.4.0.sh

LOG
---

Install the Easybuild/4.5.1 module Bonito/0.4.0-fosscuda-2020b and make this an alias module.

This will not build with --rpath set.

    makeroom.sh -f -c "bioinfo" -s "misc" -t "bonito" -v "0.4.0" -w "https://github.com/nanoporetech/bonito" -d "a PyTorch Basecaller for Oxford Nanopore Reads" -l "Oxford Nanopore Public License 1.0" -L "https://github.com/nanoporetech/bonito/blob/master/LICENCE.txt"
    ./makeroom_bonito_0.4.0.sh

Now the EasyBuild build.

Get a job as part of the staff_cpu reservation. 

    interactive -M snowy -N 1 -n 16 --gres=gpu:1 --gpus-per-node=1 --reservation=staff_gpu -t 24:00:00 -A staff

Within that job, build Bonito.

    cd /sw/EasyBuild
    source source-me-for-EasyBuild-4.5.1-snowy-gpu 
    eb Bonito-0.4.0-fosscuda-2020b.eb 

Install data.

    module load Bonito/0.4.0-fosscuda-2020b
    bonito download --all

See the mf for bonito/0.4.0 for the setup.


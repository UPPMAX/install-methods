tapestri/2.0.1
========================

<https://missionbio.com/products/platform/>

Used under license:

<>

Structure creating script (makeroom_tapestri_2.0.1.sh) moved to /sw/bioinfo/tapestri/makeroom_2.0.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "tapestri" -w "https://missionbio.com/products/platform/" -d "Tapestri DNA Pipeline" -s "annotation" -v "2.0.1"
    ./makeroom_tapestri_2.0.1.sh
    TOOL=tapestri
    version=2.0.1
    cd /sw/bioinfo/${TOOL}
    source SOURCEME_${TOOL}_${version}

    module load python/3.8.7

    cd $SRCDIR
    wget https://dl.missionbio.io/onprem-miniconda/TapestriPipeline-v2.0.1-Linux-x86_64.sh
    sh TapestriPipeline-v2.0.1-Linux-x86_64.sh -u -p $PREFIX
# Do you wish the installer to initialize TapestriPipeline
# by running conda init? [yes|no]
# [no] >>> no
#    eval "$($PREFIX/bin/conda shell.bash hook)"


    cd $PREFIX
    wget https://dl.dev.missionbio.com/pipeline-on-prem/ref/hg19-ref-dna-2.0.1.tar.gz
    tar xfvz hg19-ref-dna-2.0.1.tar.gz -C $PREFIX












edit $PREFIX/config.yaml
genome:
  path: /sw/bioinfo/tapestri/2.0.1/rackham/hg19/ucsc_hg19.fa                         
  version: hg19
inputs:
  tube1:
    r1: ["/sw/bioinfo/tapestri/2.0.1/rackham/testdata/DNA-test_L001_R1_001.fastq.gz"]
    r2: ["/sw/bioinfo/tapestri/2.0.1/rackham/testdata/DNA-test_L001_R2_001.fastq.gz"]
output: 
  prefix: test
panel: 
  name: Myeloid
  path: /sw/bioinfo/tapestri/2.0.1/rackham/panels/Myeloid



# Stuff that was put in your .bashrc if you answered yes while installing.
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/sw/bioinfo/tapestri/2.0.1/src/test/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/sw/bioinfo/tapestri/2.0.1/src/test/etc/profile.d/conda.sh" ]; then
            . "/sw/bioinfo/tapestri/2.0.1/src/test/etc/profile.d/conda.sh"
        else
            export PATH="/sw/bioinfo/tapestri/2.0.1/src/test/bin:$PATH"
        fi
    fi
    unset __conda_setup
# <<< conda initialize <<<
 

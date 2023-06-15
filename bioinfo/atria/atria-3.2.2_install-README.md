atria/3.2.2
========================

<https://github.com/cihga39871/Atria>

Used under license:
Copyright


Structure creating script (makeroom_atria_3.2.2.sh) moved to /sw/bioinfo/atria/makeroom_3.2.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "atria" "-v" "3.2.2" "-d" "An accurate and ultra-fast adapter and quality trimming program for Illumina Next-Generation Sequencing (NGS) data." "-l" "Copyright" "-s" "annotation" "-w" "https://github.com/cihga39871/Atria"
    ./makeroom_atria_3.2.2.sh
    
    # Modules
    module load julia/1.8.5
    module load gcc/9.3.0

    # Download
    cd $SRCDIR
    git clone https://github.com/cihga39871/Atria . 
    git checkout tags/v$VERSION

    # Build
    julia build_atria.jl $PREFIX

 

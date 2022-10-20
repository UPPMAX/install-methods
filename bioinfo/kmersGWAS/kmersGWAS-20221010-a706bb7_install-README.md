kmersGWAS/20221010-a706bb7
========================

<https://github.com/voichek/kmersGWAS>

Used under license:



Structure creating script (makeroom_kmersGWAS_20221010-a706bb7.sh) moved to /sw/bioinfo/kmersGWAS/makeroom_20221010-a706bb7.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "kmersGWAS" "-v" "20221010-a706bb7" "-w" "https://github.com/voichek/kmersGWAS" "-d" "A library for running k-mers-based GWAS" "-s" "annotation"
    ./makeroom_kmersGWAS_20221010-a706bb7.sh
    TOOL=kmersGWAS
    version=20221010-a706bb7

# Clone Repo
    cd $PREFIX
    git clone --recurse-submodules https://github.com/voichek/kmersGWAS.git .


# Load modules
    module load python/2.7.15
    module load R_packages/4.1.1

# Make
    make -j 8

# Add shebang to $PREFIX/kmers_gwas.py
    mv kmers_gwas.py kmers_gwas.py.no_shebang
    cat <(echo '#!/usr/bin/env python') kmers_gwas.py.no_shebang > kmers_gwas.py
    rm kmers_gwas.py.no_shebang







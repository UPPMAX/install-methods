soprano/20240418-938604e
========================

<http://>

Used under license:
GPL-3.0


Structure creating script (makeroom_soprano_20240418-938604e.sh) moved to /sw/data/soprano/makeroom_20240418-938604e.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "soprano" "-v" "20240418-938604e" "-c" "data" "-d" "SelectiOn in PRotein ANnotated regiOns. Adapted dN/dS based method to detect selection in specific protein regions" "-l" "GPL-3.0"
    ./makeroom_soprano_20240418-938604e.sh -w "https://github.com/instituteofcancerresearch/SOPRANO/"


# Downloaded with the soprano-get-genome from https://github.com/instituteofcancerresearch/SOPRANO/. It is currently not available as a module

    cd $PREFIX
    releases=(105 108 109 110 111)
    assemblies=(37 38)

    for release in "${releases[@]}"; do
        for assembly in "${assemblies[@]}"; do
            soprano-get-genome -s homo_sapiens -a GRCh${assembly} -r ${release} &
        done
    done
    wait

    # move to /sw/data
    mkdir -p /sw/data/${TOOL}/${VERSION}
    mv $SRCDIR/ensembl_downloads/ /sw/data/${TOOL}/${VERSION}


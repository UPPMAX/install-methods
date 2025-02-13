Chromium-cellranger/8.0.1
========================

<https://www.10xgenomics.com/support/software/cell-ranger/downloads>

Used under license:



Structure creating script (makeroom_Chromium-cellranger_8.0.1.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_8.0.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "Chromium-cellranger" "-v" "8.0.1" "-m" "cellranger" "-w" "https://www.10xgenomics.com/support/software/cell-ranger/downloads" "-d" "Chromium Single Cell Software Suite" "-f"
    ./makeroom_Chromium-cellranger_8.0.1.sh

    # Download and extract cellranger
    cd $SRCDIR
    curl -o cellranger-8.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-8.0.1.tar.gz?Expires=1723670966&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=I-1Bg-i37D07LfyTpfSbQuwzNjvbbQcc4T81miG~KaGNXByGEYRj2q4-COtAcdJAh0HY5udWPag9pURUq8osrbvx1JZCptzeWHQ~xh7D1f4~GLRaRRUY~0-OQY3YenEFg2DFDXMb3w1AXOu1WtO5YLDfYHg-L8tP9e5UdL9HF1W6Udi8dRsvPKVp2a6PeOpgnoCwMX2F-SUzbCnDfn2RdVDoC77g0jr2Aff2LI3rZiOYo9bWVvdrux0ET6hWCQpyhHIB0Rc4vZ12AIEl8zw6A2rW8RMQRN6OLoh1P1-PGImJp6ippGUkVOGCo0Zs~D2n0o7jGzxtVL5zu0y6wenmfA__"
    tar xfvz cellranger-8.0.1.tar.gz

    # Move to $PREFIX
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX

    # Test
    cd $PREFIX
    ./cellranger testrun --id=tiny

    # New databases were installed: cellranger-data/2024-A and cellranger-VDJ-data/7.1.0


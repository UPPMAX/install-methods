Chromium-cellranger/7.1.0
========================

<http://>

Used under license:



Structure creating script (makeroom_Chromium-cellranger_7.1.0.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_7.1.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "Chromium-cellranger" "-v" "7.1.0" "-m" "cellranger" "-f"
    ./makeroom_Chromium-cellranger_7.1.0.sh

    TOOL=Chromium-cellranger
    VERSION=7.1.0

    cd $SRCDIR

    curl -o cellranger-7.1.0.tar.xz
    "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.1.0.tar.xz?Expires=1683760531&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci03LjEuMC50YXIueHoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODM3NjA1MzF9fX1dfQ__&Signature=M5mecJl-U5L87ue7RU8qCE4D~3chThcjDXkKd5fXYIVBplOIK6RMU03A45zjxGZ9kRIgJNPa02EnE8WOoZ7vy5XpoRaFgmJeOe~8WqpI7mafc6GJTuwsrbvmh9mWZaagMk1SA5IrQD9v9NCQfEEepCRa~oG2dxj1zMc2eaOMfWSJu~fPxrui6JXMONDtJsx3G1nnuRz033X-VIMlyU3fwfufM5ubgsOBpyPpetxy-pL9LBlTfdWCGUjHxxaJiub8sXfG6Gfq0G26Hs9Fnd8p9XlmwIy0SBqOCx2lyVsZcN448J8uz3HvCh-28kzscU06p5dgGsNOASUejPMENpD0xA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

    tar xfJ cellranger-${VERSION}.tar.xz
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX
    cd $PREFIX
    ./cellranger testrun --id=tiny

    # Database
    7.1.0 uses the same databases as 5.0.1 
    2020-A (July 7, 2020)




Chromium-cellranger/7.0.1
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license


Structure creating script (makeroom_Chromium-cellranger_7.0.1.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_7.0.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "Chromium-cellranger" "-v" "7.0.1" "-l" "https://support.10xgenomics.com/docs/license" "-d" "Cell line analysis system" "-w" "https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger" "-m" "cellranger" "-f"
    ./makeroom_Chromium-cellranger_7.0.1.sh

    TOOL=Chromium-cellranger
    VERSION=7.0.1

    cd $SRCDIR
    curl -o cellranger-7.0.1.tar.gz
"https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.0.1.tar.gz?Expires=1662592155&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci03LjAuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NjI1OTIxNTV9fX1dfQ__&Signature=DZWyehcTJxRCYusfCJTzYugSdgQaVpa-9PCRnX8APmWAFohaBl9RHGtoMazQ9u4GKoT8mBJs9~2MaTHrK-kJSAMZAYTcwaRPmlvsk9WBvRC3xULgUSpwoWENUGXQ4B4J-VpEpgTiuQ8FRZZf0zwuvwlJM0Mvsq8abJK1rcDV20CofRTEUPl4q21bFuu~f0MQXSsiqnORLYqhpqP0pvHzG03DIeQT~e~MqTe~30te1QANeAca0Uie6vqSjYrzEiy42wViNsHoxJkRsR12TxvEiDoOzoyHJKg0caaOWp75DREr89B9Eyd4-RBaBwP7807-46XYuhK9pPpe8JilRYMJGQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

    tar xzf cellranger-${VERSION}.tar.gz
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX
    cd $PREFIX
    ./cellranger testrun --id=tiny

    7.0.1 uses the same databases as 5.0.1








Chromium-cellranger/7.0.0
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license


Structure creating script (makeroom_Chromium-cellranger_7.0.0.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_7.0.0.sh

LOG
---
    TOOL=Chromium-cellranger
    VERSION=7.0.0

    makeroom.sh -t "Chromium-cellranger" -v $VERSION -l "https://support.10xgenomics.com/docs/license" -d "Cell line analysis system" -w "https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger" -m "cellranger" -f
    
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
   
    
    cd $SRCDIR

      curl -o cellranger-7.0.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.0.0.tar.gz?Expires=1659375946&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci03LjAuMC50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NTkzNzU5NDZ9fX1dfQ__&Signature=CZETuTSaLEibWbLrRySbBo3U5weSAhkd1TbG1abaI2t~4F2RzrOFyYvi3-VOKGaPl4Sf1JF-D~bjLuGrlbQ6IULm4rhiVyEQgYdJae156Tm9674afb3NOAlsUv6w80baL6ORuEzApjGDw6-d8Uz84mKCMaeLGUp21IT7swm76s7r1A6xoqzbUICMze5PSCnXi9MbyNIxcP21TdnTLksWAZKtdIuRTApJd1XcxWA5~ZaW3iJ4L3QpLzz659gyvLD2lvJyzkP6TK25lIDYY93pV2UWX31q0Zm5IgdQ4Cput5xNyIva9P4hmXAPGqWQBolwh3WoY~FZiC9kv3KgiS53hQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

    tar xzf cellranger-${VERSION}.tar.gz
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX
    cd $PREFIX
    ./cellranger testrun --id=tiny


7.0.0 uses the same databases as 5.0.1

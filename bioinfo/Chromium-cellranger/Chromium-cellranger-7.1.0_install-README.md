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


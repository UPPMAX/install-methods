RStudio/1.4.1106
================

<https://rstudio.com>

Used under license:

Structure creating script (makeroom_RStudio_1.4.1106.sh) moved to /sw/apps/RStudio/makeroom_1.4.1106.sh

LOG
---

    cd /sw/apps/RStudio
    makeroom.sh -f" -t "RStudio" -v "1.4.1106" -c "apps" -w "https://rstudio.com" -d "Integrated development environment for the R language"
    ./makeroom_RStudio_1.4.1106.sh
    source SOURCEME_RStudio_1.4.1106

    cd ${SRCDIR}/
    [[ -f rstudio-${VERSION}-x86_64-fedora.tar.gz ]] || wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-${VERSION}-x86_64-fedora.tar.gz

    tar xf rstudio-${VERSION}-x86_64-fedora.tar.gz 
    rmdir $PREFIX
    mv rstudio-${VERSION} $PREFIX



RStudio/2023.06.0-421
=====================

<https://posit.co/download/rstudio-desktop/>

Used under license:
Custom
<https://posit.co/about/software-license-descriptions/>

Structure creating script (makeroom_RStudio_2023.06.0-421.sh) moved to /sw/apps/RStudio/makeroom_2023.06.0-421.sh

As done with the previous version, employ further efforts to force software rendering
(https://support.rstudio.com/hc/en-us/articles/360017886674-Troubleshooting-RStudio-Rendering-Errors)
Create a module-local `desktop.ini` and set `XDG_CONFIG_DIR` so it finds it,
and adding another environment variable setting to the mf file.


LOG
---


    VERSION=2023.06.0-421

    makeroom.sh "-f" "-c" "apps" "-t" "RStudio" "-v" "$VERSION" "-w" "https://posit.co/download/rstudio-desktop/" "-d" "Integrated development environment for the R language" "-l" "Custom" "-L" "https://posit.co/about/software-license-descriptions/"
    ./makeroom_RStudio_${VERSION}.sh

    source /sw/apps/RStudio/SOURCEME_RStudio_${VERSION} && cd $SRCDIR

    wget https://download1.rstudio.org/electron/centos7/x86_64/rstudio-${VERSION}-x86_64-fedora.tar.gz
    tar xf rstudio-${VERSION}-x86_64-fedora.tar.gz

    rmdir $PREFIX
    mv rstudio-${VERSION/-/+} $PREFIX

    cd $PREFIX
    mkdir -p uppmax-config/RStudio
    cd uppmax-config/RStudio

Now, create `desktop.ini` that contains

    [General]
    desktop.renderingEngine=software

Alternatively we can copy from the previous version:

    cp -av $TOOLDIR/2022.07.1-554/rackham/uppmax-config/RStudio/desktop.ini .

In the mf file, make sure `XDG_CONFIG_HOME` points to `$modroot/uppmax-config`
and that we are doing the equivalent of `export
RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"`



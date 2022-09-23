RStudio/2022.07.1-554
=====================

<https://rstudio.com>

Used under license:
Custom
<https://www.rstudio.com/about/software-license-descriptions/>

Structure creating script (makeroom_RStudio_2022.07.1-554.sh) moved to /sw/apps/RStudio/makeroom_2022.07.1-554.sh


As done with the previous version, employ further efforts to force software rendering
(https://support.rstudio.com/hc/en-us/articles/360017886674-Troubleshooting-RStudio-Rendering-Errors)
Create a module-local `desktop.ini` and set `XDG_CONFIG_DIR` so it finds it,
and adding another environment variable setting to the mf file.


LOG
---

    makeroom.sh "-f" "-c" "apps" "-t" "RStudio" "-v" "2022.07.1.554" "-w" "https://rstudio.com" "-d" "Integrated development environment for the R language" "-l" "Custom" "-L" "https://www.rstudio.com/about/software-license-descriptions/"
    ./makeroom_RStudio_2022.07.1.554.sh

    source /sw/apps/RStudio/SOURCEME_RStudio_2022.07.1.554 && cd $SRCDIR

    wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-2022.07.1-554-x86_64-fedora.tar.gz
    tar xf rstudio-2022.07.1-554-x86_64-fedora.tar.gz 
    rmdir $PREFIX
    mv rstudio-2022.07.1+554 $PREFIX

    cd $PREFIX
    mkdir -p uppmax-config/RStudio
    cd uppmax-config/RStudio

Now, create `desktop.ini` that contains

    [General]
    desktop.renderingEngine=software

In the mf file, add the equivalent of `export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"`



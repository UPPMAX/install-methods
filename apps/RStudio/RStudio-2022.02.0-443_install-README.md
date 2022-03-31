RStudio/2022.02.0-443
========================

<https://rstudio.com>

Used under license:
Custom
<https://www.rstudio.com/about/software-license-descriptions/>

Structure creating script (makeroom_RStudio_2022.02.0-443.sh) moved to /sw/apps/RStudio/makeroom_2022.02.0-443.sh

LOG
---


    makeroom.sh -f -c apps -t RStudio -v 2022.02.0-443  -w "https://rstudio.com" -d "Integrated development environment for the R language" -l Custom -L https://www.rstudio.com/about/software-license-descriptions/
    ./makeroom_RStudio_2022.02.0-443.sh 
    source /sw/apps/RStudio/SOURCEME_RStudio_2022.02.0-443 && cd $SRCDIR
    wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-2022.02.0-443-x86_64-fedora.tar.gz
    tar xf rstudio-2022.02.0-443-x86_64-fedora.tar.gz 
    rmdir $PREFIX
    mv rstudio-2022.02.0+443 $PREFIX


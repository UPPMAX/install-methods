# VarDictJava-1.4.5-install-README.md


VarDictJava
===========

<https://github.com/AstraZeneca-NGS/VarDictJava>


Log
---

    cd /sw/apps/bioinfo
    mkdir VarDictJava
    cd VarDictJava/
    mkdir 1.4.5 mf
    cd 1.4.5/
    mkdir milou src
    cd src
    module load R/3.2.3
    module load java/sun_jdk1.8.0_40
    module load perl/5.18.4
    git clone --recursive https://github.com/AstraZeneca-NGS/VarDictJava.git
    cd VarDictJava/
    ./gradlew clean InstallApp

Reduce loaded RAM to `-Xmx7g`.

    vi build/install/VarDict/bin/VarDict

Set mf so that `PATH` has the top-level `vardict.pl` before the one in `VarDict/`,
and that `perl/5.18.4`, `R/3.2.3` and `java/sun_jdk1.8.0_40` are loaded.  The order
for setting the path is:

    prepend-path PATH /sw/apps/bioinfo/VarDictJava/1.4.5/milou/VarDictJava/VarDict
    prepend-path PATH /sw/apps/bioinfo/VarDictJava/1.4.5/milou/VarDictJava
    prepend-path PATH /sw/apps/bioinfo/VarDictJava/1.4.5/milou/VarDictJava/build/install/VarDict/bin


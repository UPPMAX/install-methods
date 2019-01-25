supernova/2.1.1
================

Chromium Supernova assembler

Download: <https://support.10xgenomics.com/de-novo-assembly/software/downloads/latest>

Installation: <https://support.10xgenomics.com/de-novo-assembly/software/pipelines/latest/installation>

As I did for Cellranger, I restructured the directories, previously they were
`/sw/apps/bioinfo/Chromium/supernova/...`, so I lifted supernova to
`Chromium-supernova` and the module is still available under `supernova/xxx`.

I also decoupled the cellranger data version from the module version, since
that is what 10X Genomics did as well.

LOG
---

The long download ticket will expire, but I'll xxx it out nonetheless.  It's
simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=/sw/apps/bioinfo/Chromium-supernova
    VERSION=2.1.1
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    curl -o supernova-2.1.1.tar.gz "http://cf.10xgenomics.com/releases/assembly/supernova-2.1.1.tar.gz?Expires=1538004480&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9hc3NlbWJseS9zdXBlcm5vdmEtMi4xLjEudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTM4MDA0NDgwfX19XX0_&Signature=TdKNWBcmHPY~pzjUWk1W27wdqxFJ8nK6WFL8JRS3yMv~Jt6MCrttrYaK-RWKF0UIAN0PlaUOgd2-xzqYZF1w~8FUwzInvflRv5nDLbohniTUts7oxpcq~2ZFuw-s2v4Deg6cGTtFzBhyuhjEEzLhhrtnp7kp~F2L38Y4A9GVALK-adC141lqOUso8AF79tiI5Obsgo9EG4iIXBLKe4eN9q1cl6J3pAhdsF07llj6UbHyYvrPjS67GkYhz8ftrKZdyRPwKiFmj3cruqNJOSovbZiHQXp2Lb8TCRqF7gR~IBoqern2BXsfq7y~L~TM9bjnChMqxVl35VqWFRROSt1wbA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf supernova-${VERSION}.tar.gz
    mv supernova-${VERSION} $PFX
    cd ..
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL; done

The data version 1.0.2 is already available at `/sw/data/uppnex/Chromium/cellranger/`.


According to the installation instructions (see above), just add
`/sw/apps/bioinfo/Chromium-supernova/$VERSION/$CLUSTER` to `PATH` in the mf file.
After doing that, do `supernova sitecheck` and then `supernova testrun
--id=tiny`, saving output of both.

    module load bioinfo-tools supernova/$VERSION
    cd $TOOL/$VERSION
    supernova sitecheck | tee sitecheck-${CLUSTER}.txt
    supernova testrun --id=tiny | tee testrun-tiny-${CLUSTER}.txt


snippy 4.0
============

Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


LOG
---

    VERSION=4.0
    CLUSTER+${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/snippy
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src

Make snippy using conda, then mv the bin folder into the 4.0 of the version and removeall other direcoties and filse under the src dir       
export CONDA_ENVS_PATH=/sw/apps/bioinfo/snippy/src/
conda create -n snippy  snippy


rsync -n --del -Pa bcftools /mnt/sw/apps/bioinfo/
rsync --del -Pa bcftools /mnt/sw/apps/bioinfo/
cp -av ${VERSION} /sw/mf/common/bioinfo-tools/misc/bcftools/

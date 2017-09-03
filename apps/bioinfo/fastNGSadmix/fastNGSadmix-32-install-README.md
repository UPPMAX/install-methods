fastNGSadmix/32
===========

fastNGSadmix is "a very nice tool for finding admixture proportions from NGS data."

<http://www.popgen.dk/software/index.php/NgsAdmix>


LOG
---

Clone the repository and get the version to use from `git log | head`:  date
and first 7 characters of the top commit hash.

    VERSION=20170825-099ab7f
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir NGSadmix
    cd NGSadmix
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    git clone https://github.com/e-jorsboe/fastNGSadmix.git
    cd fastNGSadmix
    module load gcc/6.3.0
    make

For the mf file, add `/sw/apps/bioinfo/NGSadmix/$VERSION/$CLUSTER` to `PATH`.


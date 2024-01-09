#!/bin/bash

# Check https://benlangmead.github.io/aws-indexes/k2 to see if there are database updates here

K2_VERSION=2.1.2-20211210-4f648f5

# We load Kraken2 to create an inspect.txt for the 16S_\* databases.

module load bioinfo-tools
module load Kraken2/$K2_VERSION

cd /sw/data/Kraken2_data
source SOURCEME_Kraken2_data
PREBUILT_BASE=$PWD/prebuilt
test -d $PREBUILT_BASE || mkdir $PREBUILT_BASE
cd $PREBUILT_BASE
DEST=$PWD
mkdir -p src
cd src
BASEURL=https://genome-idx.s3.amazonaws.com/kraken
DATABASES=( k2_viral_20220908.tar.gz
            k2_minusb_20220926.tar.gz
            k2_standard_20220926.tar.gz
            k2_standard_08gb_20220926.tar.gz
            k2_standard_16gb_20220926.tar.gz
            k2_pluspf_20220908.tar.gz
            k2_pluspf_08gb_20220908.tar.gz
            k2_pluspf_16gb_20220908.tar.gz
            k2_pluspfp_20220908.tar.gz
            k2_pluspfp_08gb_20220908.tar.gz
            k2_pluspfp_16gb_20220908.tar.gz
            k2_viral_20221209.tar.gz
            k2_minusb_20221209.tar.gz
            k2_standard_20221209.tar.gz
            k2_standard_08gb_20221209.tar.gz
            k2_standard_16gb_20221209.tar.gz
            k2_pluspf_20221209.tar.gz
            k2_pluspf_08gb_20221209.tar.gz
            k2_pluspf_16gb_20221209.tar.gz
            k2_pluspfp_20221209.tar.gz
            k2_pluspfp_08gb_20221209.tar.gz
            k2_pluspfp_16gb_20221209.tar.gz
            k2_eupathdb48_20201113.tar.gz
            k2_viral_20230314.tar.gz
            k2_minusb_20230314.tar.gz
            k2_standard_20230314.tar.gz
            k2_standard_08gb_20230314.tar.gz
            k2_standard_16gb_20230314.tar.gz
            k2_pluspf_20230314.tar.gz
            k2_pluspf_08gb_20230314.tar.gz
            k2_pluspf_16gb_20230314.tar.gz
            k2_pluspfp_20230314.tar.gz
            k2_pluspfp_08gb_20230314.tar.gz
            k2_pluspfp_16gb_20230314.tar.gz
            k2_nt_20230502.tar.gz
            k2_eupathdb48_20230407.tar.gz 
            k2_viral_20230605.tar.gz
            k2_minusb_20230605.tar.gz
            k2_standard_20230605.tar.gz
            k2_standard_08gb_20230605.tar.gz
            k2_standard_16gb_20230605.tar.gz
            k2_pluspf_20230605.tar.gz
            k2_pluspf_08gb_20230605.tar.gz
            k2_pluspf_16gb_20230605.tar.gz
            k2_pluspfp_20230605.tar.gz
            k2_pluspfp_08gb_20230605.tar.gz
            k2_pluspfp_16gb_20230605.tar.gz
            k2_viral_20231009.tar.gz
            k2_minusb_20231009.tar.gz
            k2_standard_20231009.tar.gz
            k2_standard_08gb_20231009.tar.gz
            k2_standard_16gb_20231009.tar.gz
            k2_pluspf_20231009.tar.gz
            k2_pluspf_08gb_20231009.tar.gz
            k2_pluspf_16gb_20231009.tar.gz
            k2_pluspfp_20231009.tar.gz
            k2_pluspfp_08gb_20231009.tar.gz
            k2_pluspfp_16gb_20231009.tar.gz
            k2_nt_20231129.tar.gz
            16S_Greengenes13.5_20200326.tgz
            16S_RDP11.5_20200326.tgz
            16S_Silva132_20200326.tgz
            16S_Silva138_20200326.tgz )
       

for P in "${DATABASES[@]}"
do
    B=${P%.tar.gz} # this results in B=k2_viral_20220908
    B=${B%.tgz}    # in case it instead ends with .tgz
    [[ -f $P ]] && echo "$P already exists in src/ directory" || wget $BASEURL/$P
    if [[ $B == 16S_* ]] ; then # is a 16S_* database, set SUB_B to its subdirectory name, which will exist if it is unpacked
        shopt -s nullglob
        SUB_B=($DEST/$B/16S_*)
        shopt -u nullglob
        [[ "$SUB_B" ]] && SUB_B=${SUB_B##*/}
    fi
    if [[ -f $DEST/$B/inspect.txt ]] ; then  # standard file structure
        echo "$P already unpacked to $DEST/$B/"
    elif [[ "$SUB_B" && -f $DEST/$B/$SUB_B/inspect.txt ]] ; then  # 16S_* with alternate file structure
        echo "$P is a 16S_* database and already unpacked to $DEST/$B/$SUB_B/"
        #
    else   # it is not unpacked or is missing something
        if [[ ! -f $DEST/$B/taxo.k2d && ! -f $DEST/$B/$SUB_B/taxo.k2d ]] ; then
            echo "Unpacking $P to $DEST/$B/ ..."
            mkdir -p $DEST/$B
            tar xf $P --directory $DEST/$B
        fi
        if [[ "$B" == "k2_eupathdb48_20230407" && -f $DEST/$B/taxo.k2d ]] ; then
            # This database does not contain an inspect.txt file within its tarball.  There is one under
            # a noncanonical name available at the download website, so place it as its inspect.txt.
            # This should have been done at unpacking
            echo "$P is unpacked to $DEST/$B/ but is missing inspect.txt"
            echo "Downloading replacement $DEST/$B/inspect.txt from origin ..."
            wget -O $DEST/$B/inspect.txt https://genome-idx.s3.amazonaws.com/kraken/$B/kraken2inspect_output.txt
        elif [[ $B == 16S_* && "$SUB_B" && -f $DEST/$B/$SUB_B/taxo.k2d ]] ; then
            # The 16S_* databases have an alternate structure, with a subdirectory containing the database.
            # We have already found this subdirectory name, in $SUB_B
            # We create the inspect.txt from scratch
            echo "$P is a 16S_* database with alternate structure and has no inspect.txt"
            echo "Creating one using 'kraken2-inspect' ..."
            (
                cd $DEST/$B
                kraken2-inspect --db ./$SUB_B > inspect.txt && mv inspect.txt $SUB_B/ || { echo "*** could not create inspect.txt"; exit 1; }
            )
        fi
    fi
done
cd $PREBUILT_BASE


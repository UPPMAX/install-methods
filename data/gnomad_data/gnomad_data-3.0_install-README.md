gnomad_data/3.0
========================

<https://gnomad.broadinstitute.org/>

Used under license:
Creative Commons Zero Public Domain Dedication
<https://creativecommons.org/publicdomain/zero/1.0/>

Structure creating script (makeroom_gnomad_data_3.0.sh) moved to /sw/data/gnomad_data/makeroom_3.0.sh

LOG
---

    TOOL=gnomad_data
    VERSION=3.0
    CLUSTER=rackham
    TOOLDIR=/sw/data/$TOOL
    VERSIONDIR=/sw/data/$TOOL/$VERSION
    PREFIX=/sw/data/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/data/gnomad_data/3.0/src
    /home/laekl991/scripts/install-methods/makeroom.sh -t "gnomad_data" -v "3.0" -c "data" -w "https://gnomad.broadinstitute.org/" -l "Creative Commons Zero Public Domain Dedication" -L "https://creativecommons.org/publicdomain/zero/1.0/" -d "The Genome Aggregation Database \(gnomAD\) is a resource developed by an international coalition of investigators\, with the goal of aggregating and harmonizing both exome and genome sequencing data from a wide variety of large-scale sequencing projects\, and making summary data available for the wider scientific community." -f"
    ./makeroom_gnomad_data_3.0.sh
gnomad_data/2.1.1
========================

<https://gnomad.broadinstitute.org/>

Used under license:
Creative Commons Zero Public Domain Dedication
<https://creativecommons.org/publicdomain/zero/1.0/>

Structure creating script (makeroom_gnomad_data_2.1.1.sh) moved to /sw/data/gnomad_data/makeroom_2.1.1.sh

LOG
---

    TOOL=gnomad_data
    VERSION=2.1.1
    CLUSTER=rackham
    TOOLDIR=/sw/data/$TOOL
    VERSIONDIR=/sw/data/$TOOL/$VERSION
    PREFIX=/sw/data/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/data/gnomad_data/2.1.1/src
    /home/laekl991/scripts/install-methods/makeroom.sh -t "gnomad_data" -v "2.1.1" -c "data" -w "https://gnomad.broadinstitute.org/" -l "Creative Commons Zero Public Domain Dedication" -L "https://creativecommons.org/publicdomain/zero/1.0/" -d "The Genome Aggregation Database \(gnomAD\) is a resource developed by an international coalition of investigators\, with the goal of aggregating and harmonizing both exome and genome sequencing data from a wide variety of large-scale sequencing projects\, and making summary data available for the wider scientific community." -f"
   module load GoogleCloudSDK
   gsutil -m cp -r gs://gnomad-public/release/$VERSION/vcf $PREFIX

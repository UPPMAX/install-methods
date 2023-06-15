Kraken2 database updates
========================

Prebuilt databases
------------------

Downloading Kraken2/Bracken Refseq indexes from https://benlangmead.github.io/aws-indexes/k2

Note that these are versioned as a collection by date rows in the table at that website. Individual databases have dates, but the collection date **9/26/2022** will be used for all the downloaded indices, and as these are updated, we will use a new version for that as well.

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
                k2_eupathdb48_20230407.tar.gz )




    for P in "${DATABASES[@]}"
    do
        B=${P%.tar.gz} # this results in B=k2_viral_20220908
        [[ -f $P ]] && echo "$P already exists in src/ directory" || wget $BASEURL/$P
        [[ -f $DEST/$B/inspect.txt ]] && echo "$P already unpacked to $DEST/$B" || { mkdir -p $DEST/$B ; tar xf $P --directory $DEST/$B ; }
    done
    cd $PREBUILT_BASE

Text for the mf file:

    Prebuilt Kraken 2 / Bracken refseq indices, from https://benlangmead.github.io/aws-indexes/k2 in collection dated "9/26/2022".

    Local name                                         Collection    Contains                                                          Date        Archive size (GB)  Index sixe (GB) 

    \$KRAKEN2_DB_PREBUILT/k2_viral_20230314            Viral         Refeq viral                                                       3/14/2023           0.4               0.5
    \$KRAKEN2_DB_PREBUILT/k2_minusb_20230314           MinusB        Refeq archaea, viral, plasmid, human1, UniVec_Core                3/14/2023           6.4               9.0*
    \$KRAKEN2_DB_PREBUILT/k2_standard_20230314         Standard      Refeq archaea, bacteria, viral, plasmid, human1, UniVec_Core      3/14/2023          49                64
    \$KRAKEN2_DB_PREBUILT/k2_standard_08gb_20230314    Standard-8    Standard with DB capped at 8 GB                                   3/14/2023           5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_standard_16gb_20230314    Standard-16   Standard with DB capped at 16 GB                                  3/14/2023          11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_20230314           PlusPF        Standard plus Refeq protozoa & fungi                              3/14/2023          53                69
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20230314      PlusPF-8      PlusPF with DB capped at 8 GB                                     3/14/2023           5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20230314      PlusPF-16     PlusPF with DB capped at 16 GB                                    3/14/2023          11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_20230314          PlusPFP       Standard plus Refeq protozoa, fungi & plant                       3/14/2023         106               144
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20230314     PlusPFP-8     PlusPFP with DB capped at 8 GB                                    3/14/2023           5.1               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20230314     PlusPFP-16    PlusPFP with DB capped at 16 GB                                   3/14/2023          11                15

    \$KRAKEN2_DB_PREBUILT/k2_nt_20230502               nt Database   Very large collection, inclusive of GenBank, RefSeq, TPA and PDB  5/2/2023          360               480

    \$KRAKEN2_DB_PREBUILT/k2_eupathdb48_20230407       EuPathDB462   Eukaryotic pathogen genomes with contaminants removed             4/18/2023           8.4              11

    \$KRAKEN2_DB_PREBUILT/k2_viral_20221209            Viral         viral                                                             2022-12-09          0.4               0.5
    \$KRAKEN2_DB_PREBUILT/k2_minusb_20221209           MinusB        archaea, viral, plasmid, human1, UniVec_Core                      2022-12-09          6.1               8.7
    \$KRAKEN2_DB_PREBUILT/k2_standard_20221209         Standard      archaea, bacteria, viral, plasmid, human1, UniVec_Core            2022-12-09         48                62
    \$KRAKEN2_DB_PREBUILT/k2_standard_08gb_20221209    Standard-8    Standard with DB capped at 8 GB                                   2022-12-09          5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_standard_16gb_20221209    Standard-16   Standard with DB capped at 16 GB                                  2022-12-09         11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_20221209           PlusPF        Standard plus protozoa & fungi                                    2022-12-09         51                66
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20221209      PlusPF-8      PlusPF with DB capped at 8 GB                                     2022-12-09          5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20221209      PlusPF-16     PlusPF with DB capped at 16 GB                                    2022-12-09         11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_20221209          PlusPFP       Standard plus protozoa, fungi & plant                             2022-12-09        104               142
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20221209     PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2022-12-09          5.1               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20221209     PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2022-12-09         11                15

    \$KRAKEN2_DB_PREBUILT/k2_eupathdb48_20201113       EuPathDB462   Eukaryotic pathogen genomes with contaminants removed             2020-11-13         26.4              34.1

    \$KRAKEN2_DB_PREBUILT/k2_viral_20220908            Viral         viral                                                             2022-09-08          0.4               0.5
    \$KRAKEN2_DB_PREBUILT/k2_minusb_20220926           MinusB3       archaea, viral, plasmid, human1, UniVec_Core                      2022-09-26          5.9               8.5
    \$KRAKEN2_DB_PREBUILT/k2_standard_20220926         Standard3     archaea, bacteria, viral, plasmid, human1, UniVec_Core            2022-09-26         46                60
    \$KRAKEN2_DB_PREBUILT/k2_standard_08gb_20220926    Standard-83   Standard with DB capped at 8 GB                                   2022-09-26          5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_standard_16gb_20220926    Standard-163  Standard with DB capped at 16 GB                                  2022-09-26         11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_20220908           PlusPF        Standard plus protozoa & fungi                                    2022-09-08         49                64
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20220908      PlusPF-8      PlusPF with DB capped at 8 GB                                     2022-09-08          5.5               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20220908      PlusPF-16     PlusPF with DB capped at 16 GB                                    2022-09-08         11                15
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_20220908          PlusPFP       Standard plus protozoa, fungi & plant                             2022-09-08         99               129
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20220908     PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2022-09-08          5.1               7.5
    \$KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20220908     PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2022-09-08         11                15



Locally built databases
-----------------------

We run two update scripts monthly via crontab on rackham5

* `Kraken2-update-db.sh`, to update the standard, greengenes, rdp and silva databases.
* `Kraken2-update-nt.sh`, to update a database built from NCBI's nt.  Requires a 256GB node.


The comments below apply equally to `Kraken2-update-db.sh` and `Kraken2-update-nt.sh`.
The build of `Kraken2-update-nt.sh` requires 

    kraken2-build_parallel --download-taxonomy --db $DB
    kraken2-build_parallel --download-library $DB_TYPE --db $DB
    kraken2-build_parallel --build --threads $THREADS --db $DB

where `$DB_TYPE` is `nt` and `$DB` is `<prefix>/<date>_nt`.  Symlink is created
at the end from `latest_nt` to this.

`Kraken2-update-db.sh` builds four Kraken2 databases, using custom `_parallel`
versions of the scripts that have been placed in the module directory of
Kraken2.  These incorporate a pull request from the Kraken2 repository
suggesting to parallelise dustmasker.

It builds the default database using `kraken2-build --standard`.

    #!/bin/bash

    #SBATCH -A staff
    #SBATCH -J Kraken2-update-db.sh
    #SBATCH -p node
    #SBATCH -n 20
    #  Not necessary to use fat node for Kraken2.  Max on build of standard library was ~40GB
    ##SBATCH -C mem256GB
    #SBATCH -t 24:00:00
    ##SBATCH --qos=uppmax_staff_4nodes
    #SBATCH --mail-user douglas.scofield@ebc.uu.se
    #SBATCH --mail-type=ALL
    #SBATCH -o /sw/data/uppnex/Kraken2/slurm-%j.out

    K2_DB_BASE=/sw/data/uppnex/Kraken2
    K2_VERSION=2.0.7-beta-bc14b13
    THREADS=${1:-$SLURM_JOB_CPUS_PER_NODE}
    #MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
    #MINGB=200 # This now must run on a 256GB node, it needs just under 200GB to build the standard database

    function error_send_email()
    {
        MSG="Error while building Kraken2 DB: '$1'"
        mailx -s "Kraken2 DB build error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
        exit 1
    }

    #(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
    #
    #echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

    set -e

    module load bioinfo-tools
    module load Kraken2/$K2_VERSION
    module load gnuparallel/20180822

    #set -x

    VERSION=$(date +'%Y%m%d')

    cd $K2_DB_BASE
    #mkdir $VERSION || error_send_email "In $K2_DB_BASE, new directory '$VERSION' exists, quitting..."

    # comment kraken-build and uncomment cd;touch to test the script
    # ( cd $VERSION ; touch a1 a2 a3 )
    K2_DB=$K2_DB_BASE/$VERSION
    /usr/bin/time -v kraken2-build_parallel --standard --threads $THREADS --db $K2_DB
    rm -f latest
    ln -sf ./$VERSION latest
    chgrp -hR sw ./$VERSION latest
    chmod -R u+rwX,g+rwX,o+rX ./$VERSION
    [[ -L latest ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link 'latest', quitting..."
    for DB_TYPE in greengenes rdp silva
    do
        DB=${VERSION}_${DB_TYPE}
        /usr/bin/time -v kraken2-build_parallel --special $DB_TYPE --threads $THREADS --db $K2_DB_BASE/$DB
        LN=latest_${DB_TYPE}
        rm -f $LN
        ln -sf ./$DB $LN
        chgrp -hR sw ./$DB $LN
        chmod -R u+rwX,g+rwX,o+rX ./$DB
        [[ -L $LN ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link '$LN', quitting..."
    done

    #MF_K=/sw/mf/common/bioinfo-tools/misc/Kraken2/$K2_VERSION
    #sed -i -e "s/Downloaded: [0-9]\+/Downloaded: $VERSION/" $MF_K
    #
    #echo -e "In $K2_DB_BASE, prepared $K2_DB and linked 'latest' to $K2_DB; double-check the mf file $MF_K below:\n\n" \
    #    | cat - $MF_K \
    #    | mailx -s "Kraken2 DB build successful: '$K2_DB'" douglas.scofield@ebc.uu.se

    echo -e "In $K2_DB_BASE: prepared databases latest, greengenes, rdp, silva\n" \
        | mailx -s "Kraken2 DB build successful in $K2_DB_BASE" douglas.scofield@ebc.uu.se



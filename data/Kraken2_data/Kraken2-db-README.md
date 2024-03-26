Kraken2 database updates
========================

### Update 2024-03-19

Added new suite of basic prebuilt databases. Also switched to `puts stderr { ... }` for the table in the mf file, so no more need to escape the dollar
signs.

### Update 2023-07-03

RDP database no longer available, website is shut down

So remove download of this database in the Kraken2-update-db.sh script.


Prebuilt databases
------------------

Downloading Kraken2/Bracken Refseq indexes from <https://benlangmead.github.io/aws-indexes/k2>

See `Kraken2-update-prebuilt.sh` for downloading of prebuilt databases.

**Check the website for updates and if necessary add new databases to the
update-prebuilt script and the table below.**

Note that these are versioned as a collection by date rows in the table at that
website. Individual databases have dates, note those here. The whole module will
be versioned `latest`


Text for mf file help
---------------------

    Prebuilt Kraken 2 / Bracken refseq indices, from https://benlangmead.github.io/aws-indexes/k2

    Local name                                         Collection    Contains                                                          Date        Archive size (GB)  Index sixe (GB) 

    $KRAKEN2_DB_PREBUILT/k2_viral_20240112             Viral         Refeq viral                                                       2024-01-12          0.5               0.6
    $KRAKEN2_DB_PREBUILT/k2_minusb_20240112            MinusB        Refeq archaea, viral, plasmid, human1, UniVec_Core                2024-01-12          6.7               9.7
    $KRAKEN2_DB_PREBUILT/k2_standard_20240112          Standard      Refeq archaea, bacteria, viral, plasmid, human1, UniVec_Core      2024-01-12         55                72
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20240112     Standard-8    Standard with DB capped at 8 GB                                   2024-01-12          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20240112     Standard-16   Standard with DB capped at 16 GB                                  2024-01-12         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20240112            PlusPF        Standard plus Refeq protozoa & fungi                              2024-01-12         59                77
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20240112       PlusPF-8      PlusPF with DB capped at 8 GB                                     2024-01-12          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20240112       PlusPF-16     PlusPF with DB capped at 16 GB                                    2024-01-12         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20240112           PlusPFP       Standard plus Refeq protozoa, fungi & plant                       2024-01-12        126               171
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20240112      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2024-01-12          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20240112      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2024-01-12         11                15

    $KRAKEN2_DB_PREBUILT/k2_viral_20231009             Viral         Refeq viral                                                       2023-10-09          0.5               0.6
    $KRAKEN2_DB_PREBUILT/k2_minusb_20231009            MinusB        Refeq archaea, viral, plasmid, human1, UniVec_Core                2023-10-09          6.6               9.5
    $KRAKEN2_DB_PREBUILT/k2_standard_20231009          Standard      Refeq archaea, bacteria, viral, plasmid, human1, UniVec_Core      2023-10-09         53                70
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20231009     Standard-8    Standard with DB capped at 8 GB                                   2023-10-09          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20231009     Standard-16   Standard with DB capped at 16 GB                                  2023-10-09         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20231009            PlusPF        Standard plus Refeq protozoa & fungi                              2023-10-09         57                74
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20231009       PlusPF-8      PlusPF with DB capped at 8 GB                                     2023-10-09          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20231009       PlusPF-16     PlusPF with DB capped at 16 GB                                    2023-10-09         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20231009           PlusPFP       Standard plus Refeq protozoa, fungi & plant                       2023-10-09        124               148
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20231009      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2023-10-09          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20231009      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2023-10-09         11                15

    $KRAKEN2_DB_PREBUILT/k2_nt_20231129                nt Database   Very large collection, inclusive of GenBank, RefSeq, TPA and PDB  2023-11-29        550               710

    $KRAKEN2_DB_PREBUILT/k2_viral_20230605             Viral         Refeq viral                                                       2023-06-05          0.5               0.6
    $KRAKEN2_DB_PREBUILT/k2_minusb_20230605            MinusB        Refeq archaea, viral, plasmid, human1, UniVec_Core                2023-06-05          6.5               9.4
    $KRAKEN2_DB_PREBUILT/k2_standard_20230605          Standard      Refeq archaea, bacteria, viral, plasmid, human1, UniVec_Core      2023-06-05         51                67 
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20230605     Standard-8    Standard with DB capped at 8 GB                                   2023-06-05          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20230605     Standard-16   Standard with DB capped at 16 GB                                  2023-06-05         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20230605            PlusPF        Standard plus       Refeq protozoa & fungi                        2023-06-05         55                71
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20230605       PlusPF-8      PlusPF with DB capped at 8 GB                                     2023-06-05          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20230605       PlusPF-16     PlusPF with DB capped at 16 GB                                    2023-06-05         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20230605           PlusPFP       Standard plus       Refeq protozoa, fungi & plant                 2023-06-05        108               148
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20230605      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2023-06-05          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20230605      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2023-06-05         10                15

    $KRAKEN2_DB_PREBUILT/k2_nt_20230502                nt Database   Very large collection, inclusive of GenBank, RefSeq, TPA and PDB  2023-05-02        360               480

    $KRAKEN2_DB_PREBUILT/k2_eupathdb48_20230407        EuPathDB462   Eukaryotic pathogen genomes with contaminants removed             2023-04-18          8.4              11

    $KRAKEN2_DB_PREBUILT/k2_viral_20230314             Viral         Refeq viral                                                       2023-03-14          0.4               0.5
    $KRAKEN2_DB_PREBUILT/k2_minusb_20230314            MinusB        Refeq archaea, viral, plasmid, human1, UniVec_Core                2023-03-14          6.4               9.0*
    $KRAKEN2_DB_PREBUILT/k2_standard_20230314          Standard      Refeq archaea, bacteria, viral, plasmid, human1, UniVec_Core      2023-03-14         49                64
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20230314     Standard-8    Standard with DB capped at 8 GB                                   2023-03-14          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20230314     Standard-16   Standard with DB capped at 16 GB                                  2023-03-14         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20230314            PlusPF        Standard plus Refeq protozoa & fungi                              2023-03-14         53                69
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20230314       PlusPF-8      PlusPF with DB capped at 8 GB                                     2023-03-14          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20230314       PlusPF-16     PlusPF with DB capped at 16 GB                                    2023-03-14         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20230314           PlusPFP       Standard plus Refeq protozoa, fungi & plant                       2023-03-14        106               144
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20230314      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2023-03-14          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20230314      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2023-03-14         11                15

    $KRAKEN2_DB_PREBUILT/k2_viral_20221209             Viral         viral                                                             2022-12-09          0.4               0.5
    $KRAKEN2_DB_PREBUILT/k2_minusb_20221209            MinusB        archaea, viral, plasmid, human1, UniVec_Core                      2022-12-09          6.1               8.7
    $KRAKEN2_DB_PREBUILT/k2_standard_20221209          Standard      archaea, bacteria, viral, plasmid, human1, UniVec_Core            2022-12-09         48                62
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20221209     Standard-8    Standard with DB capped at 8 GB                                   2022-12-09          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20221209     Standard-16   Standard with DB capped at 16 GB                                  2022-12-09         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20221209            PlusPF        Standard plus protozoa & fungi                                    2022-12-09         51                66
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20221209       PlusPF-8      PlusPF with DB capped at 8 GB                                     2022-12-09          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20221209       PlusPF-16     PlusPF with DB capped at 16 GB                                    2022-12-09         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20221209           PlusPFP       Standard plus protozoa, fungi & plant                             2022-12-09        104               142
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20221209      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2022-12-09          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20221209      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2022-12-09         11                15

    $KRAKEN2_DB_PREBUILT/k2_viral_20220908             Viral         viral                                                             2022-09-08          0.4               0.5
    $KRAKEN2_DB_PREBUILT/k2_minusb_20220926            MinusB3       archaea, viral, plasmid, human1, UniVec_Core                      2022-09-26          5.9               8.5
    $KRAKEN2_DB_PREBUILT/k2_standard_20220926          Standard3     archaea, bacteria, viral, plasmid, human1, UniVec_Core            2022-09-26         46                60
    $KRAKEN2_DB_PREBUILT/k2_standard_08gb_20220926     Standard-83   Standard with DB capped at 8 GB                                   2022-09-26          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_standard_16gb_20220926     Standard-163  Standard with DB capped at 16 GB                                  2022-09-26         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspf_20220908            PlusPF        Standard plus protozoa & fungi                                    2022-09-08         49                64
    $KRAKEN2_DB_PREBUILT/k2_pluspf_08gb_20220908       PlusPF-8      PlusPF with DB capped at 8 GB                                     2022-09-08          5.5               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspf_16gb_20220908       PlusPF-16     PlusPF with DB capped at 16 GB                                    2022-09-08         11                15
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_20220908           PlusPFP       Standard plus protozoa, fungi & plant                             2022-09-08         99               129
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_08gb_20220908      PlusPFP-8     PlusPFP with DB capped at 8 GB                                    2022-09-08          5.1               7.5
    $KRAKEN2_DB_PREBUILT/k2_pluspfp_16gb_20220908      PlusPFP-16    PlusPFP with DB capped at 16 GB                                   2022-09-08         11                15

    $KRAKEN2_DB_PREBUILT/k2_eupathdb48_20201113        EuPathDB462   Eukaryotic pathogen genomes with contaminants removed             2020-11-13         26.4              34.1


    Prebuilt Kraken 2 / Bracken 16S RNA indexes

    All packages contain a Kraken 2 database along with Bracken databases built for 100mers, 150mers, and 200mers.

    Local name                                                             Collection        Collection URL                          Date           Size (MB)

    $KRAKEN2_DB_PREBUILT/16S_Greengenes13.5_20200326/16S_Greengenes_k2db   Greengenes 13.5   https://greengenes.secondgenome.com/    20200326          73.2
    $KRAKEN2_DB_PREBUILT/16S_RDP11.5_20200326/16S_RDP_k2db                 RDP 11.5          https://rdp.cme.msu.edu/                20200326         168
    $KRAKEN2_DB_PREBUILT/16S_Silva132_20200326/16S_SILVA132_k2db           Silva 132         https://www.arb-silva.de/               20200326         117
    $KRAKEN2_DB_PREBUILT/16S_Silva138_20200326/16S_SILVA138_k2db           Silva 138         https://www.arb-silva.de/               20200326         112



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


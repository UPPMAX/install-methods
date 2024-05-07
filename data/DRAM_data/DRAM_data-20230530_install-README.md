DRAM_data/20230530
==================

<https://github.com/WrightonLabCSU/DRAM>

Used under license:
Mixed

Help from `DRAM-setup.py prepare_databases --help`:

    (/proj/staff/douglas/ticket-work/273274/DRAM) rackham5: /sw/data/DRAM_data/20230530/rackham $ DRAM-setup.py prepare_databases --help
    usage: DRAM-setup.py prepare_databases [-h] [--output_dir OUTPUT_DIR] [--kegg_loc KEGG_LOC] [--gene_ko_link_loc GENE_KO_LINK_LOC] [--kofam_hmm_loc KOFAM_HMM_LOC]
                                           [--kofam_ko_list_loc KOFAM_KO_LIST_LOC] [--kegg_download_date KEGG_DOWNLOAD_DATE] [--uniref_loc UNIREF_LOC] [--uniref_version UNIREF_VERSION]
                                           [--skip_uniref] [--pfam_loc PFAM_LOC] [--pfam_hmm_loc PFAM_HMM_LOC] [--dbcan_loc DBCAN_LOC] [--dbcan_fam_activities DBCAN_FAM_ACTIVITIES]
                                           [--dbcan_version DBCAN_VERSION] [--vogdb_loc VOGDB_LOC] [--vog_annotations VOG_ANNOTATIONS] [--viral_loc VIRAL_LOC] [--peptidase_loc PEPTIDASE_LOC]
                                           [--genome_summary_form_loc GENOME_SUMMARY_FORM_LOC] [--module_step_form_loc MODULE_STEP_FORM_LOC] [--etc_module_database_loc ETC_MODULE_DATABASE_LOC]
                                           [--function_heatmap_form_loc FUNCTION_HEATMAP_FORM_LOC] [--amg_database_loc AMG_DATABASE_LOC] [--branch BRANCH] [--keep_database_files]
                                           [--threads THREADS] [--select_db SELECT_DB] [--clear_config] [--verbose]

    options:
      -h, --help            show this help message and exit
      --output_dir OUTPUT_DIR
                            output directory (default: .)
      --kegg_loc KEGG_LOC   KEGG protein file, should be a single .pep, please merge all KEGG pep files (default: None)
      --gene_ko_link_loc GENE_KO_LINK_LOC
                            KEGG gene ko link, can be gzipped or not (default: None)
      --kofam_hmm_loc KOFAM_HMM_LOC
                            hmm file for KOfam (profiles.tar.gz) (default: None)
      --kofam_ko_list_loc KOFAM_KO_LIST_LOC
                            KOfam ko list file (ko_list.gz) (default: None)
      --kegg_download_date KEGG_DOWNLOAD_DATE
                            Date KEGG was download to include in database name (default: None)
      --uniref_loc UNIREF_LOC
                            File path to uniref, if already downloaded (uniref90.fasta.gz) (default: None)
      --uniref_version UNIREF_VERSION
                            UniRef version to download (default: 90)
      --skip_uniref         Do not download and process uniref90. Saves time and memory usage and does not impact DRAM distillation (default: False)
      --pfam_loc PFAM_LOC   File path to pfam-A full file, if already downloaded (Pfam-A.full.gz) (default: None)
      --pfam_hmm_loc PFAM_HMM_LOC
                            pfam hmm .dat file to get PF descriptions, if already downloaded (Pfam-A.hmm.dat.gz) (default: None)
      --dbcan_loc DBCAN_LOC
                            File path to dbCAN, if already downloaded (dbCAN-HMMdb-V9.txt) (default: None)
      --dbcan_fam_activities DBCAN_FAM_ACTIVITIES
                            CAZY family activities file, if already downloaded (CAZyDB.07302020.fam-activities.txt) (default: None)
      --dbcan_version DBCAN_VERSION
                            version of dbCAN to use (default: 11)
      --vogdb_loc VOGDB_LOC
                            hmm file for vogdb, if already downloaded (vog.hmm.tar.gz) (default: None)
      --vog_annotations VOG_ANNOTATIONS
                            vogdb annotations file, if already downloaded (vog.annotations.tsv.gz) (default: None)
      --viral_loc VIRAL_LOC
                            File path to merged viral protein faa, if already downloaded (viral.x.protein.faa.gz) (default: None)
      --peptidase_loc PEPTIDASE_LOC
                            File path to MEROPS peptidase fasta, if already downloaded (pepunit.lib) (default: None)
      --genome_summary_form_loc GENOME_SUMMARY_FORM_LOC
                            File path to genome summary form,if already downloaded (default: None)
      --module_step_form_loc MODULE_STEP_FORM_LOC
                            File path to module step form, ifalready downloaded (default: None)
      --etc_module_database_loc ETC_MODULE_DATABASE_LOC
                            File path to etc module database, if already downloaded (default: None)
      --function_heatmap_form_loc FUNCTION_HEATMAP_FORM_LOC
                            File path to function heatmap form, if already downloaded (default: None)
      --amg_database_loc AMG_DATABASE_LOC
                            File path to amg database, if already downloaded (default: None)
      --branch BRANCH       git branch from which to download forms; THIS SHOULD NOT BE CHANGED BY REGULAR USERS (default: master)
      --keep_database_files
                            Keep unporcessed database files (default: False)
      --threads THREADS     Number of threads to use building mmseqs2 databases (default: 10)
      --select_db SELECT_DB
                            The db or dbs the you want to update if you don't want to do a full upgrade (default: None)
      --clear_config        By default when you set up a new db the old db is cleared, but not if you use select_db. If you use select db you can add this argument, forcing the old config to
                            be cleared.(beta) (default: False)
      --verbose             Make it talk more (default: False)


Structure creating script (makeroom_DRAM_data_20230530.sh) moved to /sw/data/DRAM_data/makeroom_20230530.sh



LOG
---

Set up our own conda environment with DRAM.

    cd /proj/staff/douglas
    mkdir -p ticket-work/273274
    cd ticket-work/273274
    ml conda/latest
    wget https://raw.githubusercontent.com/WrightonLabCSU/DRAM/master/environment.yaml
    conda env create --offline -f environment.yaml -n DRAM

Activate, I don't always have conda capability active in my environment.

    source ~/.conda_setup
    export CONDA_ENVS_PATH=$PWD
    conda activate DRAM

Build databases into /sw/data/DRAM_data.

    makeroom.sh "-f" "-t" "DRAM_data" "-v" "20230530" "-c" "data" "-l" "Mixed" "-w" "https://github.com/WrightonLabCSU/DRAM" "-d" "Databases for DRAM, Distilled and Refined Annotation of Metabolism: A tool for the annotation and curation of function for microbial and viral genomes"
    ./makeroom_DRAM_data_20230530.sh


    DRAM-setup.py prepare_databases \
        --output_dir /sw/data/DRAM_data/20230530/rackham/ \
        --threads 10 \
        --keep_database_files \
        --kofam_hmm_loc /sw/data/DRAM_data/20230530/src/kofam_profiles.tar.gz \
        --kofam_ko_list_loc /sw/data/DRAM_data/20230530/src/kofam_ko_list.tsv.gz \
        --uniref_loc /sw/data/blast_tmp/uniprot/current_release/uniref/uniref90/uniref90.fasta.gz \
        --pfam_loc /sw/data/Pfam/35.0/src/Pfam-A.full.gz \
        --pfam_hmm_loc /sw/data/Pfam/35.0/src/Pfam-A.hmm.dat.gz \
        --dbcan_loc /sw/data/dbCAN/11/rackham/dbCAN-HMMdb-V11.txt \
        --dbcan_fam_activities /sw/data/dbCAN/11/rackham/CAZyDB.08062022.fam-activities.txt

OK, it died trying to populate the description database. This is as far as it got. Apparently it also did not use local dbCAN, which is a bummer but no big deal.
Ran this around 2023-05-24, the contents of `$PREFIX/database_processing.log`. The build really needs to be run on something like s229.

    2023-05-26 11:06:28,749 - Downloading dbCAN family activities from : https://bcb.unl.edu/dbCAN2/download/Databases/V11/CAZyDB.08062022.fam-activities.txt
    2023-05-26 11:06:29,737 - Downloading dbcan_subfam_ec
    2023-05-26 11:06:29,737 - Downloading dbCAN sub-family encumber from : https://bcb.unl.edu/dbCAN2/download/Databases/V11/CAZyDB.08062022.fam.subfam.ec.txt
    2023-05-26 11:06:30,905 - Downloading vogdb
    2023-05-26 11:06:39,572 - Downloading vog_annotations
    2023-05-26 11:06:40,044 - Downloading viral
    2023-05-26 11:06:43,640 - Downloading peptidase
    2023-05-26 11:06:45,440 - Downloading genome_summary_form
    2023-05-26 11:06:45,739 - Downloading module_step_form
    2023-05-26 11:06:46,043 - Downloading function_heatmap_form
    2023-05-26 11:06:46,301 - Downloading amg_database
    2023-05-26 11:06:46,612 - Downloading etc_module_database
    2023-05-26 11:06:46,866 - All raw data files were downloaded successfully
    2023-05-26 11:06:46,867 - Processing kofam_hmm
    2023-05-26 11:15:03,083 - KOfam database processed
    2023-05-26 11:15:03,757 - Moved kofam_hmm to final destination, configuration updated
    2023-05-26 11:15:03,758 - Processing kofam_ko_list
    2023-05-26 11:15:03,886 - KOfam ko list processed
    2023-05-26 11:15:03,891 - Moved kofam_ko_list to final destination, configuration updated
    2023-05-26 11:15:03,891 - Processing uniref
    2023-05-27 00:07:31,653 - UniRef database processed
    2023-05-27 00:07:32,908 - Moved uniref to final destination, configuration updated
    2023-05-27 00:07:32,909 - Processing pfam
    2023-05-27 01:14:18,620 - PFAM database processed
    2023-05-27 01:14:19,226 - Moved pfam to final destination, configuration updated
    2023-05-27 01:14:19,298 - Moved pfam_hmm to final destination, configuration updated
    2023-05-27 01:14:19,299 - Processing dbcan
    2023-05-27 01:14:23,328 - dbCAN database processed
    2023-05-27 01:14:23,344 - Moved dbcan to final destination, configuration updated
    2023-05-27 01:14:23,359 - Moved dbcan_fam_activities to final destination, configuration updated
    2023-05-27 01:14:23,363 - Moved dbcan_subfam_ec to final destination, configuration updated
    2023-05-27 01:14:23,364 - Processing vogdb
    2023-05-27 01:19:32,339 - VOGdb database processed
    2023-05-27 01:19:32,408 - Moved vogdb to final destination, configuration updated
    2023-05-27 01:19:32,412 - Moved vog_annotations to final destination, configuration updated
    2023-05-27 01:19:32,412 - Processing viral
    2023-05-27 01:19:54,939 - RefSeq viral database processed
    2023-05-27 01:19:54,946 - Moved viral to final destination, configuration updated
    2023-05-27 01:19:54,946 - Processing peptidase
    2023-05-27 01:20:28,747 - MEROPS database processed
    2023-05-27 01:20:28,753 - Moved peptidase to final destination, configuration updated
    2023-05-27 01:20:28,756 - Moved genome_summary_form to final destination, configuration updated
    2023-05-27 01:20:28,781 - Moved module_step_form to final destination, configuration updated
    2023-05-27 01:20:28,785 - Moved function_heatmap_form to final destination, configuration updated
    2023-05-27 01:20:28,838 - Moved amg_database to final destination, configuration updated
    2023-05-27 01:20:28,842 - Moved etc_module_database to final destination, configuration updated
    2023-05-27 01:20:28,842 - Populating the description db, this may take some time
    Killed

Now to build on s229.

Ran this on 2023-05-24, retried on 2023-05-30 hence reversioning this.  The contents of `$PREFIX/database_processing.log` :

    2023-05-30 19:42:40,686 - Starting the process of downloading data
    2023-05-30 19:42:41,240 - The kegg_loc argument was not used to specify a downloaded kegg file, and dram can not download it its self. So it is assumed that the user wants to set up DRAM without it
    2023-05-30 19:42:41,240 - The gene_ko_link_loc argument was not used to specify a downloaded gene_ko_link file, and dram can not download it its self. So it is assumed that the user wants to set up DRAM without it
    2023-05-30 19:42:41,240 - Database preparation started
    2023-05-30 19:42:41,241 - Copying /sw/data/Pfam/35.0/src/Pfam-A.hmm.dat.gz to output_dir
    2023-05-30 19:42:41,285 - Downloading dbcan_fam_activities
    2023-05-30 19:42:41,285 - Downloading dbCAN family activities from : https://bcb.unl.edu/dbCAN2/download/Databases/V11/CAZyDB.08062022.fam-activities.txt
    2023-05-30 19:42:42,189 - Downloading dbcan_subfam_ec
    2023-05-30 19:42:42,189 - Downloading dbCAN sub-family encumber from : https://bcb.unl.edu/dbCAN2/download/Databases/V11/CAZyDB.08062022.fam.subfam.ec.txt
    2023-05-30 19:42:43,387 - Downloading vogdb
    2023-05-30 19:42:54,581 - Downloading vog_annotations
    2023-05-30 19:42:55,069 - Downloading viral
    2023-05-30 19:43:05,029 - Downloading peptidase
    2023-05-30 19:43:14,295 - Downloading genome_summary_form
    2023-05-30 19:43:14,734 - Downloading module_step_form
    2023-05-30 19:43:15,116 - Downloading function_heatmap_form
    2023-05-30 19:43:15,550 - Downloading amg_database
    2023-05-30 19:43:15,760 - Downloading etc_module_database
    2023-05-30 19:43:16,046 - All raw data files were downloaded successfully
    2023-05-30 19:43:16,047 - Processing kofam_hmm
    2023-05-30 19:51:33,891 - KOfam database processed
    2023-05-30 19:51:34,274 - Moved kofam_hmm to final destination, configuration updated
    2023-05-30 19:51:34,275 - Processing kofam_ko_list
    2023-05-30 19:51:34,409 - KOfam ko list processed
    2023-05-30 19:51:34,420 - Moved kofam_ko_list to final destination, configuration updated
    2023-05-30 19:51:34,420 - Processing uniref
    2023-05-30 21:50:31,980 - UniRef database processed
    2023-05-30 21:50:33,005 - Moved uniref to final destination, configuration updated
    2023-05-30 21:50:33,005 - Processing pfam
    2023-05-30 22:46:59,658 - PFAM database processed
    2023-05-30 22:47:00,308 - Moved pfam to final destination, configuration updated
    2023-05-30 22:47:00,392 - Moved pfam_hmm to final destination, configuration updated
    2023-05-30 22:47:00,392 - Processing dbcan
    2023-05-30 22:47:05,023 - dbCAN database processed
    2023-05-30 22:47:05,038 - Moved dbcan to final destination, configuration updated
    2023-05-30 22:47:05,070 - Moved dbcan_fam_activities to final destination, configuration updated
    2023-05-30 22:47:05,231 - Moved dbcan_subfam_ec to final destination, configuration updated
    2023-05-30 22:47:05,231 - Processing vogdb
    2023-05-30 22:57:40,062 - VOGdb database processed
    2023-05-30 22:57:40,243 - Moved vogdb to final destination, configuration updated
    2023-05-30 22:57:40,253 - Moved vog_annotations to final destination, configuration updated
    2023-05-30 22:57:40,254 - Processing viral
    2023-05-30 22:58:05,091 - RefSeq viral database processed
    2023-05-30 22:58:05,109 - Moved viral to final destination, configuration updated
    2023-05-30 22:58:05,109 - Processing peptidase
    2023-05-30 22:58:41,046 - MEROPS database processed
    2023-05-30 22:58:41,064 - Moved peptidase to final destination, configuration updated
    2023-05-30 22:58:41,084 - Moved genome_summary_form to final destination, configuration updated
    2023-05-30 22:58:41,111 - Moved module_step_form to final destination, configuration updated
    2023-05-30 22:58:41,134 - Moved function_heatmap_form to final destination, configuration updated
    2023-05-30 22:58:41,144 - Moved amg_database to final destination, configuration updated
    2023-05-30 22:58:41,157 - Moved etc_module_database to final destination, configuration updated
    2023-05-30 22:58:41,157 - Populating the description db, this may take some time
    2023-06-01 01:08:55,771 - Description updated for the uniref database
    2023-06-01 01:09:31,989 - Description updated for the viral database
    2023-06-01 01:10:28,547 - Description updated for the peptidase database
    2023-06-01 01:10:29,732 - Description updated for the pfam database
    2023-06-01 01:10:33,645 - Description updated for the dbcan database
    2023-06-01 01:10:39,078 - Description updated for the vogdb database
    2023-06-01 01:10:39,131 - DRAM description database populated
    2023-06-01 01:10:39,132 - Database preparation completed

So, successful completion!

Save the config, and clean it up: it does realpath so includes 'crex', so undo that and move that back to sw.

    cd $VERSIONDIR # aka cd /sw/data/DRAM_data/20230530/
    DRAM-setup.py export_config > ${VERSION}_config.txt
    sed -i 's/crex/sw/g' ${VERSION}orig_config.txt

Now to install the software.


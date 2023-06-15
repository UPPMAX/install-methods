PhyloPhlAn/3.0.2
================

<https://github.com/biobakery/phylophlan/wiki>

Used under license:
MIT license

Structure creating script (makeroom_PhyloPhlAn_3.0.2.sh) moved to /sw/bioinfo/PhyloPhlAn/makeroom_3.0.2.sh

LOG
---

    makeroom.sh -t "PhyloPhlAn" -v "3.0.2" -w "https://github.com/biobakery/phylophlan/wiki" -c "bioinfo" -l "MIT license" -d "is an integrated pipeline for large-scale phylogenetic profiling of genomes and metagenomes." -s "phylogeny" -x "INSTALL" -f
    ./makeroom_PhyloPhlAn_3.0.2.sh

This was already largely installed, but a few things needed to be finished.

   - Load additional modules
      - diamond/2.1.6
      - usearch/11.0.667
      - FastTree/2.1.10
      - iqtree/2.2.2.2-omp-mpi
      - muscle/5.1
   - Build default databases
   - Make them easily discoverable

We modify `$PREFIX/lib/python3.8/site-packages/phylophlan/phylophlan.py` to
look for the `PHYLOPHLAN_DATA_ROOT` environment variable and use that as the
default data location.

    # Check UPPMAX environment variables, use UPPMAX-local data folder
    try:
        UPPMAX_PhyloPhlAn = os.environ['PHYLOPHLAN_ROOT'] + '/'
        except KeyError:
            UPPMAX_PhyloPhlAn = ''
    #print(f"UPPMAX_PhyloPhlAn={UPPMAX_PhyloPhlAn}")
    try:
        UPPMAX_PhyloPhlAn_data = os.environ['PHYLOPHLAN_DATA_ROOT'] + '/'
        except KeyError:
            UPPMAX_PhyloPhlAn_data = ''
    #print(f"UPPMAX_PhyloPhlAn_data={UPPMAX_PhyloPhlAn_data}")

    #DATABASES_FOLDER = 'phylophlan_databases/'
    DATABASES_FOLDER = UPPMAX_PhyloPhlAn_data

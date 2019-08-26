#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condaDL_$DATE.log
##module load mc3/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/conda update conda -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/conda update conda-build -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "SYNCHING REPOS" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_scilifelab-lts.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_scilifelab-lts.yaml /sw/apps/mc3/latest/rackham/condamirror/scilifelab-lts/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml /sw/apps/mc3/latest/rackham/condamirror/main/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml /sw/apps/mc3/latest/rackham/condamirror/main/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml /sw/apps/mc3/latest/rackham/condamirror/bioconda/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml /sw/apps/mc3/latest/rackham/condamirror/conda-forge/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml /sw/apps/mc3/latest/rackham/condamirror/free/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml /sw/apps/mc3/latest/rackham/condamirror/r/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_pro.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_pro.yaml /sw/apps/mc3/latest/rackham/condamirror/pro/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml /sw/apps/mc3/latest/rackham/condamirror/bioconda/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml /sw/apps/mc3/latest/rackham/condamirror/conda-forge/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml /sw/apps/mc3/latest/rackham/condamirror/free/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_qiime2.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_qiime2.yaml /sw/apps/mc3/latest/rackham/condamirror/qiime2/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_biocore.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_biocore.yaml /sw/apps/mc3/latest/rackham/condamirror/biocore/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r2018.11.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r2018.11.yaml /sw/apps/mc3/latest/rackham/condamirror/r2018.11/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml /sw/apps/mc3/latest/rackham/condamirror/r/delta_pkgs
/sw/apps/conda/latest/rackham/bin/cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_dranew.yaml
/sw/apps/conda/latest/rackham/bin/cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_dranew.yaml /sw/apps/mc3/latest/rackham/condamirror/dranew/delta_pkgs
/sw/apps/conda/latest/rackham/bin/conda clean -ilpt
##module unload mc3
echo "FINISHED" >> $LOGFILE

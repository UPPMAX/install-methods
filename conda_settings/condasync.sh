#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condaDL_$DATE.log
module load mc3/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
conda update conda -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
conda update conda-build -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "SYNCHING REPOS" >> $LOGFILE
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_scilifelab-lts.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_scilifelab-lts.yaml /sw/apps/mc3/latest/rackham/condamirror/scilifelab-lts/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml /sw/apps/mc3/latest/rackham/condamirror/main/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_main.yaml /sw/apps/mc3/latest/rackham/condamirror/main/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml /sw/apps/mc3/latest/rackham/condamirror/bioconda/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml /sw/apps/mc3/latest/rackham/condamirror/conda-forge/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml /sw/apps/mc3/latest/rackham/condamirror/free/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml /sw/apps/mc3/latest/rackham/condamirror/r/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_pro.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_pro.yaml /sw/apps/mc3/latest/rackham/condamirror/pro/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_bioconda.yaml /sw/apps/mc3/latest/rackham/condamirror/bioconda/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_conda-forge.yaml /sw/apps/mc3/latest/rackham/condamirror/conda-forge/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_free.yaml /sw/apps/mc3/latest/rackham/condamirror/free/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_qiime2.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_qiime2.yaml /sw/apps/mc3/latest/rackham/condamirror/qiime2/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_biocore.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_biocore.yaml /sw/apps/mc3/latest/rackham/condamirror/biocore/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r2018.11.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r2018.11.yaml /sw/apps/mc3/latest/rackham/condamirror/r2018.11/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_r.yaml /sw/apps/mc3/latest/rackham/condamirror/r/delta_pkgs
cas-sync -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_dranew.yaml
cas-merge -f /home/jonass/uppmax/install-methods/conda_settings/condamirror_dranew.yaml /sw/apps/mc3/latest/rackham/condamirror/dranew/delta_pkgs
conda clean -ilpt
module unload mc3
echo "FINISHED" >> $LOGFILE

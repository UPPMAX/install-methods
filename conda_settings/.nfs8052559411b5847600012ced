#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condamirror_$DATE.log
export CONDA_NUMBER_CHANNEL_NOTICES=0
echo "export CONDA_NUMBER_CHANNEL_NOTICES=0" >> $LOGFILE
module load conda/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
conda update conda -y -vv 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
conda update conda-build -y -v 2>&1 | tee -a $LOGFILE
echo "UPDATING MAMBA" >> $LOGFILE
conda update mamba -y -v 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-PACK" >> $LOGFILE
conda update conda-pack -y -v 2>&1 | tee -a $LOGFILE
echo "UPDATE libarchive FOR MAMBA" >> $LOGFILE
conda update libarchive -y -v
echo "SYNCHING REPOS" >> $LOGFILE
conda-mirror --upstream-channel conda-forge --target-directory /sw/apps/conda/latest/rackham/local_repo/conda-forge --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel scilifelab-lts --target-directory /sw/apps/conda/latest/rackham/local_repo/scilifelab-lts --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r --target-directory /sw/apps/conda/latest/rackham/local_repo/r --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel main --target-directory /sw/apps/conda/latest/rackham/local_repo/main --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel bioconda --target-directory /sw/apps/conda/latest/rackham/local_repo/bioconda --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel free --target-directory /sw/apps/conda/latest/rackham/local_repo/free --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pro --target-directory /sw/apps/conda/latest/rackham/local_repo/pro --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel qiime2 --target-directory /sw/apps/conda/latest/rackham/local_repo/qiime2 --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel biocore --target-directory /sw/apps/conda/latest/rackham/local_repo/biocore --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel dranew --target-directory /sw/apps/conda/latest/rackham/local_repo/dranew --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r2018.11 --target-directory /sw/apps/conda/latest/rackham/local_repo/r2018.11 --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel conda-forge --target-directory /sw/apps/conda/latest/rackham/local_repo/conda-forge --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel scilifelab-lts --target-directory /sw/apps/conda/latest/rackham/local_repo/scilifelab-lts --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r --target-directory /sw/apps/conda/latest/rackham/local_repo/r --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel main --target-directory /sw/apps/conda/latest/rackham/local_repo/main --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel bioconda --target-directory /sw/apps/conda/latest/rackham/local_repo/bioconda --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel free --target-directory /sw/apps/conda/latest/rackham/local_repo/free --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pro --target-directory /sw/apps/conda/latest/rackham/local_repo/pro --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel qiime2 --target-directory /sw/apps/conda/latest/rackham/local_repo/qiime2 --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel biocore --target-directory /sw/apps/conda/latest/rackham/local_repo/biocore --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel dranew --target-directory /sw/apps/conda/latest/rackham/local_repo/dranew --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r2018.11 --target-directory /sw/apps/conda/latest/rackham/local_repo/r2018.11 --platform noarch -v 2>&1 | tee -a $LOGFILE
echo "INDEXING CONDA" >> $LOGFILE
cd /sw/apps/conda/latest/rackham/local_repo
conda-index --channel-name CONDA_UPPMAX --verbose */ 2>&1 | tee -a $LOGFILE
conda clean -a -y

module unload conda
echo "FINISHED" >> $LOGFILE

#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condamirror_$DATE.log
module load conda/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
conda update conda -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
conda update conda-build -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "SYNCHING REPOS" >> $LOGFILE
conda-mirror --upstream-channel conda-forge --target-directory /sw/apps/conda/latest/rackham/local_repo/conda-forge --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel scilifelab-lts --target-directory /sw/apps/conda/latest/rackham/local_repo/scilifelab-lts --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r --target-directory /sw/apps/conda/latest/rackham/local_repo/r --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel main --target-directory /sw/apps/conda/latest/rackham/local_repo/main --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel bioconda --target-directory /sw/apps/conda/latest/rackham/local_repo/bioconda --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel free --target-directory /sw/apps/conda/latest/rackham/local_repo/free --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pro --target-directory /sw/apps/conda/latest/rackham/local_repo/pro --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel qiime2 --target-directory /sw/apps/conda/latest/rackham/local_repo/qiime2 --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel biocore --target-directory /sw/apps/conda/latest/rackham/local_repo/biocore --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel dranew --target-directory /sw/apps/conda/latest/rackham/local_repo/dranew --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r2018.11 --target-directory /sw/apps/conda/latest/rackham/local_repo/r2018.11 --platform linux-64 -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel conda-forge --target-directory /sw/apps/conda/latest/rackham/local_repo/conda-forge --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel scilifelab-lts --target-directory /sw/apps/conda/latest/rackham/local_repo/scilifelab-lts --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r --target-directory /sw/apps/conda/latest/rackham/local_repo/r --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel main --target-directory /sw/apps/conda/latest/rackham/local_repo/main --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel bioconda --target-directory /sw/apps/conda/latest/rackham/local_repo/bioconda --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel free --target-directory /sw/apps/conda/latest/rackham/local_repo/free --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pro --target-directory /sw/apps/conda/latest/rackham/local_repo/pro --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel qiime2 --target-directory /sw/apps/conda/latest/rackham/local_repo/qiime2 --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel biocore --target-directory /sw/apps/conda/latest/rackham/local_repo/biocore --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel dranew --target-directory /sw/apps/conda/latest/rackham/local_repo/dranew --platform noarch -vvv 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel r2018.11 --target-directory /sw/apps/conda/latest/rackham/local_repo/r2018.11 --platform noarch -vvv 2>&1 | tee -a $LOGFILE
echo "INDEXING CONDA" >> $LOGFILE
cd /sw/apps/conda/latest/rackham/local_repo
conda-index --channel-name CONDA_UPPMAX --verbose */ 2>&1 | tee -a $LOGFILE
conda clean -ilpt -y

module unload conda
echo "FINISHED" >> $LOGFILE

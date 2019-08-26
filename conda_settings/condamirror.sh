#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condaDL_$DATE.log
##module load mc3/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/conda update conda -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/conda update conda-build -y -c defaults --override-channels -vvv 2>&1 | tee -a $LOGFILE
echo "SYNCHING REPOS" >> $LOGFILE
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel conda-forge --target-directory /sw/apps/conda/latest/rackham/local_repo/conda-forge --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel scilifelab-lts --target-directory /sw/apps/conda/latest/rackham/local_repo/scilifelab-lts --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel r --target-directory /sw/apps/conda/latest/rackham/local_repo/r --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel main --target-directory /sw/apps/conda/latest/rackham/local_repo/main --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel bioconda --target-directory /sw/apps/conda/latest/rackham/local_repo/bioconda --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel free --target-directory /sw/apps/conda/latest/rackham/local_repo/free --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel pro --target-directory /sw/apps/conda/latest/rackham/local_repo/pro --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel qiime2 --target-directory /sw/apps/conda/latest/rackham/local_repo/qiime2 --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel biocore --target-directory /sw/apps/conda/latest/rackham/local_repo/biocore --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel dranew --target-directory /sw/apps/conda/latest/rackham/local_repo/dranew --platform linux-64
/sw/apps/conda/latest/rackham/bin/conda-mirror --upstream-channel r2018.11 --target-directory /sw/apps/conda/latest/rackham/local_repo/r2018.11 --platform linux-64

##module unload mc3
echo "FINISHED" >> $LOGFILE

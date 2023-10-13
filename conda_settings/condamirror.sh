#!/usr/bin/bash -l
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condamirror_$DATE.log
export CONDA_NUMBER_CHANNEL_NOTICES=0
echo "export CONDA_NUMBER_CHANNEL_NOTICES=0" >> $LOGFILE
module load uppmax 2>>$LOGFILE
module load conda/latest 2>>$LOGFILE
#echo "UPDATING CONDA" >> $LOGFILE
#mamba update conda -y -vv 2>&1 | tee -a $LOGFILE
#echo "UPDATING CONDA-BUILD" >> $LOGFILE
#mamba update conda-build -y -v 2>&1 | tee -a $LOGFILE
#echo "UPDATING MAMBA" >> $LOGFILE
#mamba update mamba -y -v 2>&1 | tee -a $LOGFILE
#echo "UPDATING CONDA-PACK" >> $LOGFILE
#mamba update conda-pack -y -v 2>&1 | tee -a $LOGFILE
#echo "UPDATE libarchive FOR MAMBA" >> $LOGFILE
#mamba update libarchive -y -v
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
conda-mirror --upstream-channel nvidia --target-directory /sw/apps/conda/latest/rackham/local_repo/nvidia --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pytorch --target-directory /sw/apps/conda/latest/rackham/local_repo/pytorch --platform linux-64 -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel anaconda --target-directory /sw/apps/conda/latest/rackham/local_repo/anaconda --platform linux-64 -v 2>&1 | tee -a $LOGFILE
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
conda-mirror --upstream-channel nvidia --target-directory /sw/apps/conda/latest/rackham/local_repo/nvidia --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel pytorch --target-directory /sw/apps/conda/latest/rackham/local_repo/pytorch --platform noarch -v 2>&1 | tee -a $LOGFILE
conda-mirror --upstream-channel anaconda --target-directory /sw/apps/conda/latest/rackham/local_repo/anaconda --platform noarch -v 2>&1 | tee -a $LOGFILE
#conda-mirror --upstream-channel imperial-college-research-computing --target-directory /sw/apps/conda/latest/rackham/local_repo/imperial-college-research-computing --platform noarch -v 2>&1 | tee -a $LOGFILE
#conda-mirror --upstream-channel etetoolkit --target-directory /sw/apps/conda/latest/rackham/local_repo/etetoolkit --platform noarch -v 2>&1 | tee -a $LOGFILE
echo "INDEXING CONDA" >> $LOGFILE
cd /sw/apps/conda/latest/rackham/local_repo
module load sqlite/3.34.0
for i in $(find . -type d -maxdepth 1) do; conda index --channel-name CONDA_UPPMAX --verbose $i 2>&1 | tee -a $LOGFILE; done
conda clean -a -c -y
module unload conda
find /scratch/ -user jonass -exec rm -fr {} \;
echo "FINISHED" >> $LOGFILE

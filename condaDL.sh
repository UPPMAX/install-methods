#!/usr/bin/bash -l
chmod 2775 /sw/apps/mc3/latest/rackham/repo
chmod 2775 /sw/apps/mc3/latest/rackham/repo/noarch
cd /sw/apps/mc3/latest/rackham/repo/noarch
DATE=`date '+%Y-%m-%d_%H.%M.%S'`
LOGFILE=/home/jonass/conda_logs/condaDL_$DATE.log
echo "https://conda.anaconda.org/scilifelab-lts/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/scilifelab-lts/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://repo.anaconda.com/pkgs/main/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.anaconda.com/pkgs/main/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://repo.continuum.io/pkgs/main/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.continuum.io/pkgs/main/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/bioconda/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/bioconda/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/conda-forge/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/conda-forge/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://repo.continuum.io/pkgs/free/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.continuum.io/pkgs/free/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://repo.continuum.io/pkgs/r/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.continuum.io/pkgs/r/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://repo.continuum.io/pkgs/pro/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.continuum.io/pkgs/pro/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/bioconda/noarch/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/bioconda/noarch/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/conda-forge/noarch/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/conda-forge/noarch/ 2>&1 | tee -a $LOGFILE
echo "https://repo.continuum.io/pkgs/free/noarch/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://repo.continuum.io/pkgs/free/noarch/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/qiime2/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/qiime2/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/biocore/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/biocore/linux-64/ 2>&1 | tee -a $LOGFILE
echo "https://conda.anaconda.org/qiime2/label/r2018.11/linux-64/" >> $LOGFILE
wget -N -c -r -np -nH --cut-dirs=4 -R "index.html*" -R "repodata.json*" -R "tensorflow-base-1.9.0-gpu_py27h9f529ab_*" https://conda.anaconda.org/qiime2/label/r2018.11/linux-64/ 2>&1 | tee -a $LOGFILE
cp -av repodata.json /sw/apps/mc3/latest/rackham/backups/repodata.json.bak
cp -av .index.json /sw/apps/mc3/latest/rackham/backups/.index.json.bak
module load mc3/latest 2>>$LOGFILE
echo "UPDATING CONDA" >> $LOGFILE
conda update conda -y -c defaults --override-channels 2>&1 | tee -a $LOGFILE
echo "UPDATING CONDA-BUILD" >> $LOGFILE
conda update conda-build -y -c defaults --override-channels 2>&1 | tee -a $LOGFILE
echo "INDEXING CONDA" >> $LOGFILE
cd /sw/apps/mc3/latest/rackham/repo
conda-index --channel-name CONDA_UPPMAX 2>&1 | tee -a $LOGFILE
chmod -w /sw/apps/mc3/latest/rackham/repo
chmod -w /sw/apps/mc3/latest/rackham/repo/noarch
echo "FINISHED" >> $LOGFILE

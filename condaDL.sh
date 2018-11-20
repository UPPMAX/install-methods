chmod u+w /sw/apps/mc3/latest/rackham/repo/noarch
cd /sw/apps/mc3/latest/rackham/repo/noarch
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/scilifelab-lts/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.anaconda.com/pkgs/main/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/main/linux-64/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/bioconda/linux-64/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/conda-forge/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/free/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/r/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/pro/linux-64/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/main/noarch/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/bioconda/noarch/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/conda-forge/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/free/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/r/noarch/
wget -N -c -r -np -nH --cut-dirs=3 -R "index.html*" -R "repodata.json*" https://repo.continuum.io/pkgs/pro/noarch/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/qiime2/noarch/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/qiime2/linux-64/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/biocore/noarch/
wget -N -c -r -np -nH --cut-dirs=2 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/biocore/linux-64/
wget -N -c -r -np -nH --cut-dirs=4 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/qiime2/label/r2018.11/noarch/
wget -N -c -r -np -nH --cut-dirs=4 -R "index.html*" -R "repodata.json*" https://conda.anaconda.org/qiime2/label/r2018.11/linux-64/
cp -av repodata.json ../repodata.json.bak
cp -av .index.json ../.index.json.bak
chmod -w /sw/apps/mc3/latest/rackham/repo/noarch
module load mc3/latest
conda update conda -y
conda-index --channel-name CONDA_UPPMAX

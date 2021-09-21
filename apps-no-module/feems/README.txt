# in relation to https://support.snic.se/Ticket/Display.html?id=237222 

# Installation instructions on Rackham
module load git git/2.28.0         
export CONDA_ENVS_PATH=/proj/testappl/pmitev/CONDA_ENVS
module load conda                  
source conda_init.sh               
git clone https://github.com/NovembreLab/feems
cd feems/                          
conda env create -f environment.yml

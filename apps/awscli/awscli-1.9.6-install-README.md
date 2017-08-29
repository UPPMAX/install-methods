awscli/1.9.6
============

On milou:

    module load python/2.7.9
    mkdir -p /sw/apps/awscli/1.9.6/milou/
    cd /sw/apps/awscli/1.9.6/milou/
    PYTHONUSERBASE=/sw/apps/awscli/1.9.6/milou pip install -I --user awscli

On tintin, there is no python/2.7.9:

    module load python/2.7.6
    mkdir -p /sw/apps/awscli/1.9.6/tintin/
    cd /sw/apps/awscli/1.9.6/tintin/
    PYTHONUSERBASE=/sw/apps/awscli/1.9.6/tintin pip install -I --user awscli

The --user setup process replaces the hash-bang lines with direct links to the
python active during installation.  This might be quite nice...  I am
experimenting with not loading python.


hyperqueue/0.18.0
========================

<https://github.com/It4innovations/hyperqueue>

Used under license:
MIT license


Structure creating script (makeroom_hyperqueue_0.18.0.sh) moved to /sw/apps/hyperqueue/makeroom_0.18.0.sh

LOG
---

cd /sw/apps/
/proj/staff/diana/UPPMAX-Tools/install-methods/makeroom.sh makeroom.sh -t "hyperqueue" -v "0.18.0" -w "https://github.com/It4innovations/hyperqueue" -c "apps" -l "MIT license" -d "HyperQueue is a tool designed to simplify execution of large workflows (task graphs) on HPC clusters." -x "INSTALL" -u "rackham"

./makeroom_hyperqueue_0.18.0.sh

source /sw/apps/hyperqueue/SOURCEME_hyperqueue_0.18.0
cd $SRCDIR

wget https://github.com/It4innovations/hyperqueue/releases/download/v0.18.0/hq-v0.18.0-linux-x64.tar.gz
tar -xvzf hq-v0.18.0-linux-x64.tar.gz

mv hq ../rackham

cd ..
ln -s rackham snowy
ln -s rackham bianca

cd $TOOLDIR
vi mf/0.18.0

cp -av /sw/apps/hyperqueue/mf/0.18.0 /sw/mf/common/applications/hyperqueue/0.18.0
mkdir /sw/mf/snowy/applications/hyperqueue
mkdir /sw/mf/bianca/applications/hyperqueue
all_mflink -f -u rackham -a hyperqueue 0.18.0
all_mflink -f -u snowy -a hyperqueue 0.18.0
all_mflink -f -u bianca -a hyperqueue 0.18.0



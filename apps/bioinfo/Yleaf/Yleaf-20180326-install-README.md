Yleaf/20180326
==============

<https://www.erasmusmc.nl/genetic_identification/resources/Yleaf/>

We will unpack to $CLUSTER and install there.

Should be self-contained.

LOG
---

    VERSION=20180326
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir Yleaf
    cd Yleaf/
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f y_leaf.zip ]] || wget http://cluster15.erasmusmc.nl/fmb/Yleaf/y_leaf.zip
    unzip y_leaf.zip 
    mv y_leaf ../$CLUSTER
    cd y_leaf/
    chmod +x Yleaf.py 
    module load python/2.7.11
    module load R_packages/3.5.0
    module load bioinfo-tools
    module load bwa/0.7.17
    module load samtools/1.6
    python install.py  --prefix=$PWD/bin

Also made a number of modifications to Yleaf.py to keep it from attempting to
write to `app_folder` for temp files, and to use the current directory or the
working directory for temp files, output, etc.

Add $modroot/bin to PATH.

    diff 20180326/src/y_leaf/Yleaf.py 20180326/rackham/Yleaf.py >> Yleaf-20180326-install-README.md

produces:

    63a64,65
    >         if not os.path.exists('tmp'):
    >             os.makedirs('tmp')
    146,147c148,150
    <         if os.path.exists('tmp'):
    <             cmd = 'rm -r tmp'
    ---
    >         tmp_dir = os.path.join(folder, 'tmp')    # UPPMAX
    >         if os.path.exists(tmp_dir):    # UPPMAX
    >             cmd = 'rm -r '+tmp_dir    # UPPMAX
    149c152
    <             cmd = 'mkdir tmp'
    ---
    >             cmd = 'mkdir '+tmp_dir    # UPPMAX
    152c155
    <             cmd = 'mkdir tmp'
    ---
    >             cmd = 'mkdir '+tmp_dir    # UPPMAX
    153a157,164
    >         #if os.path.exists('tmp'):
    >         #    cmd = 'rm -r tmp'
    >         #    subprocess.call(cmd, shell=True)
    >         #    cmd = 'mkdir tmp'
    >         #    subprocess.call(cmd, shell=True)                
    >         #else:
    >         #    cmd = 'mkdir tmp'
    >         #    subprocess.call(cmd, shell=True)        
    159c170,171
    <     args.Markerfile =  'data/positions.txt'
    ---
    >     #args.Markerfile =  'data/positions.txt'    # UPPMAX
    >     args.Markerfile =  os.path.join(app_folder, 'data/positions.txt')    # UPPMAX
    164,167c176,183
    <     rscriptn     = '{}/tmp/main.r'.format(app_folder)
    <     rscriptchr   = '{}/tmp/chrtable.r'.format(app_folder)    
    <     pileupfile   = '{}/tmp/out.pu'.format(app_folder)
    <     chr_y_bam    = '{}/tmp/chrY.bam'.format(app_folder)
    ---
    >     #rscriptn     = '{}/tmp/main.r'.format(app_folder)      # UPPMAX
    >     #rscriptchr   = '{}/tmp/chrtable.r'.format(app_folder)  # UPPMAX
    >     #pileupfile   = '{}/tmp/out.pu'.format(app_folder)      # UPPMAX
    >     #chr_y_bam    = '{}/tmp/chrY.bam'.format(app_folder)    # UPPMAX
    >     rscriptn      = '{}/tmp/main.r'.format(folder)      # UPPMAX
    >     rscriptchr    = '{}/tmp/chrtable.r'.format(folder)  # UPPMAX
    >     pileupfile    = '{}/tmp/out.pu'.format(folder)      # UPPMAX
    >     chr_y_bam     = '{}/tmp/chrY.bam'.format(folder)    # UPPMAX
    227a244
    >     cwd_folder  = os.getcwd()  # UPPMAX
    235c252,253
    <                 folder = os.path.join(app_folder,folder_name)        
    ---
    >                 #folder = os.path.join(app_folder,folder_name)        # UPPMAX
    >                 folder = os.path.join(cwd_folder,folder_name)        # UPPMAX
    261c279,280
    <                 folder = os.path.join(app_folder,folder_name)        
    ---
    >                 #folder = os.path.join(app_folder,folder_name)        # UPPMAX
    >                 folder = os.path.join(cwd_folder,folder_name)        # UPPMAX

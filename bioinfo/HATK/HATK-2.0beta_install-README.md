HATK/2.0beta
========================

<https://github.com/WansonChoi/HATK>

Used under license:
AS IS
<https://github.com/WansonChoi/HATK#6-license>

Structure creating script (makeroom_HATK_2.0beta.sh) moved to /sw/bioinfo/HATK/makeroom_2.0beta.sh

LOG

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "HATK" "-v" "2.0beta" "-w" "https://github.com/WansonChoi/HATK" "-c" "bioinfo" "-l" "AS IS" "-L" "https://github.com/WansonChoi/HATK#6-license" "-d" "HLA Analysis Tool-Kit) is a collection of tools and modules to perform HLA fine-mapping analysis, which is to identify which HLA allele or amino acid position of the HLA gene is driving the disease. HLA fine-mapping analysis is an indispensable analysis in studies of autoimmune diseases." "-s" "annotation"
    ./makeroom_HATK_2.0beta.sh
    source /sw/bioinfo/HATK/SOURCEME_HATK_2.0beta && cd $PREFIX
    ml git
    git clone https://github.com/WansonChoi/HATK.git
    cd HATK
   " The yml files relies on no R installation and on using conda. We will use modules and virtualenv so we add a requirements file (perhaps not needed since, numpy, pandas and scipy is already there, but now we may get newer versions)."
    vi requirements.txt
    # add numpy, pandas, scipy
    ml python/3.7.2
    virtualenv venv
    . venv/bin/activate
    which pip
    pip install -r requirements.txt   
    chmod +x HATK.py
    add '#!/sw/bioinfo/HATK/2.0beta/rackham/HATK/venv/bin/python' in HATK.py script
# change hard-coded paths

   ...


# make tests
   # run in interactive session, takes a while: interactive -A staff -n 8 -t 2:0:0
    load the HATK module
    mkdir $HATK_ROOT/v2_wholeImple
   # step somewhere else
    HATK.py    --hg 18    --hped $HATK_ROOT/example/wtccc_filtered_58C_RA.hatk.300+300.hped2    --bfile $HATK_ROOT/example/wtccc_filtered_58C_RA.hatk.300+300.hg18.chr6.29-34mb    --pheno $HATK_ROOT/example/wtccc_filtered_58C_RA.hatk.300+300.phe    --pheno-name RA    --imgt 3320    --imgt-dir $HATK_ROOT/example/IMGTHLA3320/    --multiprocess 8    --out $HATK_ROOT/HATKv2_wholeImple/wtccc_58C+RA.hg18.chr6.29-34mb.ALL    --java-mem 4g    --nthreads 4 

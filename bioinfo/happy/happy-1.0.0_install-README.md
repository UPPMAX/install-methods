happy/1.0.0
========================

<https://github.com/Nellaker-group/happy>

Used under license:
MIT


Structure creating script (makeroom_happy_1.0.0.sh) moved to /sw/bioinfo/happy/makeroom_1.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "happy" "-v" "1.0.0" "-l" "MIT" "-d" "A deep learning pipeline for mapping cell-to-tissue graphs across placenta histology whole slide images." "-w" "https://github.com/Nellaker-group/happy" "-s" "pipelines"
    
    export PYTHON_PREFIX=/sw/bioinfo/happy/1.0.0/rackham/python
    export PATH=$PYTHON_PREFIX/bin:$PATH
    export PYTHONPATH=$PYTHON_PREFIX/lib/python3.10/site-packages:$PYTHONPATH

    # load moules
    module load python/3.10.8
    module load libvips/8.15.2
    module load gcc/9.3.0
    module load java/OpenJDK_17+35
    module load glib/2.72.1
    module load openslide/4.0.0
    
    # download happy
    cd $PREFIX
    wget https://github.com/Nellaker-group/happy/archive/refs/tags/v${VERSION}.tar.gz
    tar xfvz v${VERSION}.tar.gz
    cd happy-1.0.0/

    # Pip install
    cd $PREFIX/${TOOL}-${VERSION}
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user torch==2.0.1+cu117 torchvision==0.15.2+cu117 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu117
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user torch_geometric==2.3.1	
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.0.0+cu117.html

    # Download pyg_lib that does not require a newer glibc
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user pyg_lib==0.3.1+pt20cu117 -f https://data.pyg.org/whl/torch-2.0.0+cu117.html
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user -r requirements.txt
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user pyvips==2.1.14

    # Downgrade numpy to 1.X
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user numpy==1.26.4
    PYTHONUSERBASE=$PYTHON_PREFIX pip install --user -e .
    

# Test
# Download datasets, annotation, slides, graph_splits, trained_models  and embeddings from their google drive into $PREFIX/happy-1.0.0/projects/placenta
# https://drive.google.com/drive/folders/1RvSQOxsWyUHf_SGV1Jzqa_Gc5QI4wQoy

    #export PYTHONPATH=$PREFIX/happy-1.0.0:$PREFIX/lib/python3.10/site-packages/
    # Nuclei Detection Training
    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/nuc_train.py \ 
        --project-name  placenta \ 
        --exp-name      demo-train \ 
        --annot-dir     annotations/nuclei \ 
        --dataset-names hmc \ 
        --dataset-names uot \ 
        --dataset-names empty \ 
        --decay-gamma   0.5 \ 
        --num-workers   16 \ 
        --epochs        1 \
        --init-from-inc \
        --frozen  

    # Cell Classification Training
    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/cell_train.py \ 
        --project-name      placenta \ 
        --organ-name        placenta \ 
        --exp-name          demo-train \ 
        --annot-dir         annotations/cell_class \ 
        --dataset-names     hmc \ 
        --dataset-names     uot \ 
        --dataset-names     nuh \ 
        --decay-gamma       0.5 \ 
        --num-workers       16 \ 
        --epochs            1 \
        --init-from-inc \ 
        --frozen  

    # Tissue Classification Training
    ln -s $PREFIX/happy-1.0.0/projects/placenta/embeddings $PREFIX/happy-1.0.0/projects/placenta/results/
    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/graph_train.py \ 
        --project-name      placenta \
        --organ-name        placenta \
        --run-ids           1 \ 
        --run-ids           2 \ 
        --annot-tsvs        wsi_1.tsv \ 
        --annot-tsvs        wsi_2.tsv \ 
        --exp-name          demo_train \ 
        --val-patch-files   val_patches.csv \ 
        --test-patch-files  test_patches.csv \ 
        --epochs 1

    # Demo WalkthroughoCWD=$(pwd) # save absolute current working directory
    sqlite3 happy/db/main.db "delete from slide where id>2;"
    cd $PREFIX/happy-1.0.0/projects/placenta/slides
    convert -resize 50% sample_wsi.tif sample_wsi_50.tif
    convert -resize 70% sample_wsi.tif sample_wsi_70.tif
    convert -resize 80% sample_wsi.tif sample_wsi_80.tif

# Hardcoded model 8472? Gets error without it.
    ln -s \
        /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/projects/placenta/trained_models/cell_model_accuracy_0.8472.pt \
        /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/projects/placenta/trained_models/cell_model_accuracy_0.8204.pt

    cd $PREFIX/happy-1.0.0/
    CWD=$(pwd) # save absolute current working directory
    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/happy/db/add_slides.py \ 
        --slides-dir        "$CWD/projects/placenta/slides/" \ 
        --lab-country       na \ 
        --primary-contact   na \ 
        --slide-file-format .tif \
        --pixel-size 0.2277 
    sqlite3 happy/db/main.db "select * from slide;"


    # Run the nuclei and cell inference pipeline on this sample:
    
    # Notice. The projects/placenta/slides/sample_wsi.tif contains too many nuclei that the next step gets an SQL error. 
    # I shrank the projects/placenta/slides/sample_wsi.tif and it worked fine.
    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/cell_inference.py \ 
        --project-name      placenta \ 
        --organ-name        placenta \ 
        --nuc-model-id      1 \ 
        --cell-model-id     2 \ 
        --slide-id          6 \ 
        --cell-batch-size   100 \
        --nuc-num-workers   10


    python /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/graph_inference.py \ 
        --project-name      placenta \
        --organ-name        placenta \
        --pre-trained-path  trained_models/graph_model.pt \
        --run-id 5 # Check sqlite3 /sw/bioinfo/happy/1.0.0/rackham/happy-1.0.0/happy/db/main.db "select * from evalrun;"








        



    # Prova sig fram
    # export PYTHONPATH=$PREFIX/happy-1.0.0:$PREFIX/lib/python3.10/site-packages/
    # modroot=/home/bjornv/proj/program/glibc-2.27/glibc-2.27/lib
    # export LD_LIBRARY_PATH=$modroot/lib:$LD_LIBRARY_PATH
    # export LD_RUN_PATH=$modroot/lib:$LD_RUN_PATH
    # export LIBRARY_PATH=$modroot/lib:LIBRARY_PATH
    # export PKG_CONFIG_PATH=$modroot/lib/pkgc:$PKG_CONFIG_PATH
    # export MANPATH=$modroot/share/ma:$MANPATH
    # export CPATH=$modroot/include:$CPATH
    # export CPLUS_INCLUDE_PATH=$modroot/include:$CPLUS_INCLUDE_PATH

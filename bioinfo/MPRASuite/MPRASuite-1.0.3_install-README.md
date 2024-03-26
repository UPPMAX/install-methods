MPRASuite/1.0.3
========================

<https://github.com/tewhey-lab/MPRA_oligo_barcode_pipeline>

Used under license:
MIT


Structure creating script (makeroom_MPRASuite_1.0.3.sh) moved to /sw/bioinfo/MPRASuite/makeroom_1.0.3.sh

LOG
---

    makeroom.sh "-t" "MPRASuite" "-v" "1.0.3" "-w" "https://github.com/tewhey-lab/MPRA_oligo_barcode_pipeline" "-c" "bioinfo" "-l" "MIT" "-d" "MPRA oligo/barcode reconstruction and barcode counting pipeline" -s pipelines -f    
    ./makeroom_MPRASuite_1.0.3.sh
    source /sw/bioinfo/MPRASuite/SOURCEME_MPRASuite_1.0.3 && cd $PREFIX
    git clone https://github.com/tewhey-lab/MPRA_oligo_barcode_pipeline.git
Make Cromwell wrapper    
    file: cromwell
    #!/bin/bash
    java -jar $CROMWELL_ROOT/cromwell.jar $@

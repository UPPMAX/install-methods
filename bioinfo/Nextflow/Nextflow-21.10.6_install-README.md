Nextflow/21.10.6
========================

<https://github.com/nextflow-io/nextflow>

Used under license:
Creative Commons Attribution-ShareAlike 4.0 International Public License
<https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>

Structure creating script (makeroom_Nextflow_21.10.6.sh) moved to /sw/bioinfo/Nextflow/makeroom_21.10.6.sh

LOG
---

   TOOL=Nextflow
   VERSION=21.10.6
   makeroom.sh -t $TOOL -v $VERSION -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f

   ./makeroom_Nextflow_21.10.6.sh

   source SOURCEME_Nextflow_21.10.6
   cd $SRCDIR; 

    wget https://github.com/nextflow-io/nextflow/releases/download/v21.10.6/nextflow-21.10.6-all

   chmod +x nextflow-21.10.6-all

   cp nextflow-21.10.6-all ../rackham/nextflow


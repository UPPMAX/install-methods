Nextflow/latest
========================
<https://github.com/nextflow-io/nextflow>

Used under license:
Creative Commons Attribution-ShareAlike 4.0 International Public License
<https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>

Structure creating script (makeroom_Nextflow_21.10.6.sh) moved to /sw/bioinfo/Nextflow/makeroom_21.10.6.sh

# To update - update script is run automatically once per week via crontab on rackham5 under user pmitev

module load bioinfo-tools
module load Nextflow/latest

nextflow self-update

LOG
---

   TOOL=Nextflow
   VERSION=latest
   makeroom.sh -t ${TOOL} -v ${VERSION} -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f

   ./makeroom_Nextflow_${VERSION}

   source SOURCEME_Nextflow_${VERSION}
   cd $TOOLDIR/$VERSION/rackham

   wget https://github.com/nextflow-io/nextflow/releases/download/v22.10.1/nextflow-22.10.1-all

   chmod +x nextflow-22.10.1-all
   mv nextflow-22.10.1-all nextflow

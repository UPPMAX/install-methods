Nextflow/22.10.1
========================
<https://github.com/nextflow-io/nextflow>

Used under license:
Creative Commons Attribution-ShareAlike 4.0 International Public License
<https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>

Structure creating script (makeroom_Nextflow_22.10.1.sh) moved to /sw/bioinfo/Nextflow/makeroom_22.10.1.sh

LOG
---

    TOOL=Nextflow
    VERSION=22.10.1
    makeroom.sh -t ${TOOL} -v ${VERSION} -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f

    ./makeroom_Nextflow_${VERSION}

    source SOURCEME_Nextflow_${VERSION}
    cd $SRCDIR;

    wget https://github.com/nextflow-io/nextflow/releases/download/v${VERSION}/nextflow-${VERSION}-all

    chmod +x nextflow-${VERSION}-all

    cd $PREFIX

    ln -s ../src/nextflow-${VERSION}-all nextflow

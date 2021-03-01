CNVkit/0.9.8
========================

<https://github.com/etal/cnvkit>

Used under license:
Apache 2.0
<https://github.com/etal/cnvkit/blob/master/LICENSE>

Structure creating script (makeroom_CNVkit_0.9.8.sh) moved to /sw/bioinfo/CNVkit/makeroom_0.9.8.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "CNVkit" -v "0.9.8" -s "misc" -w "https://github.com/etal/cnvkit" -L "https://github.com/etal/cnvkit/blob/master/LICENSE" -l "Apache 2.0" -d "A command-line toolkit and Python library for detecting copy number variants and alterations genome-wide from high-throughput sequencing."
    ./makeroom_CNVkit_0.9.8.sh
    ml python/3.8.7 biopython/1.78 pysam/0.16.0.1-python3.8.7
    pip install threadpoolctl scikit-learn pyyaml pillow pyfaidx pomegranate cnvkit --target=$PREFIX --no-dependencies

# gapseq Singularity container

https://gapseq.readthedocs.io/en/latest/install.html  
https://github.com/jotech/gapseq


To run the container
```
# Pull the container
$ singularity pull --name  gapseq.sif  shub://pmitev/UPPMAX-Singularity:gapseq
# or
$ singularity pull --name  gapseq.sif  library://pmitev/uppmax/gapseq:2021.03.17.01

# Clone the repository and step into the new folder
$ git clone https://github.com/jotech/gapseq && cd gapseq

# Run the tool
$ singularity exec ../gapseq.sif ./gapseq --help
```

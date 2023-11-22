# shovill


## To build
```bash
sudo singularity build shovill shovill-from-docker.def
```

## To test 
```bash
git clone https://github.com/tseemann/shovill.git
cd shovill
../shovill --outdir out --R1 test/R1.fq.gz --R2 test/R2.fq.gz
```

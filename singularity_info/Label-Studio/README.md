## To build

```bash
sudo singularity build label-studio.sif label-studio.def

ln -s label-studio.sif label-studio
```

## To run
```bash
./label-studio --log-level DEBUG --data-dir /full-path/mydata
```

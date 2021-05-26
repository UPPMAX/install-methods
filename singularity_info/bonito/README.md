# Bonito

## Links

https://github.com/nanoporetech/bonito/issues/70

## Building

``` bash
$ sudo singularity build bonito.sif Singularity.bonito |& tee build.log
```

## Testing

``` bash
$ ./bonito.sif
Singularity> bonito basecaller dna_r9.4.1@v2 /reads --use_openvino --device=cpu | tee basecalls.fasta
> loading model
> completed reads: 0                 
> duration: 0:00:00
> samples per second 0.0E+00
> done
Singularity>
```

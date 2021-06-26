# qsub/bash scripts for creating genome reference files (FASTA, STAR, etc.)

These scripts are intended for use with a cluster running [Grid Engine](https://en.wikipedia.org/wiki/Oracle_Grid_Engine) and [Environment Modules](http://modules.sourceforge.net/).  They may also be run as standalone bash scripts using `bash` instead of `qsub`.

### `make_ucsc_references.qsub`

Usage:
```
  qsub [qsub flags] make_ucsc_references.qsub
       [options] -b|--build [UCSC genome build]
```
Options:
```
  -b, --build          UCSC genome build (e.g., hg38, mm10, etc.)
  -o, --output-path    Path where output will be written (will be created if it does not exist)
                       (Default: ./[UCSC genome build]/)
```

Note: this step calls a wrapper script named `picard` that calls Java with the `picard.jar` file and 2GB maximum heap size.

### `generate_ucsc_star_genomes.qsub`

Usage:
```
  qsub [qsub flags] generate_ucsc_star_genomes.qsub
       [options] -b|--build [UCSC genome build] -f|--fasta-path [Path to FASTA files]
```
Options:
```
  -b, --build           UCSC genome build (e.g., hg38, mm10, etc.)
  -f, --fasta-path      Path to FASTA input files
  -o, --output-path     Path where output will be written (will be created if it does not exist)
                        (Default: ./[STAR version]/ucsc/[UCSC genome build]/)
  -s, --star-version    Version of STAR to use
                        (if omitted, default STAR module is used)
```

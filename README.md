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

Note: this script calls a wrapper script named `picard` that calls Java with the `picard.jar` file and 2GB maximum heap size.

### `make_ncbi_assembly_references.qsub`

Usage:
```
  qsub [qsub flags] make_ncbi_assembly_references.qsub [options]
       -a|--assembly [assembly name]
       -n|--ncbi [NCBI accession]
```
Options:
```
  -a, --assembly       genome assembly name (e.g., 'A_J_v1', 'MesAur1.0')
  -n, --ncbi           NCBI accession (e.g., 'GCA_001624215.1', 'GCF_000349665.1')
  -o, --output-path    Path where output will be written (will be created if it does not exist)
                       (Default: ./[assembly name]/)
```

Note: this script calls a wrapper script named `picard` that calls Java with the `picard.jar` file and 2GB maximum heap size.

### `generate_star_genomes.qsub`

Usage:
```
  qsub [qsub flags] generate_star_genomes.qsub [options]
       -r|--reference [reference name]
       -f|--fasta-path [Path to FASTA files]
```
Options:
```
  -r, --reference       Reference name
                        (e.g., hg38, mm10, bosTau9, MesAur1.0, etc.)
  -f, --fasta-path      Path to FASTA input files
                        (i.e., path containing 'base' folder, etc.)
  -o, --output-path     Path where output will be written (will be created if it does not exist)
                        (Default: ./[STAR version]/[reference name]/)
  -s, --star-version    Version of STAR to use
                        (if omitted, default STAR version is used)
```

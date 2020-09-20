#!/bin/bash

# Submit job to build a set of STAR genomes for a given UCSC build
# Adam Gower, based on scripts by Josh Campbell

# If correct number of arguments were provided, use them and proceed;
# otherwise, terminate with usage statement
if [[ $# < 2 || $# > 3 ]]
then
  echo -n "Usage: bash generate_ucsc_star_genomes.sh "
  echo "[UCSC genome build] [Path to FASTA input files] [STAR module version]"
  echo -n "e.g.:  bash generate_ucsc_star_genomes.sh hg38 "
  echo "/restricted/projectnb/cbmhive/references/ucsc/hg38 2.6.0c"
  echo "If STAR module version is omitted, default module version is used."
else
  # Process command-line arguments
  ucsc_build="${1}"
  fasta_path="${2}"
  star_version="${3}"

  project="$(groups | cut -f1 -d' ')"
  job_name="generate_ucsc_star_genomes_${ucsc_build}_${star_version}"
  qsub -P ${project} -N ${job_name} -o ${job_name}.log \
    generate_ucsc_star_genomes.qsub \
    ${ucsc_build} ${fasta_path} ${star_version}
fi

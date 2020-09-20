#!/bin/bash -l

# Submit job to build a set of reference FASTA files and indexes for a given UCSC genome build
# Adam Gower

# Process command-line arguments
# If correct number of arguments were provided, use them and proceed; otherwise, terminate with usage statement
if [[ $# < 1 || $# > 2 ]]
then
    echo "Usage: make_ucsc_references.sh [UCSC genome build] [output path]"
    echo "       [output path] default: './[UCSC genome build]/'"
    echo "e.g.:  make_ucsc_references.sh hg38"
    echo "Output path will be created if it does not already exist."
else
    ucsc_build="${1}"
    output_path="${2}"

    # If output path is not specified, a directory named with the UCSC genome build
    # will be created within the current working directory, and output will be written there
    if [[ $output_path == "" ]]
    then
        output_path="$(pwd)/${ucsc_build}"
    fi

    project="$(groups | cut -f1 -d' ')"
    qsub -P $project -N make_${ucsc_build} -o make_${ucsc_build}.log \
         make_ucsc_references.qsub $ucsc_build $output_path
fi

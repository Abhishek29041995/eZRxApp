#!/bin/bash

artifact_folder="${ARTIFACT_FOLDER}"
coverage_folder="${COVERAGE_FOLDER}"

coverage_files=''

for file in "$artifact_folder"/**/*; do
    echo $file
    if [[ $file == *.info ]]; then
        coverage_files+="--add-tracefile $file "
    fi
done

mkdir -p $coverage_folder
lcov ${coverage_files} --output-file $coverage_folder/lcov.info

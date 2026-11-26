# simple_nextflow_pipeline
Simple NextFlow Pipeline

AI was used to help build this pipeline: https://cloud.seqera.io/

## How to run
Get test data from https://github.com/hartwigmedical/testdata and put it in a sub-folder called "data" after cloning this repo.

```
nextflow run main.nf --samplesheet samplesheet.csv
```

## Run Tests
```
# https://www.nf-test.com/docs/getting-started/
nf-test test
```

## Upload to DNAnexus as applet
```
# https://documentation.dnanexus.com/developer/apps/intro-to-building-apps
dx-app-wizard
dx build
```

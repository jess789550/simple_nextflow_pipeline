# simple_nextflow_pipeline
Simple NextFlow Pipeline

AI was used to help build this pipeline: https://cloud.seqera.io/

## How to run
Get data from https://github.com/hartwigmedical/testdata and put it in a sub-folder called "data" after cloning this repo.

```
export UID_HOST=$(id -u)
export GID_HOST=$(id -g)
nextflow run main.nf --samplesheet samplesheet.csv
```

## Run Tests
Get test data from /data/dev/jess/test-datasets/data/genomics/homo_sapiens/genome/ (modules branch)
```
# Index FASTA /data/dev/jess/test-datasets/data/genomics/homo_sapiens/genome/genome.fasta
docker run --rm \
  -v "$PWD:/data" -w /data \
  dceoy/bwa-mem2 index genome.fasta

# https://www.nf-test.com/docs/getting-started/
nf-test test
```

## Upload to DNAnexus as applet
```
# https://documentation.dnanexus.com/developer/apps/intro-to-building-apps
dx-app-wizard
dx build
```

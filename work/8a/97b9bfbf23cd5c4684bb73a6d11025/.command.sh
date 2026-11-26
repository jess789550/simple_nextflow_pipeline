#!/bin/bash -ue
vep \
    --input_file TESTX_H7YRLADXX.vcf.gz \
    --output_file TESTX_H7YRLADXX.annotated.txt \
    --cache \
    --offline \
    --assembly GRCh38 \
    --dir_cache homo_sapiens_refseq \
    --dir_plugins Plugins \
    --force_overwrite

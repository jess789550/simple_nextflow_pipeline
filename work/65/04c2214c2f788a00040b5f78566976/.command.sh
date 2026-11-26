#!/bin/bash -ue
vep \
    --input_file TESTY_H7YRLADXX.vcf.gz \
    --output_file TESTY_H7YRLADXX.annotated.txt \
    --cache \
    --offline \
    --assembly GRCh38 \
    --dir_cache 111_GRCh38 \
    --dir_plugins Plugins \
    --force_overwrite

#!/bin/bash -ue
vep \
    --input_file TESTY_H7YRLADXX.vcf.gz \
    --output_file TESTY_H7YRLADXX.annotated.txt \
    --cache \
    --dir_cache tmp \
    --dir_plugins Plugins \
    --force_overwrite

#!/bin/bash -ue
vep \
    --input_file TESTZ_H7YRLADXX.vcf.gz \
    --output_file TESTZ_H7YRLADXX.annotated.txt \
    --cache \
    --offline \
    --assembly GRCh38 \
    --dir_cache jess \
    --dir_plugins Plugins \
    --force_overwrite \
    --no_stats

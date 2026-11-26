#!/bin/bash -ue
gatk HaplotypeCaller \
    -R /data/resources/GRCh38_masked_v2_decoy_excludes_GPRIN2_DUSP22_FANCD2/GRCh38_masked_v2_decoy_excludes_GPRIN2_DUSP22_FANCD2.fa \
    -I TESTZ_H7YRLADXX.sorted.bam \
    -O TESTZ_H7YRLADXX.vcf.gz

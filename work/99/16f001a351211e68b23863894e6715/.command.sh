#!/bin/bash
echo "Running BWA MEM for sample: TESTY_H7YRLADXX"
# Example command for BWA MEM (replace with actual command)
bwa mem -t 4 /data/resources/GRCh38_masked_v2_decoy_excludes_GPRIN2_DUSP22_FANCD2/GRCh38_masked_v2_decoy_excludes_GPRIN2_DUSP22_FANCD2.fa TESTY_H7YRLADXX_R1.fastq    TESTY_H7YRLADXX_R2.fastq | samtools view -Sb - > TESTY_H7YRLADXX.bam

#!/bin/bash -ue
bwa-mem2 mem -t 20 \
    -R "@RG\tID:1\tSM:TESTX_H7YRLADXX\tPL:ILLUMINA" \
    GRCh38_masked_v2_decoy_excludes_GPRIN2_DUSP22_FANCD2.fa TESTX_H7YRLADXX_S1_L001_R1_001.fastq.gz TESTX_H7YRLADXX_S1_L001_R2_001.fastq.gz \
    | samtools view -@ 20 -b -o TESTX_H7YRLADXX.bam -

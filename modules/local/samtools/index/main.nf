process SAMTOOLS_INDEX {
    tag "${meta.id}"
    container 'community.wave.seqera.io/library/bwa-mem2_samtools:ce303392aed31f97'
    cpus 20
    memory '32 GB'
    
    input:
    tuple val(meta), path(bam)

    output:
    tuple val(meta), path("${meta.name}.sorted.bam.bai"), emit: sorted_bai

    script:
    """
    samtools index ${bam}
    """
}

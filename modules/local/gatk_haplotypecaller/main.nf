process GATK_HAPLOTYPECALLER {
    tag "${meta.id}"
    container 'broadinstitute/gatk'
    cpus 20
    memory '32 GB'
    
    input:
    tuple val(meta), path(bam)
    tuple val(meta_again), path(bai)
    path reference_genome

    output:
    tuple val(meta), path("${meta.name}.vcf.gz"), emit: vcf

    script:
    """
    gatk HaplotypeCaller \\
        -R ${params.reference_genome} \\
        -I ${bam} \\
        -O ${meta.name}.vcf.gz
    """
}

process BWAMEM {
    tag "${meta.id}"
    container 'community.wave.seqera.io/library/bwa-mem2_samtools:ce303392aed31f97'
    cpus 2
    memory '32 GB'

    input:
    tuple val(meta), path(reads)
    path fasta
    path index_files

    output:
    tuple val(meta), path("${meta.name}.bam"), emit: bam

    script:
    """
    bwa-mem2 mem -t ${task.cpus} \\
        -R "@RG\\tID:${meta.id}\\tSM:${meta.name}\\tPL:ILLUMINA" \\
        ${fasta} ${reads} \\
        | samtools view -@ ${task.cpus} -b -o ${meta.name}.bam -
    """
}

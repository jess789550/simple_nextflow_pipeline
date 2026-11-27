process BWA_INDEX {
    tag "${fasta.baseName}"
    container 'quay.io/biocontainers/bwa-mem2:2.2.1--h9a82719_1'
    cpus 2
    memory '32 GB'

    input:
    path fasta

    output:
    tuple path(fasta),
          path("${fasta}.amb"),
          path("${fasta}.ann"),
          path("${fasta}.pac"),
          path("${fasta}.bwt.2bit.64"),
          path("${fasta}.0123")

    script:
    """
    bwa-mem2 index ${fasta}
    """
}

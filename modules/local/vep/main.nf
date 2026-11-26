process VEP {
    tag "${meta.id}"
    container 'ensemblorg/ensembl-vep'
    cpus 20
    memory '32 GB'
    
    input:
    tuple val(meta), path(vcf)
    path vep_cache_dir
    path vep_plugins_dir
    tuple val(meta_again), path(bai)

    output:
    tuple val(meta), path("${meta.name}.annotated.txt"), emit: annotated_vcf

    script:
    """
    vep \\
        --input_file ${vcf} \\
        --output_file ${meta.name}.annotated.txt \\
        --cache \\
        --offline \\
        --assembly GRCh38 \\
        --dir_cache ${vep_cache_dir} \\
        --dir_plugins ${vep_plugins_dir} \\
        --force_overwrite
    """
}

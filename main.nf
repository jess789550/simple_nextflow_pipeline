nextflow.enable.dsl = 2

// Load modules
include { BWA_INDEX } from './modules/local/bwa/index/main.nf'
include { BWA_MEM } from './modules/local/bwa/mem/main.nf'
include { SAMTOOLS_SORT } from './modules/local/samtools/sort/main.nf'
include { SAMTOOLS_INDEX } from './modules/local/samtools/index/main.nf'
include { GATK_HAPLOTYPECALLER } from './modules/local/gatk_haplotypecaller/main.nf'
include { VEP } from './modules/local/vep/main.nf'

// Define the workflow
workflow {
    // Parse the samplesheet and create a channel of metadata
    ch_meta = channel.fromPath(params.samplesheet)
        .splitCsv(header: true)
        .map { row ->
            def meta = [ id: row.Sample_ID, name: row.Sample_Name, project: row.Sample_Project ]
            [ meta.name, meta ]
        }
    
    // Parse the FASTQ files and create a channel of reads
    ch_reads = channel.fromFilePairs("${params.fastq_dir}/*_{1,2}*.fastq.gz")
        .map { name, reads -> [ name.replaceFirst(/_S\d+_L\d{3}$/, ''), reads ] }
    
    // Join the metadata and reads channels to create a channel of input tuples  
    ch_input = ch_meta
        .join(ch_reads)
        .map { _key, meta, reads -> [ meta, reads ] }
    
    // Print the input channel for debugging
    ch_input.view { v -> "INPUT: ${v}" }
    
    // Define the reference genome
    def fasta = file(params.reference_genome, checkIfExists: true)

    // Index the reference genome using BWA_INDEX
    BWA_INDEX(fasta)
    
    // Align reads using BWA-MEM
    BWA_MEM(ch_input, BWA_INDEX.out)
    
    // Sort the BAM files using SAMTOOLS_SORT
    SAMTOOLS_SORT(BWA_MEM.out.bam)
    
    // Index the sorted BAM files using SAMTOOLS_INDEX
    SAMTOOLS_INDEX(SAMTOOLS_SORT.out.sorted_bam)

    // Call variants using GATK_HAPLOTYPECALLER
    GATK_HAPLOTYPECALLER(SAMTOOLS_SORT.out.sorted_bam, SAMTOOLS_INDEX.out.sorted_bai, params.reference_genome)

    // Annotate variants using VEP
    VEP(GATK_HAPLOTYPECALLER.out.vcf, params.vep_cache_dir, params.vep_plugins_dir, SAMTOOLS_INDEX.out.sorted_bai)
} 

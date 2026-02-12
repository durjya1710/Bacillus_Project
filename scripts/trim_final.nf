nextflow.enable.dsl=2

params.reads = "/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/*.fastq.gz"
params.outdir = "/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/Trimming_results"

process TRIMMING {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("*_trimmed.fastq"), emit: trimmed_reads
    path "*.json", emit: json_report

    script:
    """
    fastp \\
        -i ${reads[0]} -I ${reads[1]} \\
        -o ${sample_id}_1_trimmed.fastq -O ${sample_id}_2_trimmed.fastq \\
        --trim_front1 9 --trim_front2 9 \\
        --json ${sample_id}.json
    """
}

workflow {
    read_pairs_ch = Channel.fromFilePairs(params.reads)
    TRIMMING(read_pairs_ch)
}

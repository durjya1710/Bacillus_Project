nextflow.enable.dsl=2

params.scaffolds = "/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/SPADES_OUTPUT/scaffolds.fasta"
params.PROKKA_OUTPUT = "results/PROKKA_OUTPUT"

process annotate {
    conda 'bioconda::prokka=1.14.6'
    publishDir "${params.PROKKA_OUTPUT}", mode: 'copy'

input:
    path genome_fasta

output:
    path "prokka_results/*", emit: all_files
    path "prokka_results/*.txt", emit: summary_report

script:
    """
    /Users/durjyaa.17/miniconda3/envs/prokka_intel/bin/prokka --outdir prokka_results --prefix "Bacillus_subtilis" --kingdom Bacteria --cpus 2 $genome_fasta
    """
}

workflow {
    scaffolds_ch = Channel.fromPath(params.scaffolds)
    annotate(scaffolds_ch)
}

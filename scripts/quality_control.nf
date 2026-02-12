nextflow.enable.dsl=2 

params.fastq= "/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/*.fastq.gz"

params.qc_report = "/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/Fastqc_report"

process Quality_Control{
publishDir("${params.qc_report}",mode: 'copy')

input:
 path fastq

output:
 path "*"

script:
"""
fastqc $fastq
"""
}

workflow {
fastqc_ch= channel.fromPath(params.fastq)
Quality_Control(fastqc_ch)
Quality_Control.out.view()
}

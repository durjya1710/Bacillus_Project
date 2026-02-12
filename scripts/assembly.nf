nextflow.enable.dsl=2

params.read1="/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/SRR32747433_1.fastq.gz"
params.read2="/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/SRR32747433_2.fastq.gz"

params.SPADES_OUTPUT="/Users/durjyaa.17/RNAseq_project/Bacillus_Project/Nextflow/SPADES_OUTPUT"

process assemble {
publishDir("${params.SPADES_OUTPUT}", mode: 'copy')

input:
path read1
path read2 

output:
path "*", emit: spades_output

script:
"""
echo ${read1.simpleName} | cut -d'_' -f1 | xargs -I {} spades.py --careful -1 $read1 -2 $read2 -o '{}' 
"""

} 

workflow { 

read1_ch=Channel.fromPath(params.read1)

read2_ch=Channel.fromPath(params.read2)

assemble(read1_ch,read2_ch)
assemble.out.spades_output.view()

} 


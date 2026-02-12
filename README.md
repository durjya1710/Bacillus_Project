# Bacillus subtilis Genomic Analysis Pipeline
A modular **Nextflow DSL2** suite for the quality control, assembly, and functional annotation of *Bacillus subtilis*.

## 📂 Project Modules
- `quality_control.nf`: Per-base quality assessment using FastQC.
- `trim_final.nf`: Adapter removal and quality filtering via fastp.
- `assembly.nf`: De novo genome assembly using SPAdes.
- `annotation.nf`: Functional annotation with Prokka.

## 💻 Technical Resilience: Architecture Troubleshooting
A core challenge of this project involved resolving **macOS ARM64 (Apple Silicon)** compatibility issues with legacy bioinformatics dependencies. 
- **The Issue:** Lack of native ARM64 builds for `tbl2asn` and `BioPerl` modules.
- **The Solution:** I architected a dual-environment strategy, using native ARM64 for performance-heavy assembly and a **Rosetta 2 (x86_64)** translated Conda environment specifically for Prokka to ensure 100% dependency satisfaction.

## 🧬 Data
Publicly available Illumina reads: **SRR32747433**.

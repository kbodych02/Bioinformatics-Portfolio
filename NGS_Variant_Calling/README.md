# Genomic Variant Calling Pipeline 🧬💻

## Project Overview
This repository contains a fully automated Next-Generation Sequencing (NGS) pipeline for calling genomic variants (SNPs and INDELs) from raw Illumina sequencing reads. The pipeline demonstrates a standard bioinformatics "upstream" workflow: handling raw data, performing quality control, aligning reads to a reference genome, and generating a high-confidence Variant Call Format (VCF) file.

## Technologies & Tools Used
* **Shell Scripting:** Bash (Complete pipeline automation)
* **Quality Control & Trimming:** `FastQC`, `Trimmomatic`
* **Alignment & Processing:** `BWA-MEM`, `Samtools` (including modern `collate` and `fixmate` workflows)
* **Variant Calling & Filtering:** `Bcftools` (`mpileup` & `call`)

## Dataset
* **Source:** European Nucleotide Archive (ENA) / Sequence Read Archive (SRA)
* **Organism:** *Escherichia coli*
* *Note: Due to GitHub's 100MB file size limit, raw `.fastq.gz` reads and heavy `.bam` alignment files are not hosted in this repository. The provided `run_pipeline.sh` script assumes data is placed in a local `/data` directory.*

## Pipeline Architecture & Methodology

### 1. Quality Control & Adapter Trimming
* **Pre-trimming QC:** Raw paired-end reads were analyzed using `FastQC` to evaluate Phred quality scores and adapter contamination.
* **Trimming:** `Trimmomatic` was used to remove residual Illumina adapters and trim low-quality bases using a sliding window approach.

### 2. Alignment & Deduplication
* **Mapping:** High-quality trimmed reads were aligned to the reference genome using the `BWA-MEM` algorithm. 
* **BAM Processing:** The SAM output was processed using a robust `Samtools` workflow (`collate` -> `fixmate` -> `sort`) to properly format the alignments and calculate mate coordinates.
* **Deduplication:** PCR duplicates, which can introduce false-positive variant calls, were identified and removed using `samtools markdup`.

### 3. Variant Calling & Strict Filtering
* **Calling:** `bcftools mpileup` was utilized to generate genotype likelihoods, followed by `bcftools call` to output the raw variants.
* **Quality Filtering:** Variants were strictly filtered to retain only high-confidence biological signals. 
  * *Filtering criteria applied:* `QUAL > 20` (minimum 99% base call accuracy) and `INFO/DP > 10` (Minimum depth of coverage of 10x) to eliminate sequencing artifacts and background noise.

## Results
The pipeline successfully executes from raw reads to a highly curated `filtered_variants.vcf` file. This output is fully prepared for downstream clinical/functional annotation (e.g., using Ensembl VEP or SnpEff) and visual inspection.

---

#!/bin/bash

# ==============================================================================
# NGS Variant Calling Pipeline
# This script automates QC, trimming, mapping, deduplication, and variant calling.
# ==============================================================================

REF_GENOME="data/reference_genome.fasta"
READS_1="data/sample_R1.fastq.gz"
READS_2="data/sample_R2.fastq.gz"
THREADS=4

echo "Starting NGS Variant Calling Pipeline..."

echo "[1/8] Running FastQC on raw reads..."
fastqc $READS_1 $READS_2 -o results/

echo "[2/8 & 3/8] Trimming adapters and low-quality bases with Trimmomatic..."
trimmomatic PE -threads $THREADS \
  $READS_1 $READS_2 \
  data/trimmed_R1.fastq.gz data/unpaired_R1.fastq.gz \
  data/trimmed_R2.fastq.gz data/unpaired_R2.fastq.gz \
  ILLUMINACLIP:NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36


fastqc data/trimmed_R1.fastq.gz data/trimmed_R2.fastq.gz -o results/


echo "[4/8] Mapping reads to reference genome using BWA..."
bwa index $REF_GENOME
bwa mem -t $THREADS $REF_GENOME data/trimmed_R1.fastq.gz data/trimmed_R2.fastq.gz > data/mapped_reads.sam


echo "Converting and formatting BAM file..."
samtools collate -O -@ $THREADS data/mapped_reads.sam | \
samtools fixmate -m - - | \
samtools sort -@ $THREADS -o data/sorted_reads.bam
samtools index data/sorted_reads.bam


samtools flagstat data/sorted_reads.bam > results/mapping_stats.txt


echo "[6/8] Marking PCR duplicates..."
samtools markdup -r data/sorted_reads.bam data/dedup_reads.bam
samtools index data/dedup_reads.bam


echo "[7/8] Calling variants with FreeBayes..."
freebayes -f $REF_GENOME data/dedup_reads.bam > results/raw_variants.vcf


echo "[8/8] Filtering variants (Quality > 20 and Depth > 10)..."
bcftools filter -O v -o results/filtered_variants.vcf -s LOWQUAL -i 'QUAL>20 && INFO/DP>10' results/raw_variants.vcf

echo "Pipeline finished successfully! Proceed to manual annotation (SnpEff) and IGV visualization."
#!/bin/bash

# ==============================================================================
# RNA-Seq Upstream Pipeline (QC, Mapping, Counting)
# ==============================================================================

REF_GENOME="data/genome.fa"
ANNOTATION="data/annotation.gtf"
READS_1="data/rna_R1.fastq.gz"
READS_2="data/rna_R2.fastq.gz"
THREADS=4

echo "Starting RNA-Seq Pipeline..."

echo "Running FastQC..."
fastqc $READS_1 $READS_2 -o results/

echo "Trimming reads with Trimmomatic..."
trimmomatic PE -phred33 -threads $THREADS \
  $READS_1 $READS_2 \
  data/trim_R1.fq.gz data/unp_R1.fq.gz \
  data/trim_R2.fq.gz data/unp_R2.fq.gz \
  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
  

echo "Building index and mapping with HISAT2..."
hisat2-build $REF_GENOME data/genome_index
hisat2 -p $THREADS -x data/genome_index -1 data/trim_R1.fq.gz -2 data/trim_R2.fq.gz -S data/mapped.sam


samtools view -@ $THREADS -bS data/mapped.sam > data/mapped.bam
samtools sort -@ $THREADS data/mapped.bam -o data/sorted.bam
samtools index data/sorted.bam



echo "Generating count matrix with featureCounts..."
featureCounts -T $THREADS -p -s 0 -a $ANNOTATION -o results/counts.txt data/sorted.bam


cut -f1,7 results/counts.txt | tail -n +2 > results/clean_counts.csv

echo "Upstream pipeline completed! Proceed to R for DESeq2 analysis."

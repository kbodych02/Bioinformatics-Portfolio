# Transcriptomics Data Analysis: RNA-Seq EDA 🧬📊

## Project Overview
This repository contains an Exploratory Data Analysis (EDA) of a Gene Expression Cancer RNA-Seq dataset. The project demonstrates a bioinformatics workflow for handling high-dimensional transcriptomic data, from raw matrix manipulation and data cleaning to statistical analysis and advanced visualization. The primary goal is to identify and visualize gene expression patterns that differentiate various types of cancer.

## Technologies & Packages Used
* **Language:** R
* **Data Wrangling:** `dplyr`, `tidyr` (Merging datasets, filtering high-variance genes)
* **Visualization:** `ggplot2`, `pheatmap`
* **Statistical Testing:** Base R (Analysis of Variance - ANOVA)

## Key Workflow Steps
1. **Data Preprocessing:** Handled missing values via imputation and successfully merged clinical labels with the high-dimensional expression matrix.
2. **Feature Selection:** Developed a custom function to filter out low-variance genes (noise) and isolate highly variable genes (HVGs) for downstream analysis.
3. **Statistical Testing:** Performed ANOVA to confirm statistically significant differences in specific gene expression levels across different tumor classes.
4. **Data Visualization:** Generated density and boxplots to visualize single-gene expression distributions, and scatterplots for gene co-expression.
5. **Advanced Clustering:** Computed Z-scores and utilized `pheatmap` to create a publication-ready heatmap with hierarchical clustering, revealing distinct expression profiles for top highly variable genes.

## Dataset Origin
The dataset used is the [Gene Expression Cancer RNA-Seq Dataset](https://www.kaggle.com/datasets/simiotic/gene-expression-cancer-rna-seq), representing a subset of the TCGA (The Cancer Genome Atlas) PANCAN dataset.


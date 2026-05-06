# Breast Cancer Diagnostic: Exploratory Data Analysis in R 🧬📊

## Project Overview
This repository contains a comprehensive Exploratory Data Analysis (EDA) of the Breast Cancer Wisconsin (Diagnostic) Dataset. The project demonstrates a full data processing pipeline in R, from raw data inspection to statistical testing and visualization. The primary goal is to analyze the morphological features of cell nuclei to understand the statistical differences between benign and malignant tumors.

## Technologies & Packages Used
* **Language:** R
* **Reporting:** R Markdown
* **Data Manipulation:** `dplyr`, `tidyr`
* **Visualization:** `ggplot2`
* **Statistical Modeling:** Base R (T-tests, Linear Regression)

## Key Workflow Steps
1. **Data Preprocessing & Imputation:** Handled missing values using mean imputation and transformed categorical data types.
2. **Exploratory Data Analysis (EDA):** Grouped, filtered, and aggregated tumor features based on diagnosis to identify initial patterns.
3. **Statistical Testing:** Performed a Student's t-test which revealed a highly statistically significant difference in mean tumor radius between benign and malignant classes.
4. **Data Visualization:** Created aesthetic, publication-ready plots (density plots, boxplots, and scatter plots) to visualize feature distributions and correlations.
5. **Advanced Modeling:** Built and evaluated a linear regression model to predict tumor area based on its perimeter.

## Dataset Origin
The dataset used is the widely recognized [Breast Cancer Wisconsin (Diagnostic) Dataset](https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data), originally sourced from the UCI Machine Learning Repository.

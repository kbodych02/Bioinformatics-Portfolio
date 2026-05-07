# Benchmarking AI and Machine Learning Models in Protein Bioinformatics 🤖🧬

## 📌 Project Overview
This project investigates the reliability of state-of-the-art Machine Learning (ML) models in predicting fundamental protein properties: subcellular localization, molecular function, and 3D structure. The goal is to critically compare "AI-first" predictions with high-confidence experimental data curated in **UniProt** and the **Protein Data Bank (PDB)**.

**Case Study Protein:** * **EGFR** (Epidermal Growth Factor Receptor) - UniProt ID: [P00533](https://www.uniprot.org/uniprotkb/P00533/entry)
* A critical transmembrane receptor tyrosine kinase responsible for cell signaling. Mutations in EGFR are major drivers of various cancers, making it a highly relevant target in oncology and structure-based drug design.

---

## 🛠️ Methodology & Tools
* **Localization Prediction:** [DeepLoc 2.0](https://services.healthtech.dtu.dk/services/DeepLoc-2.0/) – A multi-label deep learning predictor for subcellular localization.
* **Functional Annotation:** [DeepGOPlus](https://deepgo.cbrc.kaust.edu.sa/deepgo/) – A model combining deep learning and homology-based information to predict Gene Ontology (GO) terms.
* **Structural Prediction:** [AlphaFold DB](https://alphafold.ebi.ac.uk/) – The revolutionary AI system by Google DeepMind.
* **Structural Verification:** **PyMOL** was used to perform 3D superposition (alignment) and calculate the **RMSD** (Root Mean Square Deviation) between the AI-generated model and the X-ray crystallography structure.

---

## 📊 Results and Critical Analysis

### 1. Subcellular Localization & Signal Detection (DeepLoc 2.0)
| Protein | Experimental (UniProt) | DeepLoc 2.0 Prediction | Confidence | Agreement |
| :--- | :--- | :--- | :--- | :--- |
| **EGFR** | Cell membrane | **Cell membrane** | High (Signal Peptide detected) | ✅ Yes |

* **Insight:** DeepLoc not only correctly assigned the membrane localization but also successfully identified the N-terminal signal peptide within the sequence. This demonstrates the model's capacity to recognize biological sorting signals encoded in the primary structure.

### 2. Functional Annotation (DeepGOPlus)
The deep learning model accurately assigned highly specific GO terms that perfectly align with experimental literature:
* **transmembrane signaling receptor activity** (GO:0004888) with a probability score of **0.972**
* **protein kinase activity** (GO:0004672) with a probability score of **0.966**
* **plasma membrane** (GO:0005886) with a probability score of **0.841**

### 3. Structural Accuracy: AI vs. X-ray Crystallography
To quantitatively evaluate AlphaFold's structural prediction accuracy, the AI-generated model covering the kinase domain (AF-P00533) was superimposed onto the experimental X-ray crystal structure (PDB ID: 1M17).

<img width="466" height="396" alt="af_vs_pdb_EGFR" src="https://github.com/user-attachments/assets/57eb4509-1c17-491b-9fe6-ac23b6d95fbe" />

*Figure 1: Superposition of the AlphaFold predicted model (blue) and the experimental X-ray structure (grey) for the EGFR kinase domain.*

**Structural Evaluation:**
* **RMSD Value:** The structural alignment yielded a Root Mean Square Deviation (RMSD) of **0.847 Å** (over 1841 atoms).
* **Conclusion:** An RMSD value strictly below 1.0 Å indicates sub-angstrom, atomic-level precision. This proves that AlphaFold is highly reliable in predicting the 3D conformation of tightly folded functional domains, such as the catalytic kinase domain of transmembrane receptors.

---

## 📝 General Conclusion
The analysis of EGFR demonstrates that modern ML models are exceptionally accurate in predicting well-defined domains and standard cellular localizations. The integration of ML tools provides highly reliable predictions that closely mirror experimental data. DeepLoc and DeepGOPlus serve as robust computational screening tools, while AlphaFold provides near-experimental quality 3D coordinates (RMSD = 0.847 Å), proving its immense value for downstream bioinformatics applications.

## 🚀 How to Reproduce
* **Data:** Sequences and raw ML outputs (CSV/JSON) are located in the `/data` directory.
* **Structures:** The experimental PDB (`1m17.pdb`) and AlphaFold (`AF-P00533.pdb`) files are in `/structures`.
* **Scripts:** To reproduce the structural alignment and RMSD calculation, open PyMOL and run the script located at `scripts/align_EGFR.pml`.

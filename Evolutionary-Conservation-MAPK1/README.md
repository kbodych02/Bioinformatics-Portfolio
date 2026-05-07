# Evolutionary Conservation Analysis of MAPK1 (ERK2) 🧬

## 📌 Project Overview
This repository contains a structural and evolutionary bioinformatics analysis of the human **MAPK1 (Mitogen-Activated Protein Kinase 1)**, also known as ERK2. The project explores how homologous sequence comparison reveals the evolutionary conservation of key structural elements, catalytic motifs, and Post-Translational Modifications (PTMs).

* **Target Protein:** Human MAPK1 (UniProt ID: [P28482](https://www.uniprot.org/uniprotkb/P28482/entry))
* **Tools Used:** UniProt, NCBI BLASTp, MAFFT (Multiple Sequence Alignment), Jalview, PyMOL.

## 🧬 Methodology
1. **Sequence Retrieval:** The reference sequence of human MAPK1 was retrieved from UniProt.
2. **Homology Search:** 8 homologous sequences from diverse taxa (vertebrates, invertebrates, and fungi) were collected using NCBI BLASTp to represent a broad evolutionary spectrum (e.g., *Mus musculus*, *Danio rerio*, *Drosophila melanogaster*, *Saccharomyces cerevisiae*).
3. **Multiple Sequence Alignment (MSA):** Sequences were aligned using the MAFFT web server. The alignment was visualized and analyzed using Jalview with ClustalX coloring to highlight physicochemical conservation.
4. **Structural Visualization:** The active, dual-phosphorylated state of human ERK2 (PDB ID: 2FYS) was visualized using PyMOL to map conserved active sites and PTMs spatially.

## 📊 Results & Structural Mapping

### Key Functional Residues and Conservation
| UniProt Position | Residue Function | Conserved? | Notes |
| :--- | :--- | :--- | :--- |
| **Lys54 (K)** | ATP Binding Site | Yes (100%) | Strictly conserved across all analyzed species. |
| **Asp149 (D)** | Active Site (Proton Acceptor) | Yes (100%) | Part of the highly conserved catalytic loop. |
| **Thr185 (T)** | Activation (PTM) | Yes (100%) | Phosphorylation site (part of the T-E-Y motif). |
| **Tyr187 (Y)** | Activation (PTM) | Yes (100%) | Phosphorylation site (part of the T-E-Y motif). |

### Multiple Sequence Alignment (Activation Loop)
*(Notice the 100% conservation of the T-E-Y motif and catalytic residues across diverse taxa)*
![MSA Viewer](results/msa_activation_loop.png)

### 3D Spatial Mapping of PTMs
*(Yellow/Orange: ATP-binding Lys54; Cyan: Activation Loop; Magenta: Dual phosphorylation at T185 and Y187)*
![3D Structure in PyMOL](results/aktywny_MAPK1_zoom.png)

---

## 📝 Conclusions and Evolutionary Interpretation

**Is the active site highly conserved?**
Analysis of the MSA clearly demonstrates that the active site of MAPK1 is strictly conserved across all analyzed taxa, from humans to yeast. Residues such as Lys54 (responsible for ATP binding) and Asp149 (the catalytic proton acceptor) show 100% identity in the alignment column. This extreme evolutionary stability highlights that the core catalytic machinery of the kinase is indispensable for cellular survival; any mutation in this region would likely be lethal.

**Can PTMs regulate enzyme activity based on their location?**
Yes, the spatial arrangement of PTMs is critical for the enzyme's regulation. The dual phosphorylation sites (Thr185 and Tyr187) are strategically located on the flexible activation loop (T-loop). When unphosphorylated, this loop blocks the catalytic cleft. Phosphorylation introduces massive negative charges that interact with basic residues in the kinase core, forcing a conformational change. This "opens" the active site, allowing the substrate to enter. The strategic positioning of these PTMs directly dictates the "on/off" state of the entire MAPK signaling cascade.

**Evolutionary stability and regulation:**
The evolutionary stability of MAPK1 reveals a fundamental biological principle: core functional domains remain locked in time, while regulatory mechanisms maintain strict control over their activity. Highly variable regions were only observed in the external surface loops and terminal domains, which likely evolved to interact with species-specific scaffold proteins or distinct downstream targets. However, the mechanism of activation via the T-E-Y motif remains an ancient, universal language of cellular signaling.

---

## 🚀 How to Reproduce
1. Raw FASTA sequence data is located in the `data/` directory.
2. The PyMOL visualization macro (`wizualizacja.pml`) is available in the `scripts/` directory. Open it within the PyMOL console to recreate the 3D structural mapping.

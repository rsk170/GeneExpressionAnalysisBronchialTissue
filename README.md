# 🧬 Gene Expression Analysis of RNA-seq in Bronchial Tissue

**Gene Expression Analysis of RNA-seq in Bronchial Tissue: Premalignant Lung Lesions and Current Smoking Status**

## 📌 Summary

This project explores gene expression profiles derived from bronchial tissue to study the relationship between premalignant lung lesions (PMLs) and smoking history using RNA-seq data. It includes exploratory data analysis, quality assessment, differential expression analysis, and functional enrichment, ultimately aiming to uncover biological insights associated with smoking status and tissue damage.

## 👥 Authors
- Radostina Kisleva  
- Emma Juan Salazar  
- Tamara-Dora Veres  
**Affiliation:** Universitat Pompeu Fabra  

## 🧪 Dataset
The dataset is based on RNA-seq profiles from GEO accession: [GSE79209](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE79209). The analysis uses processed count data and associated phenotypic metadata, structured in a `SummarizedExperiment` object.

## 🧰 Tools & Technologies
- **Language:** R (Bioconductor ecosystem)
- **Libraries:** edgeR, limma, GOstats, fgsea, SummarizedExperiment, kableExtra, msigdbr
- **Data Types:** RNA-seq counts, phenotypic metadata
- **Visualization:** MA-plots, PCA, dendrograms, enrichment plots

## 🔍 Key Objectives
1. Perform exploratory data analysis (EDA) on RNA-seq gene expression data.
2. Classify samples by phenotypic variables such as smoking status and dysplasia.
3. Conduct differential gene expression (DEG) analysis using linear models.
4. Perform functional enrichment with GOstats and GSEA.
5. Compare gene activity between current smokers and former smokers, and between PML vs. non-PML tissue.

## 📈 Main Findings
- Significant DEG between smoking groups and tissue conditions.
- Functional pathways disrupted in smokers include translation, oxidative phosphorylation, and ribosome biogenesis.
- Dysplasia is also associated with distinct expression profiles and pathway activation.

## 📊 Functional Enrichment
Two primary methods were used:
- **GOstats** for overrepresentation analysis in GO biological processes.
- **fgsea** for gene set enrichment across KEGG, Reactome, and Biocarta pathways.

## 🚀 Getting Started

### Prerequisites
- R (≥ 4.0.0)
- R packages: BiocManager, edgeR, limma, GOstats, SummarizedExperiment, fgsea, msigdbr, etc.

### Installation
Install core packages via:

```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("edgeR", "limma", "GOstats", "fgsea", "SummarizedExperiment"))
```

### Run Analysis
Open the `.Rmd` file and knit it to HTML or PDF:

```R
rmarkdown::render("scripts/analysis.Rmd")
```

## 📌 License
Academic use only. Contact the authors for further distribution or reuse.

## 📅 Date
Rendered on: `r Sys.Date()`

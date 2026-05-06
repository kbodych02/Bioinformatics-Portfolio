# ==============================================================================
# RNA-Seq Downstream Analysis (DEGs, GO Enrichment, Visualization)
# ==============================================================================


library(DESeq2)
library(ggplot2)
library(clusterProfiler)
library(org.Sc.sgd.db) 

print("Rozpoczynam analizę DESeq2...")



data(airway, package="airway") 

set.seed(42)
genes <- paste0("YAL00", 1:9, "C") 
genes <- c(genes, paste0("YBL0", 10:50, "W"))
countData <- matrix(rnbinom(50*6, mu=100, size=1/0.1), ncol=6)
rownames(countData) <- genes
colnames(countData) <- paste0("Sample", 1:6)

countData[1:10, 4:6] <- countData[1:10, 4:6] * 5

colData <- data.frame(
  condition = factor(c("Control", "Control", "Control", "Treatment", "Treatment", "Treatment"))
)
rownames(colData) <- colnames(countData)

dds <- DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ condition)
dds <- DESeq(dds)
res <- results(dds)

res_sig <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
print(paste("Znaleziono", nrow(res_sig), "istotnie zmienionych genów."))

res_df <- as.data.frame(res)
res_df$Significant <- ifelse(res_df$padj < 0.05 & abs(res_df$log2FoldChange) > 1, "Significant", "Not Sig")

volcano_plot <- ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = Significant)) +
  geom_point(alpha = 0.8, size=3) +
  scale_color_manual(values = c("grey", "red")) +
  theme_minimal() +
  labs(title = "Volcano Plot - Drożdże (Control vs Treatment)", 
       x = "Log2 Fold Change", y = "-Log10(P-value)")

ggsave("results/volcano_plot.png", plot = volcano_plot, width = 6, height = 5)
print("Zapisano Volcano Plot do folderu results/.")

print("Przeprowadzam analizę szlaków biologicznych (GO)...")
genes_to_test <- rownames(res_sig)

go_results <- enrichGO(gene          = genes_to_test,
                       OrgDb         = org.Sc.sgd.db,
                       keyType       = 'ORF',
                       ont           = "BP",
                       pAdjustMethod = "BH",
                       pvalueCutoff  = 0.5) 

if(nrow(go_results) > 0) {
  go_plot <- dotplot(go_results, showCategory=10) + ggtitle("Gene Ontology - Aktywne Szlaki Drożdży")
  ggsave("results/go_dotplot.png", plot = go_plot, width = 7, height = 5)
  print("Zapisano wykres GO Dotplot do folderu results/.")
} else {
  print("Brak wystarczającej liczby genów do narysowania szlaków GO (to normalne na symulowanym zbiorze).")
}

print("Gotowe! Skrypt w R zakończył działanie.")

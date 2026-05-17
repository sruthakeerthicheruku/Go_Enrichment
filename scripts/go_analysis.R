library(clusterProfiler)
library(org.Hs.eg.db)

genes = read.table(
  "gene_onotology_analysis/nrf1_genes_clean.txt",
  sep = "\t",
  header = FALSE,
  stringsAsFactors = FALSE
)$V1

ego <- enrichGO(
  gene = genes,
  OrgDb = org.Hs.eg.db,
  keyType = "SYMBOL",
  ont = "BP",
  pAdjustMethod = "BH",
  qvalueCutoff = 0.01
)

write.csv(as.data.frame(ego), "GO_annotation_results.csv")

pdf("dotplot.pdf", height = 8, width = 8)
dotplot(ego, showCategory = 20, font.size = 6)
dev.off()

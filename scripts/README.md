# Go_Enrichment
#  Gene Ontology Enrichment Pipeline with MAPT Case Study

## Overview

This project implements a bioinformatics pipeline to analyze promoter regions in the human genome and identify transcription factor binding motifs.

The workflow includes:
- Extraction of transcription start sites (TSS) from gene annotation data
- Construction of promoter regions (500 bp upstream of TSS)
- Extraction of promoter DNA sequences from the hg38 reference genome
- Identification of GC-rich motifs using EMBOSS dreg
- Gene Ontology (GO) enrichment analysis using R (clusterProfiler)
- A single-gene case study for MAPT(it is the gene I was alloted) promoter analysis

---

## Project Directory Structure
# Project Directory Structure

```
project/
│
├── MAPT(my gene)_Analysis/
│   ├── MAPT_tss.bed
│   ├── MAPT_single.bed
│   ├── MAPT_promoter.bed
│   ├── MAPT_promoter.fa
│   ├── MAPT_motif_hits.txt
│
├── scripts/
│   ├── transform.py
│   ├── go_analysis.R
│
├── results/
│   ├── nrf1_genes.txt
│     ├── nrf1_genes_clean.txt
│   ├── nrf1_matches.txt
│   ├── GO_annotation_results.csv
│   └── dotplot.pdf
│
├── human_tss.bed
├── human_tss_filtered.bed
├── human_tss_fixed.bed
├── human_tss_upstream_500.bed
├── human_tss_upstream_500.fa
├── chrom_names.txt
└── README.md
```
# Project Directory Structure

```
project/
│
├── MAPT(my gene)_Analysis/
│   ├── MAPT_tss.bed
│   ├── MAPT_single.bed
│   ├── MAPT_promoter.bed
│   ├── MAPT_promoter.fa
│   ├── MAPT_motif_hits.txt
│
├── scripts/
│   ├── transform.py
│   ├── go_analysis.R
│
├── results/
│   ├── nrf1_genes.txt
│     ├── nrf1_genes_clean.txt
│   ├── nrf1_matches.txt
│   ├── GO_annotation_results.csv
│   └── dotplot.pdf
│
├── human_tss.bed
├── human_tss_filtered.bed
├── human_tss_fixed.bed
├── human_tss_upstream_500.bed
├── human_tss_upstream_500.fa
├── chrom_names.txt
└── README.md
```
# Pipeline Workflow

## 1. TSS Extraction

Gene annotation data was processed to extract transcription start sites (TSS).

The data was filtered and formatted to retain only valid genomic entries.

**Output files:**
- `human_tss.bed`
- `human_tss_filtered.bed`
- `human_tss_fixed.bed`

## 2. Promoter Region Definition

Promoter regions were defined as 500 base pairs upstream of the TSS using strand-aware BEDTools processing.

**Output:**
- `human_tss_upstream_500.bed`

## 3. Sequence Extraction

Promoter sequences were extracted from the hg38 reference genome using BEDTools.

**Output:**
- `human_tss_upstream_500.fa`

## 4. Motif Search

A GC-rich transcription factor binding motif was searched:
- `GCGC..GCGC`

Motif search was performed using EMBOSS dreg.

**Output:**
- `nrf1_matches.txt`

## 5. Gene List Preparation

Genes containing motif occurrences were extracted and cleaned for downstream analysis.

**Final gene list:**
- `nrf1_genes.txt`
- `nrf1_genes_clean.txt`

## 6. GO Enrichment Analysis

GO enrichment analysis was performed in R using the clusterProfiler package.

**Outputs:**
- `GO_annotation_results.csv`
- `dotplot.pdf`

# MAPT Case Study (Single Gene Analysis)

gene: **MAPT**

## Objective 
to validate motif presence in a single gene promoter region.

## Workflow Summary 
- extract MAPT TSS from annotation data
- generate promoter region (500 bp upstream)
- extract promoter sequence from hg38 genome
- perform motif search using dreg.
 
## Output Files
- MAPT_tss.bed
- MAPT_single.bed
- MAPT_promoter.bed
- MAPT_promoter.fa
- MAPT_motif_hits.txt

# KEY RESULTS
Genome-wide motif scanning identified genes containing GC-rich promoter motifs; GO enrichment revealed biological processes associated with these genes; MAPT analysis confirmed motif presence in a real genomic promoter region.

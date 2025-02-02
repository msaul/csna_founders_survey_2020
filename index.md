# DO/CC Founders: Survey of Behavioral, Physiological, and Transcriptomic Traits

This GitHub repository contains code, scripts, and metadata associated with the survey of behavioral, physiological, and brain transcriptomic traits led by Michael C. Saul in early 2020.

The preprint derived from the data and analysis presented in this GitHub is on bioRxiv [https://doi.org/10.1101/2020.02.14.949784](https://doi.org/10.1101/2020.02.14.949784).

## Behavioral and Physiological Data Analysis

The behavioral and physiological data presented in **Figure 1** were analyzed using the following notebooks:

### Novelty response

* [Novelty response: all traits heritability RMarkdown notebook](Rmd/novelty_heritability_plot.Rmd)
* [Novelty response: all traits heritability HTML report](html/novelty_heritability_plot.html)

### Circadian rhythms

* [Circadian rhythm: fibroblast *Bmal1-dLuc* amplitude RMarkdown notebook](Rmd/circadian_fibroblast_heritability_plot.Rmd)
* [Circadian rhythm: fibroblast *Bmal1-dLuc* amplitude HTML report](html/circadian_fibroblast_heritability_plot.html)

### Reversal learning

* [Reversal learning: premature responding at reversal RMarkdown notebook](Rmd/reversal_heritability_plot.Rmd)
* [Reversal learning: premature responding at reversal HTML report](html/reversal_heritability_plot.html)

### Cocaine locomotor sensitization

* [Cocaine sensitization: initial locomotor sensitivity to cocaine RMarkdown notebook](Rmd/sensi_heritability_plot.Rmd)
* [Cocaine sensitization: initial locomotor sensitivity to cocaine HTML report](html/sensi_heritability_plot.html)

### Cocaine intravenous self-administration

* [Cocaine intravenous self-administration: sessions to acquisition and infusions at FR-1 1.0 mg/kg RMarkdown notebook](Rmd/IVSA_heritability_plot.Rmd)
* [Cocaine intravenous self-administration: sessions to acquisition and infusions at FR-1 1.0 mg/kg HTML report](html/IVSA_heritability_plot.html)

## RNAseq Data Analysis

The RNAseq data presented in **Figure 2** and **Figure 3** were analyzed with the following scripts, code, and metadata:

### Initial FASTQ data QC shell scripts and file keys

*Note: these shell scripting commands were performed in a cluster computing environment.*

* [Raw founders FASTQ files key](file_keys/founders_fastq_files.txt)
* [FASTQC instance 1 shell script](sh/fastqc_1.sh)
* [FASTQC instance 2 shell script](sh/fastqc_2.sh)
* [FASTQC instance 3 shell script](sh/fastqc_3.sh)
* [FASTQC instance 4 shell script](sh/fastqc_4.sh)

### Initial FASTQ data QC report

* [MultiQC report for all raw FASTQ data](html/multiqc_report.html)

### Concatenate samples to single FASTQ files

*Note: these shell scripting commands were performed in a cluster computing environment.*

* [Read end 1 concatenate files key](file_keys/cat_fastq_in_R1.txt)
* [Read end 2 concatenate files key](file_keys/cat_fastq_in_R2.txt)
* [Concatenated FASTQ file prefices](file_keys/file_prefices.txt)
* [Concatenate samples 1-4 to single files shell script](sh/cat_founder_fastqs_1to4.sh)
* [Concatenate samples 5-128 to single files shell script](sh/cat_founder_fastqs_5to128.sh)

### Download genome and index

Once the reference genome and transcriptome were downloaded, the attached ERCC files were appended to the end using the `cat` command.

*Note: genome indexing shell script commands were performed in a cluster computing environment.*

* [Download genome RMarkdown notebook](Rmd/founders_mgp_vcf_ensembl_genome_download.Rmd)
* [Download genome HTML report](html/founders_mgp_vcf_ensembl_genome_download.html)
* [ERCC FASTA file](ERCC/ERCC.fa)
* [ERCC GTF file](ERCC/ERCC.gtf)
* [Index downloaded genome shell script](sh/STAR_index.sh)

### Align to transcriptome and quantify transcripts

*Note: these shell scripting commands were performed in a cluster computing environment.*

* [Sample prefices files key](file_keys/file_prefices.txt)
* [STAR alignment and RSEM transcript quantification using expectation maximization shell script](sh/STAR_align_all_ref_RSEM.sh)

### Analyze differential expression

* [Prepare expression data for analysis RMarkdown notebook](Rmd/founders_expression_prep_STAR_RSEM.Rmd)
* [Prepare expression data for analysis HTML report](html/founders_expression_prep_STAR_RSEM.html)
* [Analyze expression data with voom+limma RMarkdown notebook](Rmd/founders_expression_analysis_STAR_RSEM.Rmd)
* [Analyze expression data with voom+limma HTML report](html/founders_expression_analysis_STAR_RSEM.html)

### Analyze overlap with human transcriptome data

* [MSET overlap analysis RMarkdown notebook](Rmd/founders_expression_overlap_STAR_RSEM.Rmd)
* [MSET overlap analysis HTML report](html/founders_expression_overlap_STAR_RSEM.html)

## Licensing

DO/CC Founders: Survey of Behavioral, Physiological, and Transcriptomic Traits. Copyright (C) 2020, Michael C. Saul.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/).

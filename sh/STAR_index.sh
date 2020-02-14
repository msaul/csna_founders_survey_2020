#!/bin/bash
#PBS -N STAR_index
#PBS -l nodes=1:ppn=20,walltime=48:00:00
#PBS -q batch
#PBS -d /projects/csna/rnaseq/CCFounders_Sham_Cocaine/genome/
#PBS -m e
#PBS -M michael.saul@jax.org

# Running version 2.6.1 of STAR
STAR=/home/saulm/STAR/bin/Linux_x86_64/STAR

gunzip -c ./raw/Mus_musculus.GRCm38.94.gtf.gz >./Mus_musculus.GRCm38.94_ERCC.gtf
cat ./raw/ERCC92.gtf >>./Mus_musculus.GRCm38.94_ERCC.gtf
gunzip -c ./raw/Mus_musculus.GRCm38.dna_sm.primary_assembly.fa.gz >./Mus_musculus.GRCm38.dna_sm.primary_assembly_ERCC.fa
cat ./raw/ERCC92.fa >>./Mus_musculus.GRCm38.dna_sm.primary_assembly_ERCC.fa

$STAR --runThreadN 20 \
--runMode genomeGenerate \
--genomeDir /projects/csna/rnaseq/CCFounders_Sham_Cocaine/genome/ \
--genomeFastaFiles Mus_musculus.GRCm38.dna_sm.primary_assembly_ERCC.fa \
--sjdbGTFfile Mus_musculus.GRCm38.94_ERCC.gtf \
--sjdbOverhang 149

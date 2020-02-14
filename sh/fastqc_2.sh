#!/bin/bash
#PBS -N fastqc_founders_128
#PBS -l nodes=1:ppn=1,walltime=48:00:00
#PBS -q batch
#PBS -m e
#PBS -t 257-512
#PBS -M michael.saul@jax.org

module load fastqc/0.11.3

QC_DIR="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/QC/"
FASTQ_DIR="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/fastqs/"
FASTQ_FILE=`cat /projects/csna/rnaseq/CCFounders_Sham_Cocaine/file_keys/founders_fastq_files.txt | head -n $PBS_ARRAYID | tail -n -1`

# fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam]
#        [-c contaminant file] seqfile1 .. seqfileN

mkdir $QC_DIR$FASTQ_FILE
fastqc -o $QC_DIR$FASTQ_FILE -f fastq $FASTQ_DIR$FASTQ_FILE".fq.gz"

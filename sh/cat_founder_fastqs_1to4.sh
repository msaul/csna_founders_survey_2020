#!/bin/bash
#PBS -N cat_founder_fastqs_1-4
#PBS -l nodes=1:ppn=2,walltime=48:00:00
#PBS -q batch
#PBS -d /projects/csna/rnaseq/CCFounders_Sham_Cocaine/
#PBS -t 1-4
#PBS -m e
#PBS -M michael.saul@jax.org

R1_IN=`head -n $PBS_ARRAYID ./file_keys/cat_fastq_in_R1.txt | tail -n 1`
R2_IN=`head -n $PBS_ARRAYID ./file_keys/cat_fastq_in_R2.txt | tail -n 1`
R1_OUT="./LaneALL/"`head -n $PBS_ARRAYID ./file_keys/cat_fastq_out_R1.txt | tail -n 1`
R2_OUT="./LaneALL/"`head -n $PBS_ARRAYID ./file_keys/cat_fastq_out_R2.txt | tail -n 1`

echo "Concatenating R1 files to "$R1_OUT" for downstream alignment: `date`"
echo ""
zcat $R1_IN | gzip >$R1_OUT
echo ""
echo "Concatenating R2 files to "$R2_OUT" for downstream alignment: `date`"
echo ""
zcat $R2_IN | gzip >$R2_OUT
echo ""
echo "Finished concatenating R1 and R2 files for downstream alignment: `date`"

#!/bin/bash
#PBS -N STAR_align_all_ref_RSEM
#PBS -l nodes=1:ppn=4,walltime=48:00:00
#PBS -q batch
#PBS -d /projects/csna/rnaseq/CCFounders_Sham_Cocaine/
#PBS -t 1-128
#PBS -m e
#PBS -M michael.saul@jax.org

# Loading RSEM module
module load rsem/1.3.0

# Running version 2.6.1 of STAR
STAR=/home/saulm/STAR/bin/Linux_x86_64/STAR

# Getting prefix information
PREFIX=`head -n $PBS_ARRAYID ./file_keys/file_prefices.txt | tail -n 1`
echo "Using STAR to align files from "$PREFIX": `date`"

MOUSEGTF="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/genome/Mus_musculus.GRCm38.94_ERCC.gtf"
OUTDIR="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/B6_STAR_aligned_RSEM/"$PREFIX"/"
GENOMEDIR="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/genome/"
echo ""
echo "Output Directory: "$OUTDIR
echo "Index Directory: "$GENOMEDIR
echo "Mouse Reference GTF: "$MOUSEGTF
echo ""

OUTBAM=$OUTDIR"Aligned.sortedByCoord.out.bam"
OUTTRANSBAM=$OUTDIR"Aligned.toTranscriptome.out.bam"
REFLOC="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/genome/ref/Mus_musculus.GRCm38.dna_sm.primary_assembly_ERCC"
OUTQUANT=$OUTDIR"/"$PREFIX"_RSEM_quant"

mkdir $OUTDIR

FASTQ_1="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/LaneALL/"$PREFIX"_conatenated_R1.fastq.gz"
FASTQ_2="/projects/csna/rnaseq/CCFounders_Sham_Cocaine/LaneALL/"$PREFIX"_conatenated_R2.fastq.gz"

echo "Forward Read FASTQ: "$FASTQ_1
echo "Reverse Read FASTQ: "$FASTQ_2
echo "Output Directory: "$OUTDIR
echo "Output BAM file: "$OUTBAM
echo ""

# Running STAR
$STAR --runThreadN 4 \
--genomeDir $GENOMEDIR \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--quantMode TranscriptomeSAM \
--quantTranscriptomeBAMcompression -1 \
--quantTranscriptomeBan IndelSoftclipSingleend \
--outFileNamePrefix $OUTDIR \
--outSAMattributes NH HI AS nM \
--readFilesIn $FASTQ_1 $FASTQ_2

echo "Using RSEM to quantify transcriptome of sample "$PREFIX": `date`"
echo ""
echo "Transcriptome Alignment BAM file: "$OUTTRANSBAM
echo "RSEM reference: "$REFLOC
echo ""

# Running RSEM
rsem-calculate-expression --bam --paired-end -p 4 \
--estimate-rspd --append-names \
$OUTTRANSBAM \
$REFLOC \
$OUTQUANT

rm $OUTTRANSBAM

echo "Alignment and de novo transcriptome assembly of sample "$PREFIX" complete: `date`"

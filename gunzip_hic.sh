#!/bin/bash -l
#SBATCH -J gunzip
#SBATCH --mem=10G
#SBATCH --time=4:00:00
#SBATCH -N 1
#SBATCH -c 1

fileName=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$1}" input.txt)
outdir=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$2}" input.txt)

gunzip -c ${fileName} > ${outdir}/matrix.cool

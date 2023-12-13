#!/bin/bash -l
#SBATCH -J hic2cool
#SBATCH --mem=40G
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH -c 1

fileName=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$1}" input.txt)
outdir=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$2}" input.txt)

cd ${outdir}

module load python/cpu/3.8.11 
module load gcc/8.1.0

python hic2cool.py

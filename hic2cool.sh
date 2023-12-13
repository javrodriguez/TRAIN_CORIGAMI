#!/bin/bash -l
#SBATCH -J hic2cool
#SBATCH --mem=40G
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH -c 1

fileName=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$1}" input.txt)
outdir=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$2}" input.txt)

cd ${outdir}

# .hic to .txt
module load python/cpu/3.8.11 
module load gcc/8.1.0

python hic2cool.py

# .txt to .cool
module unload python/cpu/3.8.11 
module unload gcc/8.1.0

module load anaconda3/cpu/5.2.0
conda activate hicexplorer

cooler load -f bg2 hg38.size:10000 matrix.txt matrix.cool

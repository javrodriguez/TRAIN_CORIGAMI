#!/bin/bash -l
#SBATCH -J hic2cool
#SBATCH --mem=40G
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH -c 1

fileName=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$1}" input.txt)
outdir=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$2}" input.txt)

cp cool2npz.py ${outdir}/cool2npz.py
cd ${outdir}

module purge
module load anaconda3/cpu/5.2.0
conda activate hicexplorer

python cool2npz.py matrix.cool ./ -r 10000 -w 256

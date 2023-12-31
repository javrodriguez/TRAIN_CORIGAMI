#!/bin/bash -l
#SBATCH -J pltHmaps
#SBATCH --mem=40G
#SBATCH --time=4:00:00
#SBATCH -N 1
#SBATCH -c 1

outdir=$(awk "NR==${SLURM_ARRAY_TASK_ID} {print \$2}" input.txt)

cp make_contact_heatmaps.R ${outdir}/make_contact_heatmaps.R
cd ${outdir}

module purge
module load
module load r
module load cairo

Rscript make_contact_heatmaps.R
pdfunite contact_hmap_chr*.pdf contact_heatmaps.pdf
rm -f contact_hmap_chr*.pdf

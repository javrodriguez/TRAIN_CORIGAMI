#!/bin/bash
#SBATCH -J download
#SBATCH --mem=10gb 
#SBATCH --time=48:00:00 
#SBATCH --output=%J.log
#SBATCH --error=%J.out

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE238nnn/GSE238021/suppl/GSE238021_ENCFF318GOM_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE237nnn/GSE237721/suppl/GSE237721_ENCFF573OPJ_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE237nnn/GSE237899/suppl/GSE237899_ENCFF807IRK_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE237nnn/GSE237347/suppl/GSE237347_ENCFF281ILS_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE237nnn/GSE237898/suppl/GSE237898_ENCFF621AIY_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE237nnn/GSE237479/suppl/GSE237479_ENCFF522YLZ_mapping_quality_thresholded_contact_matrix_GRCh38.hic.gz

#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --account=def-grouleau
#SBATCH --output=GWAS_ABCD_main_smri_vol_scs_wholeb.out
#SBATCH --mem=80g
#SBATCH --cpus-per-task=20
#SBATCH --mail-user=lang.liu@mail.mcgill.ca
#SBATCH --mail-type=ALL

module load StdEnv/2020 plink/2.00-10252019-avx2
#regular GWAS covariate
file=/home/liulang/scratch/genotype/ABCD/imputed/soft_calls/GWAS_QC/ABCD_all.QC
echo "working on smri_vol_scs_wholeb"
plink2 \
    --bfile $file \
    --memory 160000 \
    --glm hide-covar cols=+a1freq \
    --covar-variance-standardize \
    --pheno ../phenotype/ABCD_phenotype_all_normalized_visit1.tsv \
    --pheno-name smri_vol_scs_wholeb \
    --covar ../phenotype/ABCD_covariate_visit1.tsv \
    --covar-name interview_age,sex,pc1,pc2,pc3,pc4,pc5,pc6,pc7,pc8,pc9,pc10 \
    --out ../GWAS_result/visit1/BASE/ABCD_smri_vol_scs_wholeb

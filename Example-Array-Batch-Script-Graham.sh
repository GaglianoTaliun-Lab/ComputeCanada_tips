#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gres=gpu:v100:1
#SBATCH --cpus-per-task=2
#SBATCH --mem=100G
#SBATCH --job-name=plink
#SBATCH --account=def-gsarah
#SBATCH --output=%a.log
#SBATCH --array=1-22
declare -a jobs

module load plink/2.00-10252019-avx2

jobs[1]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_1_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr1"
jobs[2]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_2_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr2"
jobs[3]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_3_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr3"
jobs[4]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_4_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr4"
jobs[5]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_5_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr5"
jobs[6]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_6_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr6"
jobs[7]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_7_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr7"
jobs[8]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_8_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr8"
jobs[9]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_9_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr9"
jobs[10]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_10_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr10"
jobs[11]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_11_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr11"
jobs[12]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_12_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr12"
jobs[13]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_13_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr13"
jobs[14]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_14_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr14"
jobs[15]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_15_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr15"
jobs[16]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_16_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr16"
jobs[17]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_17_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr17"
jobs[18]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_18_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr18"
jobs[19]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_19_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr19"
jobs[20]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_20_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr20"
jobs[21]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_21_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr21"
jobs[22]="plink2 --bgen /home/gsarah/projects/def-gsarah/clsa/clsa_imp_22_v3.bgen ref-first --sample /home/gsarah/projects/def-gsarah/clsa/clsa_imp_v3.sample --make-bed --out /home/gsarah/scratch/clsa-bgenimp2plink/chr22"
eval ${jobs[${SLURM_ARRAY_TASK_ID}]}

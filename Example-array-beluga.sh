#!/bin/bash
#SBATCH --time=100:00:00
#SBATCH --job-name=composite
#SBATCH --account=def-gsarah
#SBATCH --mem=300G
#SBATCH --cpus-per-task=1
#SBATCH --output=logs/%a.log
#SBATCH --array=1-23
declare -a jobs

##module load required modules for the script to run
module load r/4.0.5

#in this example, we are running a bash script called step2_SPATests_sav_savvy-bgen.sh (which has some parameters: thus the additional text)
#for each chromosome
jobs[1]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 1 ukb_chr1_v3 250000000"
jobs[2]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 2 ukb_chr2_v3 250000000"
jobs[3]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 3 ukb_chr3_v3 250000000"
jobs[4]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 4 ukb_chr4_v3 250000000"
jobs[5]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 5 ukb_chr5_v3 250000000"
jobs[6]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 6 ukb_chr6_v3 250000000"
jobs[7]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 7 ukb_chr7_v3 250000000"
jobs[8]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 8 ukb_chr8_v3 250000000"
jobs[9]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 9 ukb_chr9_v3 250000000"
jobs[10]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 10 ukb_chr10_v3 250000000"
jobs[11]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 11 ukb_chr11_v3 250000000"
jobs[12]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 12 ukb_chr12_v3 250000000"
jobs[13]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 13 ukb_chr13_v3 250000000"
jobs[14]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 14 ukb_chr14_v3 250000000"
jobs[15]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 15 ukb_chr15_v3 250000000"
jobs[16]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 16 ukb_chr16_v3 250000000"
jobs[17]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 17 ukb_chr17_v3 250000000"
jobs[18]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 18 ukb_chr18_v3 250000000"
jobs[19]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 19 ukb_chr19_v3 250000000"
jobs[20]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 20 ukb_chr20_v3 250000000"
jobs[21]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 21 ukb_chr21_v3 250000000"
jobs[22]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol 22 ukb_chr22_v3 250000000"
jobs[23]="sh step2_SPATests_sav_savvy-bgen.sh ratio.casecontrol X ukb_chrX_v3 250000000"
eval ${jobs[${SLURM_ARRAY_TASK_ID}]}

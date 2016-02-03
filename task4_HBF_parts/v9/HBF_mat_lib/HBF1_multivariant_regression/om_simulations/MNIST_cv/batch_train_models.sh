#!/bin/bash
#SBATCH --job-name=HBF1_model_train
#SBATCH --nodes=1
#SBATCH --mem=1500
#SBATCH --time=1:00:00
#SBATCH --array=1-5

SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID:-1}
echo $SLURM_ARRAY_TASK_ID
echo SLURM
matlab -nodesktop -nosplash -nojvm -r "get_best_trained_hbf1_model( $SLURM_ARRAY_TASK_ID, sprintf('./changing_params/job_1/changing_param_%d.m', $SLURM_ARRAY_TASK_ID) , './fixed_params.m','./results/results_job_1/');exit"

#!/bin/bash
#SBATCH --job-name=Hello_World_Worker
#SBATCH --nodes=1
#SBATCH --mem=1000
#SBATCH --time=1:00:00

matlab -nodesktop -nosplash -nojvm -r "get_best_trained_hbf1_model($1,$2,$3,$4,$5)"

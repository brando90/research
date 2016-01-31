#!/bin/bash
#SBATCH --job-name=Hello_World_Worker
#SBATCH --nodes=1
#SBATCH --mem=1000
#SBATCH --time=1:00:00

matlab -nodesktop -nosplash -nojvm -r "get_betst_trained_hbf1_model($1)"

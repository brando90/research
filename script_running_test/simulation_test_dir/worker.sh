#!/bin/bash
#SBATCH --job-name=Hello_World_Worker
#SBATCH --nodes=1			    
#SBATCH --mem=1000
#SBATCH --time=1:00:00

matlab -nodesktop -nosplash -nojvm -r "hello_world_to_file($1)"

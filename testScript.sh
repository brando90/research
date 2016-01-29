#!/bin/sh
#
#SBATCH --ntasks=1
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=100
srun hostname
srun hostname

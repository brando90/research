#!/bin/bash
#
#SBATCH --nodes=4
#SBATCH --ntasks=12
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=100
srun hostname

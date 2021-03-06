#!/bin/bash

# SLURM
# https://slurm.schedmd.com/sbatch.html

#SBATCH --job-name=perrimon            # Job name
#SBATCH --partition=medium             # Partition name
#SBATCH --time=1-00:00                 # Runtime in D-HH:MM format
#SBATCH --nodes=1                      # Number of nodes (keep at 1)
#SBATCH --ntasks=1                     # Number of tasks per node (keep at 1)
#SBATCH --cpus-per-task=1              # CPU cores requested per task (change for threaded jobs)
#SBATCH --mem-per-cpu=32G              # Memory needed per CPU
#SBATCH --error=jobid_%j.err           # File to which STDERR will be written, including job ID
#SBATCH --output=jobid_%j.out          # File to which STDOUT will be written, including job ID
#SBATCH --mail-type=ALL                # Type of email notification (BEGIN, END, FAIL, ALL)

# Need to load r-base conda first

R_DEFAULT_PACKAGES="stats,graphics,grDevices,utils,datasets,methods,base"

Rscript --default-packages="$R_DEFAULT_PACKAGES" -e "source('04_seurat_markers_per_sample_and_treatment.R')"

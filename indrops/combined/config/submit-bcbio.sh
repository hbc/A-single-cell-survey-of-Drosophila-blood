#!/bin/bash

# https://slurm.schedmd.com/sbatch.html

#SBATCH --job-name=perrimon            # Job name
#SBATCH --partition=medium             # Partition name
#SBATCH --time=3-00:00                 # Runtime in D-HH:MM format
#SBATCH --nodes=1                      # Number of nodes (keep at 1, except when using MPI queue)
#SBATCH --ntasks=1                     # Number of cores per node (keep at 1)
#SBATCH --cpus-per-task=1              # CPU cores requested per task (change for threaded jobs)
#SBATCH --mem-per-cpu=8G               # Memory needed per CPU
#SBATCH --error=jobid_%j.err           # File to which STDERR will be written, including job ID
#SBATCH --output=jobid_%j.out          # File to which STDOUT will be written, including job ID
#SBATCH --mail-type=ALL                # Type of email notification (BEGIN, END, FAIL, ALL)

bcbio_nextgen.py ../config/bcbio.yaml -n 50 -t ipython -s slurm -q medium -r t=3-00:00 --retries 3 --timeout 1000

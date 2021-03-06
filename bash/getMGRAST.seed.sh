#!/bin/bash
#SBATCH --job-name=s.getMGRAST
#SBATCH --partition=compute
#SBATCH --time=84:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=getMGRAST_%j.out
#SBATCH --error=getMGRAST_%j.err

key=$1
mgid=$2
echo "$1 SEED for $2"
srun curl  -H "auth: $key" -H 'Accept-Encoding: gzip,deflate' "http://api.metagenomics.anl.gov/1/annotation/similarity/$mgid?source=SEED&type=organism&identity=60&length=15" -o "$mgid.seed"


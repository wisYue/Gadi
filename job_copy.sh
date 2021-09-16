#!/bin/bash
#PBS -q copyq
#PBS -l walltime=10:00:00
#PBS -l storage=scratch/ek9
#PBS -l mem=8GB
#PBS -l wd
#PBS -m bea
#PBS -M firstname.lastname@anu.edu.au

# this would have copied/rsync-ed your /short dir on Raijin to your /scratch dir on Gadi (not anymore though :-)
rsync -aKElv --stats /raijin/short/ek9/$USER/ /scratch/ek9/$USER/SHORT_$USER &>>rsync_short.out

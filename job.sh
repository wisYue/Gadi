#!/bin/bash
#PBS -P ek9
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=48
#PBS -l mem=192GB
#PBS -l storage=scratch/ek9+gdata/ek9
#PBS -l wd
#PBS -N test_job
#PBS -j oe
#PBS -m bea
#PBS -M firstname.lastname@anu.edu.au

mpirun -np $PBS_NCPUS ./flash4 1>shell.out00 2>&1

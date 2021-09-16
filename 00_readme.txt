## --- Some information on setting up and getting started on Gadi (last updated 22/08/2020)

1. You can use the .bashrc, .bash_profile and .alias from here as templates in your home directory ($HOME).
Make sure you copy them over the existing .bashrc, etc., so you have to add a '.' to make them hidden files, e.g., for .bashrc do
> mv .bashrc .bashrc__save
> mv bashrc .bashrc
[same with .alias; while bash_profile just need renaming to .bash_profile as it doesn't seem to exist by default after NIC account creation on Gadi]

2. Logout and login again to Gadi; then check that all modules are loaded correctly:
> module list
This should give you list like this:
Currently Loaded Modulefiles:
1) dot   2) pbs   3) intel-compiler/2019.3.199   4) intel-python3/2020.2.902   5) python3-as-python   6) hdf5/1.10.5p   7) szip/2.1.1   8) fftw3/3.3.8   9) openmpi/4.0.2(default)  10) petsc/3.12.2  11) ffmpeg/4.3.1
These are the modules you need for Python and for compiling and running the FLASH code.

3. You can use the template job.sh as a job script for setting up jobs to be executed on the batch nodes.
Note the Gadi user documentation, especially on how many cores per node and how much memory per node there is:
https://opus.nci.org.au/display/Help/Preparing+for+Gadi
(We've had some reports from NCI of codes running at low efficiency, which is often related to not setting up the job script with number of cores and/or memory correctly.)
Preparing a restart for a FLASH simulation works well with prep_restart.py (also provided here).

4. python, including mpi4py (python with MPI support)
This is the preferred way (matplotlib with TgAgg still works). This assumes the intel-python3 module is loaded.
Try the following:
- Check local dir ~/.local for any previous user-installed modules. Clear them if necessary for a clean start. Also good idea to clear ~/.cache (suggest rename the directories, not delete, so you have a backup copy)
- pip install -U -I --user mpi4py
- pip install --user ipython
- other modules can be installed via 'pip install --user <module>', such as 'astropy', 'h5py', etc.
- try 'mpirun -np 2 ./mpi4py_test.py' to test mpi4py

4 (Alternative). mpi4py (python with MPI support):
- Make sure all python modules are unloaded.
- Then load the python3-to-python module.
- Then do 'pip3 install pip --user --upgrade'
- Then do 'pip install --user mpi4pi'
- Now you can install any other required python module(s) in your home dir, via 'pip install --user <module>'.
- Then use 'mpirun -np 2 ./mpi4py_test.py' to test mpi4py.

5. (Deprecated) Due to some issues with latest hardware and software on Gadi, you might have to use the extra flag '-x UCX_TLS=rc' in calls to mpirun, e.g., in the job.sh job script template, see:
mpirun -np $PBS_NCPUS -x UCX_TLS=rc ./flash4 1>shell.out00 2>&1
(UPDATE: I do not think there is any need for that extra flag anymore, now that we are using an updated OpenMPI module on Gadi)


Good luck!

Cheers,
Christoph

---

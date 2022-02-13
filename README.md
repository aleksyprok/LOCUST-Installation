# LOCUST-Installation

1. Download LOCUST.

2. Download and install Nvidia HPC SDK with the newest CUDA version from here:
   
   `https://developer.nvidia.com/hpc-sdk`

3. Make a note of the CUDA version by running:

   `nvcc --version`
    
   to give e.g.:
   ```
   nvcc: NVIDIA (R) Cuda compiler driver
   Copyright (c) 2005-2021 NVIDIA Corporation
   Built on Fri_Dec_17_18:16:03_PST_2021
   Cuda compilation tools, release 11.6, V11.6.55
   Build cuda_11.6.r11.6/compiler.30794723_0
   ```
   where the CUDA version is 11.6 here.
   
4. Make a note of your GPU device revision number by running:

   `nvaccelinfo`
   
   to give e.g.:
   ```
   CUDA Driver Version:           11060
   NVRM version:                  NVIDIA UNIX x86_64 Kernel Module  510.39.01  Fri Dec 31 11:03:22 UTC 2021

   Device Number:                 0
   Device Name:                   NVIDIA GeForce RTX 3070
   Device Revision Number:        8.6
   ```
   where the device revision number here is 8.6.

4. Open makefile with a text editor.

5. Replace every instance of `pgfortran` with `nvfortran`. 

6. Ensure `CUDALIB = cc86,cuda11.6` where the numbers correspond to your device revision number respectively and CUDA versions respectively.

7. To fix a `pgacclnk` error dyuring compilation add the `-lstdc++` flag so the code reads like this:
   ```
   locust: $(OBJECTS)
	  $(FC) $(FCFLAGS) -o locust $(OBJECTS) -lstdc++
	  $(shell rm -f disp_git.f90)
	  $(shell rm -f disp_direct.f90)
   ```
8. Save changes and go back to the terminal.
9. Ensure the `/bin/sh` symbolic link points to `/bin/bash` and not `/bin/dash`.


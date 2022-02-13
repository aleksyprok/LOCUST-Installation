#!/bin/bash

export OMP_NUM_THREADS=1
ulimit -s 2000000
export OMP_STACKSIZE=102400
export CUDA_CACHE_DISABLE=1

export FLAGS_BASE="-DCONLY -DPFCMOD -DTOKHEAD -DFSTATE -DLEIID=6 \
-DSTDOUT -DSMALLEQ -DOPENTRACK -DOPENTERM -DPSIT=0.7 -DTOKAMAK=10 \
-DNOTUNE -DUNBOR=100 -DTIMAX=1e-3_gpu -DPLOT=10 -DNOHDF5"

rm -f /home/lex/locust.STEP/CacheFiles/*
cp -f /home/lex/STEP_input_files/SPR008_Redo/prec_mods/N=12_R=8.f90 /home/lex/locust/prec_mod.f90
cp -f /home/lex/STEP_input_files/SPR008_Redo/1100k_ptcles_SPR008_RNG_1.dat /home/lex/locust.STEP/InputFiles/.
cp -f /home/lex/STEP_input_files/SPR008_Redo/Profiles/* /home/lex/locust.STEP/InputFiles/.
cp -f /home/lex/STEP_input_files/SPR008_Redo/SPR-008_3_Outputs_STEP_eqref.eqdsk /home/lex/locust.STEP/InputFiles/.
cp -f /home/lex/STEP_input_files/SPR008_Redo/SPR-008_3.mesh.inp_ANSYS /home/lex/locust.STEP/InputFiles/.

# compile
cd /home/lex/locust

# now compile
make clean
make FLAGS="$FLAGS_BASE"

# Run the code
/home/lex/locust/locust

# rm -rf /home/lex/locust.STEP/InputFiles/*

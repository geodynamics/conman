echo 'Running 66x60 grids: 30 seconds'
./run_66x60.sh
echo 'Running 132x120 grids: 60 seconds'
./run_132x120.sh
echo 'Running 198x180 grids: 200 seconds'
./run_198x180.sh
echo 'Running 264x240 grids: 400 seconds'
./run_264x240.sh
echo 'Running 330x300 grids: 1000 seconds'
./run_330x300.sh
echo 'Making Table and Plots: ~2 minutes'
./Make_table.sh
./Make_top_of_slab.sh
./Make_vanKeken08_fig2.sh
echo 'Done'

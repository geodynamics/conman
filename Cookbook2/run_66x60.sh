#/bin/bash -f
../conman < run.unifA66x60
\rm -f xa? plot.unif?66x60.ps
split -4089 temp.unifA66x60
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifA66x60.ps
../conman < run.unifB66x60
\rm -f xa? 
split -4089 temp.unifB66x60
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifB66x60.ps
../conman < run.unifC66x60
\rm -f xa? 
split -4089 temp.unifC66x60
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifC66x60.ps
\rm -f xa?

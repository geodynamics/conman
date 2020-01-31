
../conman < run.unifA132x120
\rm -f xa? plot.unif?132x120.ps
split -16095 temp.unifA132x120
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifA132x120.ps
../conman < run.unifB132x120
\rm -f xa? 
split -16095 temp.unifB132x120
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifB132x120.ps
../conman < run.unifC132x120
\rm -f xa? 
split -16095 temp.unifC132x120
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifC132x120.ps
\rm -f xa?

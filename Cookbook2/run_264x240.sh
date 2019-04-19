
../conman < run.unifA264x240
\rm -f xa? plot.unif?264x240.ps
split -63867 temp.unifA264x240
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifA264x240.ps
../conman < run.unifB264x240
\rm -f xa?
split -63867 temp.unifB264x240
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifB264x240.ps
../conman < run.unifC264x240
\rm -f xa?
split -63867 temp.unifC264x240
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifC264x240.ps
\rm -f xa?

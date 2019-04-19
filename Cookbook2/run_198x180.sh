
../conman < run.unifA198x180
\rm -f xa? plot.unif?198x180.ps
split -36021 temp.unifA198x180
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifA198x180.ps
../conman < run.unifB198x180
\rm -f xa? 
split -36021 temp.unifB198x180
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifB198x180.ps
../conman < run.unifC198x180
\rm -f xa? 
split -36021 temp.unifC198x180
./plot_wedge_GMT.sh xab
mv plot.ps plot.unifC198x180.ps
\rm -f xa?

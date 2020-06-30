#/bin/bash -f
../conman < run.unifA330x300
\rm -f xa? plot.unif?330x300.ps
split -99633 temp.unifA330x300
../graphics/plot_wedge_GMT.sh xab
mv plot.ps plot.unifA330x300.ps
../conman < run.unifB330x300
\rm -f xa?
split -99633 temp.unifB330x300
../graphics/plot_wedge_GMT.sh xab
mv plot.ps plot.unifB330x300.ps
../conman < run.unifC330x300
\rm -f xa?
split -99633 temp.unifC330x300
../graphics/plot_wedge_GMT.sh xab
mv plot.ps plot.unifC330x300.ps
\rm -f xa?

#!/bin/csh -f
gmtset FONT_TITLE 24 FONT_LABEL 18 PS_PAGE_ORIENTATION LANDSCAPE PS_MEDIA letter PROJ_LENGTH_UNIT inch

# set to the size of the domain
set opts = "-K -O"

split -99633 temp.unifA330x300
# find total number of elements in x and z
set nelx = `awk 'NR==1 {print $2}' xab`
set nelz = `awk 'NR==1 {print $3}' xab`

# find min and max x and z
set xmax = `tail -1 xab | awk '{print $2*1.0} '`
set xmin = `awk 'NR==3 {print $2*1.0}' xab`
set zmax = `tail -1 xab | awk '{print $3*1.0} '`
set zmin = `awk 'NR==3 {print $3*1.0}' xab`

# find total length in x and z directions
set xtotal = `echo ' scale=9; ' $xmax - $xmin | bc ` 
set ztotal = `echo ' scale=9; ' $zmax - $zmin | bc `

set height = `echo ' scale=3; 4.0 * ' $ztotal / $xtotal | bc `
set size = "-JX4.0/$height"

awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz

set reg = "-R$xmin/$xmax/$zmin/$zmax"

surface temp.xyz -Gtemp.grd $reg -I2.0/2.0 

grd2cpt temp.grd -Cpolar -L0/1400 -S0.0/1300/200 -Z > temp.cpt

grdimage temp.grd $size $reg -Ctemp.cpt -B100:"Distance ":/100:"Depth ":WSen -K -X1.5i -Y2.0i > vanKeken08_fig2.ps
grdcontour temp.grd $size $reg -C100 -L0/1200 -W1 -K -O -X0.0 -Y0.0 >> vanKeken08_fig2.ps
psscale -Ctemp.cpt -D2.0/-0.75/4.0/0.3h -O -K >> vanKeken08_fig2.ps

set reg = "-R0/220/400/600"

grdimage temp.grd $size $reg -Ctemp.cpt -B50:"Distance ":/50:"Depth ":wSEn -K -O -X4.25i -Y-0.25i >> vanKeken08_fig2.ps
grdcontour temp.grd $size $reg -C100 -A200 -O -X0.0 -Y0.0 >> vanKeken08_fig2.ps


\rm -f temp.grd temp.cpt temp.xyz xaa xab

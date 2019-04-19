#!/bin/csh -f
# Set for GMT5
gmtset FONT_TITLE 24 FONT_LABEL 18 PS_PAGE_ORIENTATION PORTRAIT PS_MEDIA letter PROJ_LENGTH_UNIT inch

# set to the size of the domain
set opts = "-K -P -O"

if ($#argv < 1) then
   echo "You must supply one argument, plot_temp_GMT exiting."
   echo " "
   echo "syntax: plot_temp_GMT <file> "
   echo "    where <file> is the temp.xxxx file from ConMan"
   exit
endif

# find total number of elements in x and z
set nelx = `awk 'NR==1 {print $2}' $1`
set nelz = `awk 'NR==1 {print $3}' $1`

# find min and max x and z
set xmax = `tail -1 $1 | awk '{print $2*1.0} '`
set xmin = `awk 'NR==3 {print $2*1.0}' $1`
set zmax = `tail -1 $1 | awk '{print $3*1.0} '`
set zmin = `awk 'NR==3 {print $3*1.0}' $1`

# find total length in x and z directions
set xtotal = `echo ' scale=9; ' $xmax - $xmin | bc ` 
set ztotal = `echo ' scale=9; ' $zmax - $zmin | bc `

set height = `echo ' scale=3; 6.0 * ' $ztotal / $xtotal | bc `
set size = "-JX6.0/$height"

# find increment for use with xyz2grd
set ix = `echo ' scale=11; ' $xtotal / $nelx | bc `
set iz = `echo ' scale=11; ' $ztotal / $nelz | bc `

awk '{if(NR>2) print ($2,$3,$6) }' $1 > temp.xyz

set reg = "-R$xmin/$xmax/$zmin/$zmax"

surface temp.xyz -Gtemp.grd $reg -I5/5 

#grd2cpt temp.grd -Cgray -L0/1.1 -S0.0/1.1/0.1 -Z > temp.cpt
# color scale as in van Keken et al., 2008
#grd2cpt temp.grd -Cpolar -L0/1.1 -S0.0/1.1/0.1 -Z > temp.cpt
# more colorblind friendly color scale
grd2cpt temp.grd -C../graphics/vik.cpt -L0/1.1 -S0.0/1.1/0.1 -Z > temp.cpt

awk '{if(NR>2) print ($2,$3,$4) }' $1 > vx.xyz
awk '{if(NR>2) print ($2,$3,$5) }' $1 > vz.xyz

surface vx.xyz -Gvx.grd $reg -I$ix/$iz
surface vz.xyz -Gvz.grd $reg -I$ix/$iz

grdsample vx.grd -Gvx1.grd -I22/20 -r
grdsample vz.grd -Gvz1.grd -I22/20 -r

set arrows = "-S5. -Q0.1i+e+n0.25i -G0"

# for color
#pscontour temp.xyz $size -B50:"Distance ":/50:"Depth ":WSen $reg -Ctemp.cpt -X4.0c -Y6.0c -K -P -I > plot.ps

grdimage temp.grd $size $reg -Ctemp.cpt -B50:"Distance ":/50:"Depth ":WSen -P -K -X4.0c -Y6.0c > plot.ps

grdvector vx1.grd vz1.grd $size $reg $arrows -X0.0 -Y0.0 $opts >> plot.ps

psscale   -Ctemp.cpt -D3.0i/-0.75i/6.0i/0.3h -P -O >> plot.ps

\rm vx.xyz vz.xyz vx.grd vz.grd vx1.grd vz1.grd

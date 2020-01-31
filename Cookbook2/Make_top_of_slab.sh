#!/bin/bash -f
# Set for GMT version 5
gmtset FONT_TITLE 24 FONT_LABEL 18 PS_PAGE_ORIENTATION PORTRAIT PS_MEDIA letter PROJ_LENGTH_UNIT inch

split -4089 temp.unifA66x60
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Bxa25+l"Along Slab Distance (km)" -Bya50.0+l"Temperature (C)" -BWSen -Wred -K -X2.0i > tos.ps

split -4089 temp.unifB66x60
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wred,.  -K -O >> tos.ps

split -4089 temp.unifC66x60
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wred,- -K -O >> tos.ps

split -16095 temp.unifA132x120
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wgreen -O -K -X0.0i >> tos.ps

split -16095 temp.unifB132x120
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wgreen,. -O -K -X0.0i >> tos.ps

split -16095 temp.unifC132x120
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wgreen,- -O -K -X0.0i >> tos.ps

split -36021 temp.unifA198x180
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wblue -O -K >> tos.ps

split -36021 temp.unifB198x180
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wblue,. -O -K >> tos.ps

split -36021 temp.unifC198x180
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Wblue,- -O -K >> tos.ps

split -63867 temp.unifA264x240
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1/1 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Worange -O -K >> tos.ps

split -63867 temp.unifB264x240
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1/1 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Worange,. -O -K >> tos.ps

split -63867 temp.unifC264x240
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1/1 
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -Worange,- -O -K >> tos.ps

split -99633 temp.unifA330x300
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -O -K >> tos.ps
 
split -99633 temp.unifB330x300
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -O -K -Wblack,. >> tos.ps

split -99633 temp.unifC330x300
awk '{if(NR>2) print ($2,$3,$6) }' xab > temp.xyz
blockmean temp.xyz -R0/660/0/600 -I1.0/1.0 > tmp
surface tmp -Gtemp.grd -R0/660/0/600 -I1.0/1.0
grdtrack ../graphics/top-slab-plot.xy -Gtemp.grd > top-slab.xyT
awk '{print sqrt(($1-0)*($1-0)+(600-$2)*(600-$2)), 1300*$3}' top-slab.xyT > top-slab.lT
psxy top-slab.lT -R0/200/0/600 -JX5.0i -O -Wblack,- >> tos.ps

\rm -f temp.xyz temp.grd xaa xab top-slab-plot.xyT top-slab.lT top-slab.xyT tmp

#/bin/bash -f
#Make a LaTeX table for Benchmarks

#########################################
#      User Adjustable Parameters       #
#########################################
FILE=vanKeken08_table
LATEX='latex'
DVIPS='dvips'
export FILE LATEX DVIPS GHOST

#########################################
#    End User Adjustable Parameters     #
#########################################

TEXFILE=$FILE.tex
DVIFILE=$FILE.dvi
PSFILE=$FILE.ps
export TEXFILE DVIFILE PSFILE

/bin/rm -f $TEXFILE
echo '\documentclass[12pt]{article}' >> $TEXFILE
echo '\begin{document}' >> $TEXFILE
#########################################
#   van Keken et al, 2008 slab problem  #
#########################################
echo '\begin{table}' >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| l r c c c r |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Case} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Grid} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{$T_{11}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{$||T_{slab}||$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{$||T_{wedge}||$} &' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Time (sec)} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  split -4089 temp.unifA66x60
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifA66x60`
echo ' 1a & 66x60 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -16095 temp.unifA132x120
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifA132x120`
echo ' 1a & 132x120 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -36021 temp.unifA198x180
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifA198x180`
echo ' 1a & 198x180 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -63867 temp.unifA264x240
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifA264x240`
echo ' 1a & 264x240 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -99633 temp.unifA330x300
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifA330x300`
echo ' 1a & 330x300 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  split -4089 temp.unifB66x60
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifB66x60`
echo ' 1b & 66x60 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -16095 temp.unifB132x120
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifB132x120`
echo ' 1b & 132x120 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -36021 temp.unifB198x180
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifB198x180`
echo ' 1b & 198x180 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -63867 temp.unifB264x240
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifB264x240`
echo ' 1b & 264x240 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -99633 temp.unifB330x300
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifB330x300`
echo ' 1b & 330x300 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -4089 temp.unifC66x60
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifC66x60`
echo '\hline ' >> $TEXFILE
echo ' 1c & 66x60 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -16095 temp.unifC132x120
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifC132x120`
echo ' 1c & 132x120 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -36021 temp.unifC198x180
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifC198x180`
echo ' 1c & 198x180 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -63867 temp.unifC264x240
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifC264x240`
echo ' 1c & 264x240 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
  split -99633 temp.unifC330x300
  awk '{if(NR>2) print ($2,$3,1300*$6) }' xab > temp.xyz
  gmt blockmean temp.xyz -R0/660/0/600 -I10.0/10.0 > tmp
  gmt surface tmp -Gtemp.grd -R0/660/0/600 -I10.0/10.0
  t11=`gmt grdtrack ../graphics/t11.xy -Gtemp.grd | awk '{printf "%5.2f", $3}'`
  tos=`gmt grdtrack ../graphics/top-slab.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/36)}'`
  twedge=`gmt grdtrack ../graphics/wedge.xy -Gtemp.grd | awk '{s+=$3*$3} END {printf "%5.2f", sqrt(s/78)}'`
  time=`awk '$1=="total" {print $2}' out.unifC330x300`
echo ' 1c & 330x300 &' $t11 '&' $tos '&' $twedge '&' $time '\\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\end{table}' >> $TEXFILE

echo '\end{document}' >> $TEXFILE

#########################################
#   Run LaTeX and make Postscript file  #
#########################################
$LATEX $TEXFILE
$DVIPS $DVIFILE -o $PSFILE
open $PSFILE
\rm tmp temp.xyz temp.grd xaa xab

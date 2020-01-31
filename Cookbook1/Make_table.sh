# Make a LaTeX table for Benchmarks

#########################################
#      User Adjustable Parameters       #
#########################################
FILE=blankenbach
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
echo '\documentclass[11pt]{article}' >> $TEXFILE
echo '\begin{document}' >> $TEXFILE
#########################################
#   Rayleigh Number 10,000 Blankenbach  #
#########################################
echo '\begin{table}' >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| r c c c c c c r |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Grid} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{V$_{rms}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nusselt No.} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_R$} & ' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Time (sec)} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  vrms=`tail -1 tser.bm1a50 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1a50 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==54 {printf "%7.3f", $3}' geoid.bm1a50`
  geoidl=`awk 'NR==54 {printf "%5.3f", $5}' geoid.bm1a50`
  topor=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1a50`
  geoidr=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1a50`
  time=`awk '$1=="total" {print $2}' out.bm1a50`
  export vrms nu topol geoidl topor geoidr time
echo ' 50 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1a100 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1a100 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1a100`
  geoidl=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1a100`
  topor=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1a100`
  geoidr=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1a100`
  time=`awk '$1=="total" {print $2}' out.bm1a100`
  export vrms nu topol geoidl topor geoidr time
echo '100 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1a200 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1a200 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1a200`
  geoidl=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1a200`
  topor=`awk 'NR==404 {printf "%7.3f", $3}' geoid.bm1a200`
  geoidr=`awk 'NR==404 {printf "%5.3f", $5}' geoid.bm1a200`
  time=`awk '$1=="total" {print $2}' out.bm1a200`
  export vrms nu topol geoidl topor geoidr time
echo '200 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\dag C$_{ext}$ & 42.865 & 4.884 & 2254.021 & -2903.221 & 54.822 & -62.622 & \null \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\multicolumn{8}{|l|}{\dag Christensen$^{\prime}$s extrapolated values.} \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\caption{Blankenbach (1989) Benchmark 1a: Steady State, 2D, constant viscosity convection in a 1 by 1 box with Rayleigh number $10^4$ using ConMan} ' >> $TEXFILE
echo '\end{table}' >> $TEXFILE

#########################################
#  Rayleigh Number 100,000 Blankenbach  #
#########################################
echo '\begin{table}' >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| r c c c c c c r |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Grid} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{V$_{rms}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nusselt No.} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_R$} & ' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Time (sec)} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  vrms=`tail -1 tser.bm1b50 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1b50 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==54 {printf "%7.3f", $3}' geoid.bm1b50`
  geoidl=`awk 'NR==54 {printf "%5.3f", $5}' geoid.bm1b50`
  topor=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1b50`
  geoidr=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1b50`
  time=`awk '$1=="total" {print $2}' out.bm1b50`
  export vrms nu topol geoidl topor geoidr time
echo '50 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1b100 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1b100 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1b100`
  geoidl=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1b100`
  topor=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1b100`
  geoidr=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1b100`
  time=`awk '$1=="total" {print $2}' out.bm1b100`
  export vrms nu topol geoidl topor geoidr time
echo '100 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1b200 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1b200 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1b200`
  geoidl=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1b200`
  topor=`awk 'NR==404 {printf "%7.3f", $3}' geoid.bm1b200`
  geoidr=`awk 'NR==404 {printf "%5.3f", $5}' geoid.bm1b200`
  time=`awk '$1=="total" {print $2}' out.bm1b200`
  export vrms nu topol geoidl topor geoidr time
echo '200 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\dag C$_{ext}$ & 193.214 & 10.534 & 1460.986 & -2004.205 & 27.703 & -32.016 & \null \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\multicolumn{8}{|l|}{\dag Christensen$^{\prime}$s extrapolated values.} \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\caption{Blankenbach (1989) Benchmark 1b: Steady State, 2D, constant viscosity convection in a 1 by 1 box with Rayleigh number $10^5$ using ConMan} ' >> $TEXFILE
echo '\end{table}' >> $TEXFILE

#########################################
# Rayleigh Number 1,000,000 Blankenbach #
#########################################
echo '\begin{table}' >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| r c c c c c c r |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Grid} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{V$_{rms}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nusselt No.} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Time (sec)} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  vrms=`tail -1 tser.bm1c50 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1c50 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==54 {printf "%7.3f", $3}' geoid.bm1c50`
  geoidl=`awk 'NR==54 {printf "%5.3f", $5}' geoid.bm1c50`
  topor=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1c50`
  geoidr=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1c50`
  time=`awk '$1=="total" {print $2}' out.bm1c50`
  export vrms nu topol geoidl topor geoidr time
echo '50 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1c100 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1c100 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm1c100`
  geoidl=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm1c100`
  topor=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1c100`
  geoidr=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1c100`
  time=`awk '$1=="total" {print $2}' out.bm1c100`
  export vrms nu topol geoidl topor geoidr time
echo '100 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm1c200 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm1c200 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm1c200`
  geoidl=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm1c200`
  topor=`awk 'NR==404 {printf "%7.3f", $3}' geoid.bm1c200`
  geoidr=`awk 'NR==404 {printf "%5.3f", $5}' geoid.bm1c200`
  time=`awk '$1=="total" {print $2}' out.bm1c200`
  export vrms nu topol geoidl topor geoidr time
echo '200 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\dag C$_{ext}$ & 833.989 & 21.997 & 931.962 & -1283.813 & 13.452 & -15.034 & \null \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\multicolumn{8}{|l|}{\dag Christensen$^{\prime}$s extrapolated values.} \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\caption{Blankenbach (1989) Benchmark 1c: Steady State, 2D, constant viscosity convection in a 1 by 1 box with Rayleigh number $10^6$ using ConMan.} ' >> $TEXFILE
echo '\end{table}' >> $TEXFILE

#########################################
# Rayleigh Number 10,000 Blankenbach TD #
#########################################
echo '\begin{table}' >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| r c c c c c c r |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Grid} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{V$_{rms}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nusselt No.} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Topo$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_L$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Geoid$_R$} &' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Time (sec)} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
  vrms=`tail -1 tser.bm2a50 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm2a50 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==54 {printf "%7.3f", $3}' geoid.bm2a50`
  geoidl=`awk 'NR==54 {printf "%5.3f", $5}' geoid.bm2a50`
  topor=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm2a50`
  geoidr=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm2a50`
  time=`awk '$1=="total" {print $2}' out.bm2a50`
  export vrms nu topol geoidl topor geoidr time
echo '50 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm2a100 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm2a100 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==104 {printf "%7.3f", $3}' geoid.bm2a100`
  geoidl=`awk 'NR==104 {printf "%5.3f", $5}' geoid.bm2a100`
  topor=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm2a100`
  geoidr=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm2a100`
  time=`awk '$1=="total" {print $2}' out.bm2a100`
  export vrms nu topol geoidl topor geoidr time
echo '100 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
  vrms=`tail -1 tser.bm2a200 | awk '{printf "%5.3f", $3}'`
  nu=`tail -1 tser.bm2a200 | awk '{printf "%5.3f", $2}'`
  topol=`awk 'NR==204 {printf "%7.3f", $3}' geoid.bm2a200`
  geoidl=`awk 'NR==204 {printf "%5.3f", $5}' geoid.bm2a200`
  topor=`awk 'NR==404 {printf "%7.3f", $3}' geoid.bm2a200`
  geoidr=`awk 'NR==404 {printf "%5.3f", $5}' geoid.bm2a200`
  time=`awk '$1=="total" {print $2}' out.bm2a200`
  export vrms nu topol geoidl topor geoidr time
echo '200 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
#  vrms=`tail -1 tser.bm2a400 | awk '{printf "%5.3f", $3}'`
#  nu=`tail -1 tser.bm2a400 | awk '{printf "%5.3f", $2}'`
#  topol=`awk 'NR==404 {printf "%7.3f", $3}' geoid.bm2a400`
#  geoidl=`awk 'NR==404 {printf "%5.3f", $5}' geoid.bm2a400`
#  topor=`awk 'NR==804 {printf "%7.3f", $3}' geoid.bm2a400`
#  geoidr=`awk 'NR==804 {printf "%5.3f", $5}' geoid.bm2a400`
#  time=`awk '$1=="total" {print $2}' out.bm2a400`
#  export vrms nu topol geoidl topor geoidr time
#echo '400 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
#  vrms=`tail -1 tser.bm2a600 | awk '{printf "%5.3f", $3}'`
#  nu=`tail -1 tser.bm2a600 | awk '{printf "%5.3f", $2}'`
#  topol=`awk 'NR==604 {printf "%7.3f", $3}' geoid.bm2a600`
#  geoidl=`awk 'NR==604 {printf "%5.3f", $5}' geoid.bm2a600`
#  topor=`awk 'NR==1204 {printf "%7.3f", $3}' geoid.bm2a600`
#  geoidr=`awk 'NR==1204 {printf "%5.3f", $5}' geoid.bm2a600`
#  time=`awk '$1=="total" {print $2}' out.bm2a600`
#  export vrms nu topol geoidl topor geoidr time
#echo '600 &' $vrms '&' $nu '&' $topol '&' $topor '&' $geoidl '&' $geoidr '&' $time '\\' >> $TEXFILE
#echo '\hline ' >> $TEXFILE
echo '\dag C$_{ext}$ & 480.433 & 10.066 & 1010.925 & -4098.073 & 17.343 & -54.598 & \null \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\multicolumn{8}{|l|}{\dag Christensen$^{\prime}$s extrapolated values.} \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\caption{Blankenbach (1989) Benchmark 2a: Steady State, 2D, temperature-dependent viscosity convection (b=6.907755279) in a 1 by 1 box with Rayleigh number $10^4$ using ConMan.} ' >> $TEXFILE
echo '\end{table}' >> $TEXFILE


echo '\end{document}' >> $TEXFILE

#########################################
#   Run LaTeX and make Postscript file  #
#########################################
$LATEX $TEXFILE
$DVIPS $DVIFILE -o $PSFILE
open $PSFILE

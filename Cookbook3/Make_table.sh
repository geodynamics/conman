# Make a LaTeX table for Benchmarks

#########################################
#      User Adjustable Parameters       #
#########################################
FILE=kingetal2010
LATEX='latex'
DVIPS='dvips'
export FILE LATEX DVIPS 

#########################################
#    End User Adjustable Parameters     #
#########################################

TEXFILE=$FILE.tex
DVIFILE=$FILE.dvi
PSFILE=$FILE.ps
export TEXFILE DVIFILE PSFILE

/bin/rm -f $TEXFILE
echo '\documentclass[10pt]{article}' >> $TEXFILE
echo '\begin{document}' >> $TEXFILE

export machine=`cat log_machine`
export time=`cat log_Date`
export compiler=`awk '$1=="FC" {print $3}' ../src/Makefile `
export flags=`awk '$1=="FFLAGS" {print $3}' ../src/Makefile `
echo '\noindent\bf' >> $TEXFILE
echo 'Testing results from ConMan on ' $machine 'on ' $time '.' >> $TEXFILE
echo 'Using compiler ' $compiler 'with compiler flags ' $flags. >> $TEXFILE

#########################################
#   1x1 Box Blankenbach                 #
#########################################

echo '\begin{table}'[h] >> $TEXFILE
echo '\centering' >> $TEXFILE
echo '\begin{tabular} {| r c c c c c |} \hline ' >> $TEXFILE
echo '\multicolumn{1}{| c }{Problem} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{V$_{rms}$} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nu Bot} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{Nu Top} &' >> $TEXFILE
echo '\multicolumn{1}{ c }{ave T} &' >> $TEXFILE
echo '\multicolumn{1}{ c |}{Vsurf} \\ ' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ba_const_visc_ra1e4_explicit/test_dir 
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf time
cd ../..
echo 'Blankenbach 1a explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ba_const_visc_ra1e4_picard/test_dir 
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf time
cd ../..
echo 'Blankenbach 1a Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 42.900 & - & 4.890 & 0.500 & 41.400 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ba_const_visc_ra1e5_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf time
cd ../..
echo 'Blankenbach 1b explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ba_const_visc_ra1e5_picard/test_dir 
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf time
cd ../..
echo 'Blankenbach 1b picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 195.080 & - & 10.540 & 0.500 & 198.280 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ba_const_visc_ra1e6_explicit/test_dir 
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf time
cd ../..
echo 'Blankenbach 1c explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ba_const_visc_ra1e6_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'Blankenbach 1c picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 838.024 & - & 22.020 & 0.500 & 884.520 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ba_tdep_visc_ra1e4_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'Blankenbach 2a explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ba_tdep_visc_ra1e4_picard/test_dir 
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'Blankenbach 2a Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & - & - & - & -  & - \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_eba_const_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA cv Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_eba_const_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA cv Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 38.476 & - & 4.097 & 0.491  & 36.598 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_eba_const_visc_ra1e4_di10_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA cv Di=1.0 explicit  &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_eba_const_visc_ra1e4_di10_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA cv Di=1.0 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 24.232 & - & 2.194 & 0.467  & 22.243 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_eba_tdep_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA td Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_eba_tdep_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'EBA td Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & - & - & - & -  & - \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_tala_const_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA cv Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_tala_const_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA cv Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 40.200 & - & 4.430 & 0.513 & 39.300 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_tala_const_visc_ra1e4_di10_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA cv Di=1.0 explicit  &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_tala_const_visc_ra1e4_di10_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA cv Di=1.0 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 26.100 & - & 2.570 & 0.509  & 26.400 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_tala_tdep_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA td Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_tala_tdep_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'TALA td Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & - & - & - & -  & - \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ala_const_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA cv Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ala_const_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA cv Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 40.095 & - & 4.414 & 0.515 & 38.837 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ala_const_visc_ra1e4_di10_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA cv Di=1.0 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ala_const_visc_ra1e4_di10_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA cv Di=1.0 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 25.016 & - & 2.472 & 0.510  & 24.401 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
cd test_ala_tdep_visc_ra1e4_di025_explicit/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA td Di=0.25 explicit &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
cd test_ala_tdep_visc_ra1e4_di025_picard/test_dir
  vrms=`tail -1 ts.test | awk '{printf "%5.3f", $3}'`
  nus=`tail -1 ts.test | awk '{printf "%5.3f", $1}'`
  nub=`tail -1 ts.test | awk '{printf "%5.3f", $2}'`
  tbar=`tail -1 ts.test | awk '{printf "%5.3f", $7}'`
  vsurf=`tail -1 ts.test | awk '{printf "%5.3f", $5}'`
  time=`awk '$1=="total" {print $2}' out.test `
  export vrms nus nub tbar vsurf 
cd ../..
echo 'ALA td Di=0.25 Picard &' $vrms '&' $nus '&' $nub '&' $tbar '&' $vsurf '\\' >> $TEXFILE
echo 'King et al. [2010] & 381.690 & - & 7.710 & 0.707  & 81.090 \\' >> $TEXFILE
echo '\hline ' >> $TEXFILE
echo '\end{tabular}' >> $TEXFILE
echo '\caption{Steady State, 2D, constant-viscosity convection in a 1 by 1 box Blankenbach benchmarks} ' >> $TEXFILE
echo '\end{table}' >> $TEXFILE

echo '\end{document}' >> $TEXFILE

#########################################
#   Run LaTeX and make Postscript file  #
#########################################
$LATEX $TEXFILE
$DVIPS $DVIFILE -o $PSFILE


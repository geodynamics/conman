#!/bin/csh -f
date > log_Date
uname -n       > log_machine
echo 'warning: this script will run ~12 hours'
foreach dir (test_* )
   cd $dir
   echo Running test problem:  $dir
   cd test_dir
   \rm -f *
   cp ../in* ../geom.* ../runfile ../r.testi .
   ls -l ../../../conman > log_bin
   (time ../../../conman < runfile > stdout) >& log_time
   cd ..
   cd ..
end
#


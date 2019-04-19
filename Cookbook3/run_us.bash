#!/bin/bash -f
cd $1
  echo Running test problem:  $1
  cd test_dir
    rm -f *
    cp ../in.test ../geom.test ../runfile ../r.testi .
    (time ../../../conman < runfile > stdout) >& log_time
  cd ..
cd ..
#


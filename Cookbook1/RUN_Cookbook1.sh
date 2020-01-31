#/bin/bash -f
# Cookbook 1 run script
#
echo 'please be patient, running 50x50 Blankenbach 1989 constant viscosity calculations'
echo 'estimated completion time: 10 seconds'
../conman < run.bm1a50
../conman < run.bm1b50
../conman < run.bm1c50
# 
echo 'please be patient, running 100x100 Blankenbach 1989 constant viscosity calculations'
echo 'estimated completion time: 30 seconds'
../conman < run.bm1a100
../conman < run.bm1b100
../conman < run.bm1c100
#
echo 'please be patient, running 200x200 Blankenbach 1989 constant viscosity calculations'
echo 'estimated completion time: 5 minutes'
../conman < run.bm1a200
../conman < run.bm1b200
../conman < run.bm1c200
#
echo 'please be really patient, running 200x200 Blankenbach 1989 temperature-dependent calculations'
echo 'estimated completion time: 50 minutes'
../conman < run.bm2a50
../conman < run.bm2a100
../conman < run.bm2a200
# these take a long, long time (11 hours and 120 hours)
#../conman < run.bm2a400
#../conman < run.bm2a600

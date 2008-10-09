#!/usr/bin/env python

import conman_vtk as conman


def main():
    
    numsteps = 100          # number of steps in model
    nelx = 256              # number of elements in x1 direction
    nelz = 64               # number of elements in x2 direction

    nx = nelx + 1
    nz = nelz + 1
    numlines = nx*nz + 2    # account for the two header lines on each step

    filename = 'temp'       # name of conman temperature output file
    conman.splitfile(filename, numsteps, numlines)

    for i in xrange(numsteps):
        print 'Writing %d-th file' % i
        conman.write_vtk(infile='temp_%03d' % i, outfile='cover_%03d.vtk' % i)
    return 0

if __name__ == '__main__':
    main()


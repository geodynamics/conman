#!/usr/bin/env python

import conman_vtk as conman


def main():
    
    numsteps = 100
    nelx = 256
    nelz = 64

    nx = nelx + 1
    nz = nelz + 1
    numlines = nx*nz + 2

    filename = 'temp'
    conman.splitfile(filename, numsteps, numlines)
    for i in xrange(numsteps):
        print 'Writing %d-th file' % i
        conman.write_vtk(infile='temp_%03d' % i, outfile='cover_%03d.vtk' % i)
    return 0

if __name__ == '__main__':
    main()


#!/usr/bin/env python

from __future__ import with_statement

import numpy
import pyvtk


def parse_header(line):
    params = line.split()
    (nsd, nex, ney, nno, t) = [int(p) for p in params[0:5]]
    num = float(params[5])
    return (nsd, nex, ney, nno, t, num)

def read_temp(filename):
    
    with open(filename, 'r') as fp:
        
        line = fp.readline()
        nsd,nex,ney,nno,t,num = parse_header(line)

        var_names = fp.readline()
        
        coords = numpy.zeros((nno,3))
        connect = (nex,ney)
        nodemap = numpy.zeros((nno,1), dtype=int)
        velocity = numpy.zeros((nno,3))
        temperature = numpy.zeros((nno,1))

        for i in xrange(nno):
            line = fp.readline()
            params = line.split()
            n = int(params[0])
            x1 = float(params[1])
            x2 = float(params[2])
            v1 = float(params[3])
            v2 = float(params[4])
            T = float(params[5])
            nodemap[i] = n
            coords[i] = (x1,x2,0)
            velocity[i] = (v1,v2,0)
            temperature[i] = T

    return {'coords': coords,
            'connect': connect,
            'velocity': velocity,
            'temperature': temperature,
            'nodemap': nodemap}

def read_stress(filename):

    with open(filename,'r') as fp:

        line = fp.readline()
        nsd, nex, ney, nno, t, num = parse_header(line)

        var_names = fp.readline()

        coords = numpy.zeros((nno,3))
        connect = (nex,ney)
        stress = numpy.zeros((nno,5))
        pressure = numpy.zeros((nno,1))

        for i in xrange(nno):
            line = fp.readline()
            params = line.split()
            n = int(params[0])
            x1 = float(params[1])
            x2 = float(params[2])
            t1 = float(params[3])
            t2 = float(params[4])
            t3 = float(params[5])
            t4 = float(params[6])
            t5 = float(params[7])
            p = float(params[8])
            coords[i] = (x1,x2,0)
            stress[i] = (t1,t2,t3,t4,t5)
            pressure[i] = p

    return {'coords': coords,
            'connect': connect,
            'stress': stress,
            'pressure': pressure}

def make_grid(coords, connect, **kw):
    grid = None
    gridtype = kw.get('gridtype', 'unstructured')
    if gridtype == 'unstructured':
        (nex, ney) = connect
        (nx, ny) = (nex+1, ney+1)
        conn = numpy.zeros((nex*ney,4), dtype=int)
        def node(i,j):
            return ny * i + j
        for i in xrange(nex):
            for j in xrange(ney):
                e = (ney)*i + j
                n1 = node(i,j)
                n2 = node(i+1, j)
                n3 = node(i+1, j+1)
                n4 = node(i, j+1)
                conn[e] = (n1,n2,n3,n4)
        grid = pyvtk.UnstructuredGrid(coords, quad=conn)
    else:
        raise Exception('Unknown grid type')
    return grid

def make_scalar(array, name=None):
    return pyvtk.Scalars(array, name, lookup_table='default')

def make_vector(array, name=None):
    return pyvtk.Vectors(array, name)

def make_tensor(array, name=None):
    return pyvtk.Tensors(array, name)

def make_vtk(**kwargs):
    args = []
    if 'grid' in kwargs:
        args.append(kwargs.get('grid'))
    if 'point_data' in kwargs:
        data = kwargs['point_data']
        args.append(pyvtk.PointData(*data))
    if 'cell_data' in kwargs:
        data = kwargs['cell_data']
        args.append(pyvtk.CellData(*data))
    if 'header' in kwargs:
        args.append(kwargs.get('header'))
    return pyvtk.VtkData(*args)


#!/usr/bin/env python

import sys
sys.path.insert(1,'../visual')
import conman_reader

tfile = 'temp.bb1a50'

tinfo = conman_reader.read_temp(tfile)

coords = tinfo['coords']
connect = tinfo['connect']
velocity = tinfo['velocity']
temperature = tinfo['temperature']

vtk = conman_reader.make_vtk(
        header='vtk header',
        grid=conman_reader.make_grid(coords,connect,gridtype='unstructured'),
        point_data=[conman_reader.make_scalar(temperature, 'temperature'),
                    conman_reader.make_vector(velocity, 'velocity'),
                   ]
        )

vtk.tofile('foo.vtk')

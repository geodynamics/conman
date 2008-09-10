#!/usr/bin/env python

import conman_reader

filename = 'temp'
info = conman_reader.read_temp(filename)

coords = info['coords']
connect = info['connect']
velocity = info['velocity']
temperature = info['temperature']

vtk = conman_reader.make_vtk(
        header='vtk header',
        grid=conman_reader.make_grid(coords, connect, gridtype='unstructured'),
        point_data=[conman.make_scalar(temperature, 'temperature'),
                    conman.make_vector(velocity, 'velocity')
                   ]
        )

vtk.tofile('cover.vtk')


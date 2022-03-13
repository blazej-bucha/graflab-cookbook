# Description

GrafLab and isGrafLab cookbooks.


Provided are HOWTOs, showing basic and advanced applications using the command
line.  The cookbooks are centered around gravity field modelling, but included
are several tricks to exploit the routines beyond their original intention
(planetary topographies, etc.).


The HOWTOs are ordinary MATLAB scripts.  Attached is the `./src/compile_doc.m`
script to convert the m-files to Live Scripts, PDF and HTML documentation if
this is what you prefer.  The outputs are saved to the `./doc` directory.  The
current version of the compiled cookbook is also available online at
[https://blazejbucha.com/graflab/doc](https://blazejbucha.com/graflab/doc).


[GrafLab](https://blazejbucha.com/#GrafLab) (GRAvity Field LABoratory) is
a MATLAB-based routine to compute gravity field quantities up to high degrees
(tens of thousands and beyond) from spherical harmonic gravity models.
Computed can be, for instance, the geoid, the height anomaly, gravity
anomalies/disturbances, deflections of the vertical or the gravitational
tensors.


[isGrafLab](https://blazejbucha.com/#isGrafLab) (Irregular Surface GRAvity
Field LABorary) is a modified version of GrafLab that efficiently computes
gravity field quantities at dense grids residing on irregular surfaces, such as
the Earth's surface.


# HOWTOs

Each HOWTO has its own source code.  Beginners should go through the HOWTOs in
the order they are numbered.  Advanced users may pick whatever HOWTO they are
interested in.  In any case, you **must** start by executing the `init.m`
script from the `src` directory.  It downloads the source codes of GrafLab and
isGrafLab and some input data.


## GrafLab

If you are not familiar with the GrafLab command line interface, you may want
to go [here](doc/graflab.md), learn the interface at first and then return
back.

* [g01](src/howto_g01.m): Synthesis at grids and at scattered points

* [g02](src/howto_g02.m): Gravitational field models

* [g03](src/howto_g03.m): Minimum and maximum harmonic degree of the
  synthesis

* [g04](src/howto_g04.m): Methods to compute the Legendre functions

* [g05](src/howto_g05.m): Plotting in GrafLab and the output variable

* [g06](src/howto_g06.m): Synthesis of planetary topographies

* [g07](src/howto_g07.m): Stop the Earth's rotation to get gravitational
  quantities

* [g08](src/howto_g08.m): Grids with varying spacings in latitudes and
  longitudes

* [g09](src/howto_g09.m): Exploit the symmetry of Legendre functions

* [g10](src/howto_g10.m): Commission error

* [g11](src/howto_g11.m): A trick with the minimum and the maximum degree of
  the synthesis



## isGrafLab

If you are not familiar with the isGrafLab command line interface, you may want
to go [here](doc/isgraflab.md), learn the interface at first and then return
back.

* [i01](src/howto_i01.m): Synthesis at grids residing on the Earth's topography
  in spherical coordinates

* [i02](src/howto_i02.m): Synthesis at grids residing on the Earth's topography
  in ellipsoidal coordinates




# Contributing

Contributions of any kind are welcome!






# Contact

Feel free to contact the author, Blazej Bucha, at blazej.bucha@stuba.sk.






# Citing

GrafLab

* Bucha, B., Janák, J., 2013.  A MATLAB-based graphical user interface program
  for computing functionals of the geopotential up to ultra-high degrees and
  orders.  Computers & Geosciences 56, 186-196,
  [https://doi.org/10.1016/j.cageo.2013.03.012](https://doi.org/10.1016/j.cageo.2013.03.012)

isGrafLab

* Bucha, B., Janák, J., 2014.  A MATLAB-based graphical user interface program
  for computing functionals of the geopotential up to ultra-high degrees and
  orders: Efficient computation at irregular surfaces.  Computers & Geosciences
  66, 219-227,
  [https://doi.org/10.1016/j.cageo.2014.02.005](https://doi.org/10.1016/j.cageo.2014.02.005)

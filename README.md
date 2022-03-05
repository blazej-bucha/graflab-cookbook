# Description

GrafLab and isGrafLab cookbooks.

Provided are HOWTOs, showing basic and advanced applications using the command 
line.  The cookbooks are centered around gravity field modelling, but included 
are several tricks to exploit the routines beyond their original intention 
(planetary topographies, etc.).

[GrafLab](https://blazejbucha.com/#GrafLab) (GRAvity Field LABoratory) is 
a MATLAB-based routine to compute gravity field quantities up to high degrees 
(tens of thousands and beyond) from spherical harmonic gravity models. Computed 
can be, for instance, the geoid, the height anomaly, gravity 
anomalies/disturbances, deflections of the vertical or the gravitational 
tensors.


[isGrafLab](https://blazejbucha.com/#isGrafLab) (Irregular Surface GRAvity 
Field LABorary) is a modified version of GrafLab that efficiently computes 
gravity field quantities at dense grids residing on irregular surfaces, such as 
the Earth's surface.






# HOWTOs

For beginners, it is recommended to go through the HOWTOs in the order they are 
numbered.  Advanced users may pick whatever HOWTO they are interested in.  In 
any case, you **must** start by executing the `init.m` script from the `src` 
directory.  The `init.m` script downloads all the source codes and the input 
data files needed to run the HOWTO scripts.

## GrafLab

If you are not familiar with the GrafLab command line interface, you may want 
to go [here](doc/graflab.md), learn the interface at first and then return 
back.

### Basics

* [01](src/howto01.m): Synthesis at grids and at scattered points

* [02](src/howto02.m): Minimum and maximum harmonic degree of the synthesis

* [03](src/howto03.m): Gravitational field models

* [04](src/howto04.m): Reference ellipsoid and normal gravity field

* [05](src/howto05.m): Spherical vs. ellipsoidal coordinates of the 
  computation points

* [06](src/howto06.m): Methods to compute the fully-normalized associated 
  Legendre functions

* [07](src/howto07.m): Outputs from GrafLab


### Advanced

* [08](src/howto08.m): Synthesis of other functions than gravity field 
  quantities, e.g. planetary topographies

* [09](src/howto09.m): Synthesis of gravity fields implied by celestial bodies

* [10](src/howto10.m): Synthesis with a custom reference ellipsoid

* [11](src/howto11.m): Grids with varying spacings in latitudes and longitudes

* [12](src/howto12.m): Stop the Earth's rotation to get gravitational 
  quantities instead of the gravity quantities

* [13](src/howto13.m): Exploit the symmetry of Legendre functions with respect 
  to the equator to improve the computational speed

* [14](src/howto14.m): Commission error



## isGrafLab

If you are not familiar with the isGrafLab command line interface, you may want 
to go [here](doc/isgraflab.md), learn the interface at first and then return 
back.

* [15](src/howto15.m): Synthesis at grids residing on the Earth's topography 
  in spherical coordinates

* [16](src/howto16.m): Synthesis at grids residing on the Earth's topography 
  in ellipsoidal coordinates




# Contributing

Contributions of any kind are welcome!






# Contact

Feel free to contact the author, Blazej Bucha, at blazej.bucha@stuba.sk.






# Citing

GrafLab

* Bucha, B., Janák, J., 2013. A MATLAB-based graphical user interface program 
  for computing functionals of the geopotential up to ultra-high degrees and 
  orders. Computers & Geosciences 56, 186-196, 
  [https://doi.org/10.1016/j.cageo.2013.03.012](https://doi.org/10.1016/j.cageo.2013.03.012)

isGrafLab

* Bucha, B., Janák, J., 2014. A MATLAB-based graphical user interface program 
  for computing functionals of the geopotential up to ultra-high degrees and 
  orders: Efficient computation at irregular surfaces. Computers & Geosciences 
  66, 219-227, 
  [https://doi.org/10.1016/j.cageo.2014.02.005](https://doi.org/10.1016/j.cageo.2014.02.005)

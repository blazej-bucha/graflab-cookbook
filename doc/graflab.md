# GrafLab Command Line Interface

Function prototype for GrafLab:

```
function out = GrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_path, ...
    crd, ...
    point_type, ...
    lat_grd_min, ...
    lat_grd_step, ...
    lat_grd_max, ...
    lon_grd_min, ...
    lon_grd_step, ...
    lon_grd_max, ...
    h_grd, ...
    sctr_points_path, ...
    lat_sctr, ...
    lon_sctr, ...
    h_sctr, ...
    out_path, ...
    quantity_or_error, ...
    quantity, ...
    fnALFs, ...
    DTM_path, ...
    export_data_txt, ...
    export_report, ...
    export_data_mat, ...
    display_data, ...
    graphic_format, ...
    colormap, ...
    number_of_colors, ...
    dpi, ...
    status_bar)
```

Throughout the HOWTOs, we keep the same names of these input parameters, so 
let's explain them:

* `GM` -- Geocentric gravitational constant of GGM (`m^3 * s^-2`)

* `R` -- Radius of the reference sphere of the GGM (`m`)

* `nmin` -- Minimum degree of the synthesis

* `nmax` -- Maximum degree of the synthesis

* `ellipsoid` -- Reference ellipsoid

  * scalar `1` for GRS80 or `2` for WGS84

  * vector with `5` elements: `[GM a e C20 omega]`, where

    * `GM` is the geocentric gravitational constant (`m^3 * s^-2`)

    * `a` is the semimajor axis (`m`)

    * `e` is the first numerical eccentricity

    * `C20` is the *fully-normalized* spherical harmonic coefficients of degree 
      `2` and order `0`

    * `omega` is the angular velocity (`rad * s^-1`)

* `GGM_path` -- Path to a

  * GGM file if `quantity_or_error == 0` (see below) or

  * file with the covariance matrix of spherical harmonic coefficients if 
    `quantity_or_error == 1`

* `crd` -- Type of the coordinates of evaluation points

  * `0` -- ellipsoidal

  * `1` -- spherical

* `point_type` -- Organization of evaluation points

  * `0` -- grid

  * `1` -- scattered points to be loaded from a file

  * `2` -- scattered points to be manually defined

The following variables are relevant only if `point_type == 0`. If `point_type 
~= 0`, set all these variables to `[]`. A grid can be defined in two ways, `A` 
and `B`. A mix of the two is not allowed. The content of the variables depends 
on the grid type.

* `lat_grd_min`

  * `A` -- Minimum grid latitude in degrees (a scalar)

  * `B` -- Vector defining grid latitudes in degrees

* `lat_grd_step`

  * `A` -- Grid step in the latitudinal direction (a scalar)

  * `B` -- String `'empty'`

* `lat_grd_max`

  * `A` -- Maximum grid latitude in degrees (a scalar)

  * `B` -- String `'empty'`

* `lon_grd_min`

  * `A` -- Minimum grid longitude in degrees (a scalar)

  * `B` -- Vector defining grid longitudes in degrees

* `lon_grd_step`

  * `A` -- Grid step in the longitudinal direction (a scalar)

  * `B` -- String `'empty'`

* `lon_grd_max`

  * `A` -- Maximum grid longitude in degrees (a scalar)

  * `B` -- String `'empty'`

* `h_grd` -- Grid height above the reference surface in metres (a scalar).

  * If `crd == 0` (ellipsoidal coordinates), `h` is the ellipsoidal height 
    above the reference ellipsoid (defined by `ellipsoid`)

  * If `crd == 1` (spherical coordinates), `h` represents the height above the 
    reference sphere defined by the radius `R` (see above); the height is 
    measured in the radial direction

The following variable is relevant only if `point_type == 1`. If `point_type ~= 
1`, set all these variables to `[]`.

* `sctr_points_path` -- Path to the scattered points file

The following variables are relevant only if `point_type == 2`. If `point_type 
~= 2`, set all these variables to `[]`.

* `lat_sctr` -- Latitudes in degrees as a column vector or a scalar

* `lon_sctr` -- Longitudes in degrees as a column vector or a scalar

* `h_sctr`

  * If `crd == 0`, ellipsoidal heights in metres as a column vector or a scalar

  * If `crd == 1`, spherical radii in metres as a column vector or a scalar

The variables that follow no longer depend on `point_type`, so must be 
specified for any computation.

* `out_path` -- Path to the output data file (*without* any suffix such as 
  `txt` or `mat`)

* `quantity_or_error`

  * `0` -- Computed will be a gravity field quantity from a GGM

  * `1` -- Computed will be a commission error from a covariance matrix

* `quantity` -- A scalar or a column vector defining quantities to be 
  computed. If it is a vector, the maximum size allowed is `4`. The following 
  values are accepted:

  * 2  -- Deflection of the vertical `eta` (the east--west component)

  * 3  -- Deflection of the vertical `xi` (the north--south component)

  * 4  -- Deflection of the vertical `Theta` (total)

  * 5  -- Disturbing potential

  * 6  -- Disturbing tensor (`Trr`, `Tphiphi`, `Tlambdalambda`)

  * 7  -- Disturbing tensor (`Trphi`, `Trlambda`, `Tphilambda`)

  * 8  -- Disturbing tensor in the local north-oriented reference frame (`Txx`, 
    `Tyy`, `Tzz`)

  * 9  -- Disturbing tensor in the local north-oriented reference frame (`Txy`, 
    `Txz`, `Tyz`)

  * 10 -- Geoid undulation

  * 11 -- Gravitational potential

  * 12 -- Gravitational tensor (`Vrr`, `Vphiphi`, `Vlambdalambda`)

  * 13 -- Gravitational tensor (`Vrphi`, `Vrlambda`, `Vphilambda`)

  * 14 -- Gravitational tensor in the local north-oriented reference frame 
    (`Vxx`, `Vyy`, `Vzz`)

  * 15 -- Gravitational tensor in the local north-oriented reference frame 
    (`Vxy`, `Vxz`, `Vyz`)

  * 16 -- Gravity vector in the local north-oriented reference frame (`gX`, 
    `gY`, `gZ`)

  * 17 -- Gravity in spherical approximation (magnitude of the gravity vector 
    in spherical approximation)

  * 18 -- Gravity potential

  * 19 -- Gravity anomaly in spherical approximation

  * 20 -- Gravity disturbance (difference between magnitudes of the gravity 
    vector and of the normal gravity vector)

  * 21 -- Gravity disturbance in spherical approximation

  * 22 -- Height anomaly ell (approximation of height anomaly or geoid)

  * 23 -- Height anomaly

  * 24 -- Second radial derivative of disturbing potential

  * 25 -- Second radial derivative of gravity potential

  The definition of each quantity can be found at 
  [https://blazejbucha.com/graflab/Definition_of_functionals_of_the_geopotential_used_in_GrafLab_software.pdf](https://blazejbucha.com/graflab/Definition_of_functionals_of_the_geopotential_used_in_GrafLab_software.pdf).


* `fnALFs` -- Method to compute the fully-normalized associated Legendre 
  functions

  * `1` -- Standard forward column method

  * `2` -- Modified forward column method

  * `3` -- Extended-range arithmetic

* `DTM_path` -- Path to a spherical harmonic coefficients file of a digital 
  elevation model. This variable is used only if `quantity == 10` or `quantity 
  == 23`. Otherwise, set this variable to `[]`.

* `export_data_txt` -- Export data to a text file, `0` for no, `1` for yes

* `export_report` -- Export a report, `0` for no, `1` for yes

* `export_data_mat` -- Export data to a `mat` file, `0` for no, `1` for yes

* `display_data` -- Display data. This is option can be used only if 
  `point_type == 0` (grid-wise computation)

  * `0` -- No

  * `1` -- Yes and use the Mapping Toolbox to plot the data (may be painfully 
    slow)

  * `2` -- Yes and use the `imagesc` function (not as nice as with `1`, but the 
    plotting is very fast)

The following variables are used only if `display_data == 1`. Otherwise, set 
these variables to `[]`.

* `graphic_format` -- Graphic file format

   * `1` -- bmp

   * `2` -- emf

   * `3` -- eps

   * `4` -- jpeg

   * `5` -- pdf

   * `6` -- png

   * `7` -- tiff

* `colormap`

  * `1` -- jet

  * `2` -- hsv

  * `3` -- hot

  * `4` -- cool

  * `5` -- spring

  * `6` -- summer

  * `7` -- autumn

  * `8` -- winter

  * `9` -- gray

  * `10` -- bone

  * `11` -- copper

  * `12` -- pink

  * `13` -- lines

* `number_of_colors` -- Number of the colors to split `colormap`

* `dpi` -- I am sure you got this one

The following variable no longer depend on `display_data` and needs to be 
specified.

* `status_bar` -- Display a kind of a progress bar, `0` for no, `1` for yes


  
  


You should now be ready to return [back](../README.md) and go through the 
HOWTOs.

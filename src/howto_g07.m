%% HOWTO g07: Stop the rotation to get gravitational quantities
%
% You will learn how to stop the Earth's rotation in order to compute, for
% instance, the _gravitational_ vector instead of the _gravity_ vector (no
% centrifugal force).
%
% All the GrafLab input parameters are explained in <../doc/graflab.md
% ../doc/graflab.md>.


clear; clc; init_checker();


%% Synthesis of the gravitational vector (no centrifugal force)
%
% At first, let's do the synthesis of the gravitational vector in _spherical_
% coordinates ("crd = 1").
%
% To stop the Earth's rotation, you have to set the angular velocity of the
% ellipsoid to zero (see the "ellipsoid" variable in <../doc/graflab.md
% ../doc/graflab.md>).  This is because, GGMs do not have their own value of
% the angular velocity, so it is usually taken from the definition parameters
% of the reference ellipsoid.  In fact, all elements of the "ellipsoid" array
% can safely be set to zero as long as you work with spherical coordinates of
% evaluation points.
%
% Define the GrafLab input parameters
GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 0;
nmax              = 360;
ellipsoid         = [0.0 0.0 0.0 0.0 0.0];  % Make all parameters of the
                                            % reference ellipsoid zero.
GGM_path          = '../data/input/EGM96.mat';
crd               = 1;  % Spherical coordinates
point_type        = 0;
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      = lat_grd_step;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto-g07-gravitational-vector-sph-crd';
quantity_or_error = 0;
quantity          = 16;  % Gravity vector; in this case, however,
                         % gravitational vector
fnALFs            = 1;
export_data_txt   = 1;
export_report     = 1;
export_data_mat   = 1;
display_data      = 2;
graphic_format    = 6;
colormap          = 1;
number_of_colors  = 60;
dpi               = 300;
status_bar        = 1;


%%
%
% Do the synthesis
GrafLab('OK', ...
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
    [], ...
    [], ...
    [], ...
    [], ...
    out_path, ...
    quantity_or_error, ...
    quantity, ...
    fnALFs, ...
    [], ...
    export_data_txt, ...
    export_report, ...
    export_data_mat, ...
    display_data, ...
    graphic_format, ...
    colormap, ...
    number_of_colors, ...
    dpi, ...
    status_bar);


%%
%
% Now, let's do the synthesis of the gravitational vector in _ellipsoidal_
% coordinates ("crd = 0").
%
% Again, you have to set the angular velocity of the ellipsoid to zero.  This
% time, however, two elements of the "ellipsoid" array are needed, the
% semimajor axis and the numerical eccentricity.  This is because the
% ellipsoidal coordinates of the evaluation points have to be transformed into
% spherical coordinates.  The latter coordinates are required for spherical
% harmonic synthesis.  To do the coordinates transformation, you need set the
% semimajor axis and the numerical eccentricity to values of the ellipsoid you
% want to use (e.g., GRS80, WGS84 and so on).
%
% Define the GrafLab input parameters.
GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 0;
nmax              = 360;
ellipsoid         = [0.0 6378137.0 sqrt(0.006694380022903416) 0.0 0.0];  % Note
                    % the semimajor axis of the numerical eccentricity of the
                    % reference ellipsoid.  Here, we are using GRS80.
GGM_path          = '../data/input/EGM96.mat';
crd               = 0;  % Ellipsoidal coordinates
point_type        = 0;
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      = lat_grd_step;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto07-gravitational-vector-ell-crd';
quantity_or_error = 0;
quantity          = 16;  % Gravity vector; in this case, however,
                         % gravitational vector
fnALFs            = 1;
export_data_txt   = 1;
export_report     = 1;
export_data_mat   = 1;
display_data      = 2;
graphic_format    = 6;
colormap          = 1;
number_of_colors  = 60;
dpi               = 300;
status_bar        = 1;


%%
%
% Do the synthesis
GrafLab('OK', ...
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
    [], ...
    [], ...
    [], ...
    [], ...
    out_path, ...
    quantity_or_error, ...
    quantity, ...
    fnALFs, ...
    [], ...
    export_data_txt, ...
    export_report, ...
    export_data_mat, ...
    display_data, ...
    graphic_format, ...
    colormap, ...
    number_of_colors, ...
    dpi, ...
    status_bar);


%%
%
% The same comment as from the very end of HOWTO NO. 6 applies here, too.

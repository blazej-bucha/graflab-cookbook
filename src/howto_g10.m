%% HOWTO g10: Commission error
%
% You will learn how to compute commission errors from a full covariance matrix
% of spherical harmonic coefficients and how to avoid a common conceptual
% mistake when computing commission errors.
%
%
% All the GrafLab input parameters are explained in <../doc/graflab.md
% ../doc/graflab.md>.


clear; clc; init_checker();


%% Computations of the commission error
%
% The input ASCII file with the error variance-covariance matrix must have the
% structure as shown in Table 3. A binary MAT-file can also be
% imported. However, in this case, the empty arrays in Table 3 must be filled
% with zeroes or corresponding covariances.
%
% Table 3: Structure of the error variance-covariance matrix: spherical
% harmonic coefficients sorted primarily according to orders; the column CS
% determines whether the variance and covariances in the particular line are
% related to the coefficient "Cnm" (if "CS"=0) or to the coefficient "Snm" (if
% "CS"=1)
%
%  ------------------------------------------------------------------------------------------------------------------------
%  CS  n   m   variances and covariances of the spherical harmonic coefficients
%  ------------------------------------------------------------------------------------------------------------------------
%  0   2   0   -4.31E-25
%  0   3   0   -2.11E-26-2.48E-25
%  0   2   1   -3.79E-28-1.15E-27-3.84E-25
%  1   2   1   -3.44E-28-4.67E-28-1.17E-27-4.16E-25
%  0   3   1   -1.99E-27-7.61E-29-2.98E-26-3.18E-28-2.48E-25
%  1   3   1   -1.44E-28-8.80E-29-3.42E-28-2.54E-26-3.16E-27-2.70E-25
%  0   2   2   -8.17E-27-1.72E-27-2.94E-28-3.67E-28-9.06E-29-1.08E-27 4.02E-25
%  1   2   2   -1.14E-27-2.94E-28-5.61E-29-3.86E-28-1.23E-27-1.50E-27-8.37E-28-4.25E-25
%  0   3   2   -9.38E-27-6.35E-27-1.08E-27-1.81E-27-7.12E-28-3.53E-28-3.30E-26-9.75E-29-3.07E-25
%  1   3   2   -1.27E-28-3.45E-27-1.59E-27-7.97E-28-1.75E-28-1.15E-28-5.51E-28-2.30E-26-2.78E-27-3.09E-25
%  0   3   3   -7.74E-28-1.36E-28-9.93E-27-5.50E-28-9.55E-28-3.25E-27-1.06E-27-8.60E-28-2.85E-29-1.58E-28-2.74E-25
%  1   3   3   -1.14E-27-2.19E-28-4.51E-28-1.26E-26-1.46E-28-4.90E-27-1.25E-28-1.76E-28-1.18E-28-5.22E-29-6.97E-29-2.74E-25
%  ------------------------------------------------------------------------------------------------------------------------
%
%
% Define the GrafLab input parameters.
GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 2;  % Important, must be "2" or higher
nmax              = 30;
ellipsoid         = 1;
GGM_path          = '../data/input/GRIM5C1_covmat.mat';
crd               = 0;
point_type        = 0;
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      =   1.0;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto-g10-full';
quantity_or_error = 1;  % Important
quantity          = 5;
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
% You may now want to inspect the output files.  Importantly, this particular
% covariance matrix "GGM_path" is not calibrated (scaled).  As a result, the
% values of the commission errors are off by several orders of magnitudes.
% Nevertheless, the relative spatial relations are correct.
fprintf("The output files are ""%s*"".\n", out_path);


%% Common mistake
%
% It is a common mistake to attempt to compute commission errors from
% a diagonal covariance matrix instead of the full covariance matrix.  This is
% usually done by taking the standard deviations of spherical harmonic
% coefficients from "gfc" files.  The "gfc" file, however, never contains the
% covariances, which, as will be shown in this example, are crucial to get
% meaningful commission errors.


%%
%
% Let's take the covariance matrix "GGM_path", load it, set all non-diagonal
% elements to zero and finally save it to a new file.
cm = load(GGM_path);
cm = cm.covmat;
cm(:, 4:end) = eye(size(cm(:, 4:end))) .* cm(:, 4:end);
save('../data/output/GRIM5C1_covmat_diag.mat', 'cm', '-v7.3');


%%
%
% Now let's repeat the same computation but with the new covariance matrix,
% this time having only the diagonal elements.  Update the GrafLab input
% parameters.
GGM_path = '../data/output/GRIM5C1_covmat_diag.mat';
out_path = '../data/output/howto-g10-diag';


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
% Now compare the commission errors obtained with the full covariance matrix
% and with the diagonal elements only.  It can be seen that the two maps have
% almost nothing in common.  Moreover, it is not difficult to show that the
% diagonal covariance matrix leads to commission errors that are perfectly
% symmetric with respect to the equator, _regardless of the matrix elements_.
% Obviously, this is not at all realistic.
fprintf("The output files are ""%s*"".\n", out_path);

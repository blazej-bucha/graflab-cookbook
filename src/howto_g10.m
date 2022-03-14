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
GGM_path          = '../data/output/GRIM5C1_covmat_diag.mat';
out_path          = '../data/output/howto-g10-diag';


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
fprintf("The maps are available here ""%s*.png""\n", 'howto-g10');

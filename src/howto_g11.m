%% HOWTO g11: A trick with the minimum and the maximum degree of the synthesis
%
% You will learn a trick to work with a GGM, the size of which exceeds your
% RAM.
%
% The main idea is to slice your GGM into several spectral bands (1st band: "0"
% ... "nmax1", 2nd band: "nmax1 + 1" ... "nmax2", 3rd band: "nmax2 + 1"
% ... "nmax3", etc.), each of which is small enough to be stored in RAM at
% once.  Then, you can perform the synthesis for each sliced GGM and, finally,
% sum the syntheses (outside GrafLab) to the get final result.  Certainly, this
% is substantially slower than using a single GGM, so this procedure should be
% avoided whenever possible.  Nonetheless, with high-degree expansions, GGMs
% may require tens of GBs of RAM, so this may be the only option if you do not
% have a sufficient amount of RAM.
%
% To employ this functionality, the input GGM file must be provided as the
% binary "mat" file and must contain three variables:
%
% * a matrix of an arbitrary name (following the MATLAB's rules) with two
% columns specifying the spherical harmonic coefficients, [Cnm Snm]; the
% columns with harmonic degrees and harmonic orders are omitted; the rows of
% the table _must_ follow the structure from "Table 1" from "HOWTO g02" and no
% other ordering scheme is supported (no check on this is performed by
% GrafLab!),
%
% * an integer named as "nmin" specifying the minimum degree of the
% coefficients to be imported,
%
% * an integer names as "nmax" specifying the maximum degree of the
% coefficients to be imported.
%
% All the GrafLab input parameters are explained in <../docs/graflab.md
% ../docs/graflab.md>.


clear; clc; init_checker();


%% Numerical example
%
% A GGM file with an incomplete set of spherical harmonic coefficients can be
% obtained from the enclosed gravity field model "../data/input/EGM96.mat"
% using the following commands:
load('../data/input/EGM96.mat'); % Load EGM96, a gravity model up to degree
                                 % 360.  Importantly, the coefficients are
                                 % stored in agreement with "Table 1".  No
                                 % reordering of the coefficients is therefore
                                 % necessary.
EGM96(EGM96(:, 1) < 100, :) = []; % Delete coefficients below degree 100
EGM96(:, 1:2) = []; % Delete information on degrees and orders
nmin = 100; % Specify the minimum degree of the coefficients
nmax = 360; % Specify the maximum degree of the coefficients

% Finally, save the harmonic band "100" ... "360" of the EGM96 model and
% variables "nmin" and "nmax"
GGM_path = '../data/output/EGM96_nmin100_nmax360.mat';
save(GGM_path, 'EGM96', 'nmin', 'nmax', '-v7.3');


%%
%
% Now define the rest of the GrafLab input parameters.
GM                = 3986004.415E+8;
R                 = 6378136.3;
ellipsoid         = 1;
crd               = 1;
point_type        = 0;
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      =   1.0;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto-g11-sliced';
quantity_or_error = 0;
quantity          = 5;
fnALFs            = 1;
export_data_txt   = 0;
export_report     = 1;
export_data_mat   = 1;
display_data      = 0;
status_bar        = 1;


%%
%
% Do the synthesis.
out_sliced = GrafLab('OK', ...
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
    [], ...
    [], ...
    [], ...
    [], ...
    status_bar);


%%
%
% Now let's do the same synthesis but this time with the original full
% "../data/input/EGM96.mat" model and compare the results with the previous
% synthesis.
GGM_path          = '../data/input/EGM96.mat';
out_path          = '../data/output/howto-g11-full';


%%
%
% Do the synthesis.
out_full = GrafLab('OK', ...
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
    [], ...
    [], ...
    [], ...
    [], ...
    status_bar);


%%
%
% Now compute the RMS between the two syntheses (should be below "10^-14" or
% so).
fprintf("RMS of the differences is ""%0.16e"".\n", rms(out_sliced(:, end) - ...
                                                       out_full(:, end)))

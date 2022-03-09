% HOWTO NO. 3: Gravitational field models
%
% This script shows the GGM formats accepted by GrafLab.
%
% All the GrafLab input parameters are explained in "../doc/graflab.md".


% Intro
% =============================================================================

clear;
clc;


fprintf("===================================================\n");
fprintf("HOWTO03: Gravitational field models\n");
fprintf("===================================================\n");


% Did we execute the "./init.m" script first?
init_checker();

% =============================================================================






% Structure of a global geopotential model (GGM) file
% =============================================================================

% The structure of the GGM coefficients table must follow either "Table 1" or 
% "Table 2".  Any other ordering scheme may not be processed correctly by 
% GrafLab, so is not recommended.
%
%
% Table 1: GGM up to degree "2"
% ----------------------------------------
%   n   m       C_nm           S_nm
% ----------------------------------------
%   0   0    1.00000E+00    0.00000E+00
%   1   0    0.00000E+00    0.00000E+00
%   1   1    0.00000E+00    0.00000E+00
%   2   0   -0.48417E-03    0.00000E+00
%   2   1   -0.20662E-09    0.13844E-08
%   2   2    0.24394E-05   -0.14003E-05
% ----------------------------------------
%
%
% Table 2: GGM up to degree "2"
% ----------------------------------------
%   n   m       C_nm           S_nm
% ----------------------------------------
%   0   0    1.00000E+00    0.00000E+00
%   1   0    0.00000E+00    0.00000E+00
%   2   0   -0.48417E-03    0.00000E+00
%   1   1    0.00000E+00    0.00000E+00
%   2   1   -0.20662E-09    0.13844E-08
%   2   2    0.24394E-05   -0.14003E-05
% ----------------------------------------

% =============================================================================






% MATLAB's binary file format
% =============================================================================

% GGM can be stored in the MATLAB's binary file format.  The "mat" file must 
% store one variable only.  The variable must be a matrix with with the 
% structure as shown in "Table 1" or "Table 2" above.  An example of a valid 
% MATLAB binary file format of a GGM can be found in "../data/input/EGM96.mat" 
% (after you executed the "init.m" script).


GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 0;
nmax              = 'nmaxGGM';
ellipsoid         = 1;  % GRS80
GGM_mat          = '../data/input/EGM96.mat';
crd               = 0;  % Evaluation points are defined in ellipsoidal 
                        % coordinates
point_type        = 0;  % Computation at a grid
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      =   1.0;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = sprintf('../data/output/howto03-table-mat');
quantity_or_error = 0;
quantity          = [5];  % Disturbing potential
fnALFs            = 1;
export_data_txt   = 1;
export_report     = 1;
export_data_mat   = 1;
display_data      = 0;
status_bar        = 1;


fprintf("\n");
fprintf("-----------------------------------------\n");
fprintf("MATLAB binary file ""%s""\n", GGM_mat);
fprintf("-----------------------------------------\n");
fprintf("\n");


% Do the synthesis
out_mat = GrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_mat, ...
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

% =============================================================================






% Text format
% =============================================================================

% This example shows how to import a GGM that obeys the structure of "Table 1" 
% or "Table 2" from a text file.

GGM_txt          = '../data/output/EGM96.txt';
out_path          = sprintf('../data/output/howto03-table-txt');


fprintf("\n");
fprintf("-----------------------------------------\n");
fprintf("Text file ""%s""\n", GGM_txt);
fprintf("-----------------------------------------\n");
fprintf("\n");


% Let's save now the "../data/input/EGM96.mat" file to a text file.  In this 
% way, we obtain a text representation of the binary "mat" file.
fprintf("Converting ""%s"" to a text file ""%s""...\n\n", GGM_mat, GGM_txt);
GGM = load(GGM_mat);
GGM = GGM.EGM96;
save(GGM_txt, 'GGM', '-ascii', '-double');


% Do the synthesis
out_txt = GrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_txt, ...
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


fprintf("\n");
fprintf("The RMS of the difference obtained with GGM from a MATLAB " + ...
        "binary format and a text file is %0.16e\n", rms(out_mat(:, end) - ...
                                                         out_txt(:, end)));
fprintf("\n");

% =============================================================================






% Outro
% =============================================================================

fprintf("===================================================\n");
fprintf("End of HOWTO03\n");
fprintf("===================================================\n");

% =============================================================================

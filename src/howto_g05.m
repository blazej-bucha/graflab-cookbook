%% HOWTO g05: Plotting in GrafLab and the output variable
%
% You will learn how to plot the results of the synthesis with GrafLab and
% about the GrafLab output variable.
%
% Only synthesis at a grid can be plotted with GrafLab.
%
% All the GrafLab input parameters are explained in <../graflab.md
% ../graflab.md>.


%%
%
% Let's start by clearing the workspace, command window and by checking whether
% all input data are available.
clear; clc; init_checker();


%% Plotting with "Mapping Toolbox"
%
% The plots are nice, but the plotting may be very slow for large grids.
%
% Define the GrafLab input parameters.
GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 0;
nmax              = 360;
ellipsoid         = 1;
GGM_path          = '../data/input/EGM96.mat';
crd               = 0;
point_type        = 0;
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      = lat_grd_step;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto-g05-mapping-toolbox';
quantity_or_error = 0;
quantity          = 5;
fnALFs            = 1;
export_data_txt   = 1;
export_report     = 1;
export_data_mat   = 1;
display_data      = 1;  % Use Mapping Toolbox to plot the synthesis
graphic_format    = 6;
colormap          = 1;
number_of_colors  = 60;
dpi               = 300;
status_bar        = 1;


%%
%
% Do the synthesis
tic
out_mt = GrafLab('OK', ...
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
time_mt = toc;


%%
%
% You may now open the following files to see the maps:
fprintf("""%s*.png"".\n", out_path);


%%
%
% The time needed to perform the synthesis and plot the results is:
fprintf("%0.1f sec.\n", time_mt);






%% Plotting with the "imagesc" function
%
% Very simple plots, but also very fast plotting, even with large grids.
%
% Update some of the GrafLab input paramaters.
display_data = 2;  % Use the "imagesc" function to plot the synthesis
out_path     = '../data/output/howto-g05-imagesc';


%%
%
% Do the synthesis
tic;
out_imgsc = GrafLab('OK', ...
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
time_imagsc = toc;


%%
%
% You may now open the following files to see the maps:
fprintf("""%s*.png"".\n", out_path);


%%
%
% The time needed to perform the synthesis and plot the results is (compare
% the time with the Mapping Toolbox):
fprintf("%0.1f sec.\n", time_imagsc);


%% Output variable from GrafLab
%
% You may redirect the numerical outputs from GrafLab to a MATLAB variable.
% The output variable contains the numerical data that GrafLab uses to prepare
% the "txt" and/or "mat" file(s).  Note that the "out_path" must be specified,
% even if you do not export any data or plot.
%
% In this HOWTO, the GrafLab numerical outputs are stored in "out_mt" and
% "out_imgsc" variables.  You may explore these variables now.

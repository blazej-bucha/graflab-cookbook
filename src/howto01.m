% HOWTO NO. 1: Synthesis at grids and at scattered points
%
% All the GrafLab input parameters are explained in "../doc/graflab.md".


clear;
clc;
howto = 1;
intro(howto, "SYNTHESIS AT GRIDS AND AT SCATTERED POINTS", ...
      "This HOWTO demonstrates synthesis at grids and at scattered " + ...
      "points.  The scattered points can either be loaded from an " + ...
      "input file or taken from a MATLAB variable.");






% Synthesis at grids
% =============================================================================

fprintf("\n\n\n\n");
fprintf("-------------------\n");
fprintf("Synthesis at a grid\n");
fprintf("-------------------\n");
fprintf("\n");

GM                = 3986004.415E+8;
R                 = 6378136.3;
nmin              = 0;
nmax              = 360;
ellipsoid         = 1;  % GRS80
GGM_path          = '../data/input/EGM96.mat';
crd               = 0;  % Evaluation points are defined in ellipsoidal 
                        % coordinates
point_type        = 0;  % Computation at a grid
lat_grd_min       = -90.0;
lat_grd_step      =   1.0;
lat_grd_max       =  90.0;
lon_grd_min       =   0.0;
lon_grd_step      = lat_grd_step;
lon_grd_max       = 360.0;
h_grd             =   0.0;
out_path          = '../data/output/howto01-grd';
quantity_or_error = 0;
quantity          = [5];  % Disturbing potential
fnALFs            = 1;
export_data_txt   = 1;
export_report     = 1;
export_data_mat   = 1;
display_data      = 0;
status_bar        = 1;


fprintf("The synthesis is done at a global grid at a ""%0.16e"" deg " + ...
        "spatial resolution (%d points).\n", ...
        lat_grd_step, ...
        length(lat_grd_min:lat_grd_step:lat_grd_max) * ...
        length(lon_grd_min:lon_grd_step:lon_grd_max));
fprintf("\n");


% Do the synthesis
tic
out_grd = GrafLab('OK', ...
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
time_grd = toc;


fprintf("\n");
fprintf("Now you may take a look at the ""%s*"" files.\n\n", out_path);
fprintf("""%s_Report.txt"" summarizes various details of the " + ...
        "synthesis (GGM model path, minimum and maximum degrees of the " + ...
        "synthesis, computation time, etc.).\n\n", out_path);
fprintf("""%s.txt"" is a text file with the numerical outputs of the " + ...
        "synthesis.  Its structure is always explained at the end of " + ...
        "the report file, in this case ""%s_Report.txt"".\n\n", ...
        out_path, out_path);
fprintf("""%s.mat"" is a MATLAB binary file with the numerical outputs " + ...
        "of the synthesis.  The structure is the same as that of the " + ...
        "text file.\n", out_path);


% =============================================================================






% Synthesis at scattered points -- load evaluation points
% =============================================================================

fprintf("\n\n\n\n");
fprintf("-------------------------------------------------------\n");
fprintf("Synthesis at a scattered points loaded from a text file\n");
fprintf("-------------------------------------------------------\n");
fprintf("\n");

point_type       = 1;  % Load evaluation points from a text file
sctr_points_path = '../data/input/input-points.txt';
out_path         = '../data/output/howto01-sctr-load';


fprintf("Five evaluation points will be loaded from ""%s""\n", ...
        sctr_points_path);
fprintf("\n");


% Do the synthesis
out = GrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_path, ...
    crd, ...
    point_type, ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    sctr_points_path, ...
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
fprintf("Now you may want to explore the ""%s*"" files.\n\n", out_path);

% =============================================================================






% Synthesis at scattered points -- take evaluation points from MATLAB variables
% =============================================================================

fprintf("\n\n\n\n");
fprintf("------------------------------------------------------------\n");
fprintf("Synthesis at a scattered points taken from a MATLAB variable\n");
fprintf("------------------------------------------------------------\n");
fprintf("\n");

point_type = 2;  % Define evaluation points from MATLAB variables
out_path   = '../data/output/howto01-sctr-var';


% Let's take the grid points from the evaluation at a grid, consider them as 
% scattered points and pass them to GrafLab.
[lon_sctr, lat_sctr] = meshgrid(lon_grd_min:lon_grd_step:lon_grd_max, ...
                                lat_grd_min:lat_grd_step:lat_grd_max);
lat_sctr = lat_sctr(:);
lon_sctr = lon_sctr(:);
h_sctr   = zeros(length(lat_sctr), 1);


fprintf("Taking the %d grid points from the synthesis at a grid " + ...
        "and considering them as scattered points.  The results " + ...
        "should be the same as that from the grid synthesis.\n", ...
        length(lat_sctr));
fprintf("\n");


% Do the synthesis
tic
out_sctr = GrafLab('OK', ...
    GM, ...
    R, ...
    nmin, ...
    nmax, ...
    ellipsoid, ...
    GGM_path, ...
    crd, ...
    point_type, ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    [], ...
    lat_sctr, ...
    lon_sctr, ...
    h_sctr, ...
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
time_sctr = toc;


fprintf("\n");
fprintf("Did you notice how slow was the synthesis at scattered points, " +...
        "despite using the same number of points as in the example with " + ...
        "a grid?  GrafLab performs the grid-wise synthesis using an " + ...
        "efficient FFT-based algorithm.  This technique cannot be used, " + ...
        "however, with scattered points, so the synthesis is done " + ...
        "point-by-point which is very slow.\n");
fprintf("The grid-wise synthesis took %0.3f sec, while the " + ...
        "point-by-point synthesis took %0.3f sec.  " + ...
        "With increasing number of evaluation points and maximum degree " + ...
        "of the synthesis, the point-wise synthesis becomes " + ...
        "substantially slower than the grid-wise synthesis.\n", ...
        time_grd, time_sctr);


fprintf("\n");
fprintf("Now let's compute the RMS of the differences between the " + ...
        "synthesis at a grid and at scattered points.  The RMS is " + ...
        "%0.16e which confirms that both approaches yield the same ", ...
        "results.\n", rms (out_grd(:, end) - out_sctr(:, end)));


fprintf("\n");
fprintf("Now you may want to explore the ""%s*"" files.\n\n", out_path);

% =============================================================================






outro(howto);

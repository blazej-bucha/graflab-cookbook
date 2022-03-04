% Dowloads GrafLab, isGrafLab and some input data files.
%
% The script *must* be executed before running any of the HOWTOs.


fprintf("Executing the ""init.m"" script...\n");


fprintf("Cleaning the workspace... ");
clear;
fprintf("Done\n");


% Path to save source codes
SRC_DIR  = ".";


% Path to save some input data
DATA_DIR = "../data/input";


fprintf("Downloading GrafLab... ");
unzip("https://blazejbucha.com/graflab/GrafLab.zip", SRC_DIR);
fprintf("Done\n");


fprintf("Downloading GrafLab test data... ");
unzip("https://blazejbucha.com/graflab/test_data_GrafLab.zip", DATA_DIR);
fprintf("Done\n");


fprintf("Downloading GrafLab... ");
unzip("https://blazejbucha.com/isgraflab/isGrafLab.zip", SRC_DIR);
fprintf("Done\n");


fprintf("Downloading GrafLab test data... ");
unzip("https://blazejbucha.com/isgraflab/test_data_isGrafLab.zip", DATA_DIR);
fprintf("Done\n");


fprintf("Downloading GOCO06s... ");
websave(sprintf("%s/GOCO06s", DATA_DIR), ...
        "http://icgem.gfz-potsdam.de/getmodel/gfc/" + ...
        "32ec2884630a02670476f752d2a2bf1c395d8c8d6d768090ed95b4f" + ...
        "04b0d5863/GOCO06s.gfc");
fprintf("Done\n");


fprintf("Great, all done!\n");
fprintf("You are now ready to run the HOWTOs from " + ...
        "the ""./src/howtos"" dir if you like.\n");

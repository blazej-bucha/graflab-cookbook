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


fprintf("Downloading GO_CONS_GCF_2_TIM_R6... ");
websave(sprintf("%s/GO_CONS_GCF_2_TIM_R6.gfc", DATA_DIR), ...
        "http://icgem.gfz-potsdam.de/getmodel/gfc/" + ...
        "48b3a4a83f17db2621744774a594ce60f2f8583847e2330a1e" + ...
        "08f036483a24de/GO_CONS_GCF_2_TIM_R6.gfc");
fprintf("Done\n");


fprintf("Great, all done!\n");
fprintf("You are now ready to run the HOWTOs from " + ...
        "the ""./src/howtos"" dir if you like.\n");

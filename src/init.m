% Dowloads GrafLab, isGrafLab and some input data files.
%
% The script *must* be executed before running any of the HOWTOs.


fprintf("Executing the ""init.m"" script...\n");


fprintf("Cleaning the workspace... ");
clear;
fprintf("Done\n");


% Top directory of the repository
TOP_DIR  = "../";


% Path to save source codes
SRC_DIR  = ".";


% Path to save some input data
DATA_DIR = "../data/input";


fprintf("Downloading GrafLab to the top directory of the repository... ");
unzip("https://github.com/blazej-bucha/graflab/archive/refs/heads/master.zip", TOP_DIR);
fprintf("Done\n");


fprintf("Downloading isGrafLab to the top directory of the repository... ");
unzip("https://github.com/blazej-bucha/isgraflab/archive/refs/heads/master.zip", TOP_DIR);
fprintf("Done\n");


fprintf("Downloading GO_CONS_GCF_2_TIM_R6 to ""%s""... ", DATA_DIR);
websave(sprintf("%s/GO_CONS_GCF_2_TIM_R6.gfc", DATA_DIR), ...
        "http://icgem.gfz-potsdam.de/getmodel/gfc/" + ...
        "48b3a4a83f17db2621744774a594ce60f2f8583847e2330a1e" + ...
        "08f036483a24de/GO_CONS_GCF_2_TIM_R6.gfc");
fprintf("Done\n");


fprintf("Copying GrafLab and isGrafLab source files to this directory...");
copyfile("../graflab-master/src/GrafLab.m", ".");
copyfile("../isgraflab-master/src/isGrafLab.m", ".");
fprintf("Done\n");


fprintf("Great, all done!  You are now ready to run the HOWTOs " + ...
        "if you like.\n");

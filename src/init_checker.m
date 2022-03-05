function init_checker()
% Checks the presence of the files downloaded by "./init.m".  If any file is 
% missing, an error is thrown.


% List of files to be checked
file(1)  = "./GrafLab.m";
file(2)  = "./isGrafLab.m";
file(3)  = "../data/input/DTM2006.mat";
file(4)  = "../data/input/EGM96.mat";
file(5)  = "../data/input/GOCO06s.gfc";
file(6)  = "../data/input/GRIM5C1_covmat.mat";
file(7)  = "../data/input/input-points.txt";
file(8)  = "../data/input/input-dem.txt";
file(9)  = "../data/input/output_EGM96.txt";
file(10) = "../data/input/output_GRIM5C1.txt";
file(11) = "../data/input/output.txt";


err = 0;
for n = 1:length(file)
    if (exist(file(n)) == 0)
        fprintf("""%s"" not found...\n", file(n));
        err = err + 1;
    end
end


assert(err == 0, ...
       "Couldn't find some files.  " + ...
       "Did you execute the initialization script ""./init.m"" first?");


end

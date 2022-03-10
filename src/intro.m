function intro(n, title, description)


fprintf("===================================================\n");
fprintf("HOWTO%02d: %s\n\n%s\n", n, title, description);
fprintf("===================================================\n");


% Did we execute the "./init.m" script first?
init_checker();


end
